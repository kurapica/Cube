---------------------------------------------------------------------------------------------------
-- Debug Frame Script
---------------------------------------------------------------------------------------------------

-- Addon Initialize
IGAS:NewAddon "Cube.Mdl_Cube_Debug"

_G = _G
format = string.format

index = 0
_SelectNode = nil

-- Addon
_Addon.OnSlashCmd = _Addon.OnSlashCmd + function(self, option)
	if option and strupper(option) == "DEBUG" then
		Cube_Debug.Visible = true
		return true
	end
end

function txtIn:OnEnterPressed()
	local func, rs, text
	local view, node

	if txtIn.Text ~= "" then
		func = loadstring("return "..txtIn.Text)
		if func then
			func, rs = pcall(func)
		end
	end

	txtIn:ClearFocus()

	return newView(txtIn.Text, rs)
end

function timer:OnTimer()
	self.Parent.Message = ""
	self.Interval = 0
end

function Cube_Debug:OnHide()
	Menu.Visible = false
end

function Menu:OnShow()
	local node = self.Owner

	if node.Level ~= 1 and type(node.MetaData.Value) == "table" then
		-- this is not first node
		mnuShow:Enable()
		mnuDel:Enable()
	else
		mnuShow:Disable()
		mnuDel:Disable()
	end

	if node.MetaData.IsNameSpace then
		mnuShow:Enable()
		mnuDel:Disable()
		mnuShowMeta:Disable()
		mnuShowKey:Disable()
	else
		mnuDel.Enabled = (node.Level ~= 1)

		if getmetatable(node.MetaData.Value) then
			mnuShowMeta:Enable()
		else
			mnuShowMeta:Disable()
		end
		if type(node.MetaData.Key) == "table" then
			mnuShowKey:Enable()
		else
			mnuShowKey:Disable()
		end
	end
end

function mnuShow:OnClick()
	local node = Menu.Owner

	return newView(GetTitle(node), node.MetaData.Value)
end

function mnuShowMeta:OnClick()
	local node = Menu.Owner
	local text = GetTitle(node)
	local value = node.MetaData.Value

	if type(getmetatable(value)) == "table" then
		value = getmetatable(value)
		text = "getmetatable("..text..")"

		return newView(text, value)
	end
end

function mnuShowKey:OnClick()
	local node = Menu.Owner
	local value = node.MetaData.Key
	local text = tostring(value)

	return newView(text, value)
end

function mnuDel:OnClick()
	local delNode = Menu.Owner

	if delNode then
		if IGAS:MsgBox(L["Are you sure to delete this key?"], "c") then
			delNode.Parent.MetaData.Value[delNode.MetaData.Key] = nil
			delNode:Dispose()
		end
	end
end

function btnCommit:OnClick()
	local modNode = _SelectNode
	local modValue

	if not modNode then return end

	if btnCommit.Text == L["Resume"] then
		local v = _SelectNode.MetaData.Value

		if type(v) ~= "thread" then return end

		coroutine.resume(v)
		btnCommit.Visible = (coroutine.status(v) == "suspended")

		return
	end

	modValue = GetModValue()

	if modValue ~= _SelectNode.MetaData.Value then
		if IGAS:MsgBox(L["Are you sure to change the value?"], "c") then
			if modValue ~= nil then
				modNode.MetaData.Value = modValue
				modNode.Parent.MetaData.Value[modNode.MetaData.Key] = modValue
			else
				modNode.Parent.MetaData.Value[modNode.MetaData.Key] = nil
				modNode:Dispose()
				modNode = nil
				return
			end
			modNode.Root:SuspendLayout()
			UpdateChild(modNode)
			modNode.Root:ResumeLayout()
		end
	end
end

function code:OnClick()
	if Cube_Debug.Parent:GetChild("Cube_Main") then
		Cube_Debug.Parent:GetChild("Cube_Main").Visible = true
	end
end

function bugList:OnClick()
	if Cube_Debug.Parent:GetChild("Cube_BugList") then
		Cube_Debug.Parent:GetChild("Cube_BugList").Visible = true
	end
end

-- Scripts
function Format(i, v)
	local value = ""

	if v and type(v) == "userdata" then
		return tostring(i), tostring(i)
	end

	if i == nil then
		return "", ""
	elseif type(i) == "string" then
		value = string.format("%q", i)
	else
		value = tostring(i)
	end

	if v and type(v) == "table" and getmetatable(v) then
		return "\124cff1eff00[M]\124h\124r"..value, value
	else
		return value, value
	end
end

function GetTitle(node)
	local text = ""

	if not node then
		return text
	end

	while node.Level > 1 do
		if type(node.MetaData.Key) == "string" then
			text = ("[\"%s\"]"):format(node.MetaData.Key)..text
		elseif node.MetaData.Key then
			text = ("[%s]"):format(tostring(node.MetaData.Key))..text
		elseif node.MetaData.Method then
			text = (":%s()"):format(tostring(node.MetaData.Method))..text
		end

		node = node.Parent
	end

	text = node.MetaData.Key..text

	return text
end

function GetModValue()
	local code = "return "..(txtValue.Text or "")

	local func, err
	local t

	func, err = loadstring(code)
	if func then
		return func()
	end
end

function UpdateType(node)
	local v = node and node.MetaData.Value

	_SelectNode = node

	txtValue:ClearFocus()
	txtValue.Text = ""
	txtIn.Text = GetTitle(node)

	btnCommit.Text = L["Commit"]

	if type(node.Parent.MetaData.Value) == "userdata" or not node.Menu then
		if type(v) == "string" then
			txtValue.Visible = true
			txtValue.MouseEnabled = true

			txtValue.Text = format("%q", v)
		elseif type(v) == "number" or type(v) == "boolean" then
			txtValue.Visible = true
			txtValue.MouseEnabled = true

			txtValue.Text = tostring(v)
		else
			txtValue.Text = ""
			txtValue.Visible = false
		end
		btnCommit.Visible = false
	elseif type(v) == "string" then
		txtValue.Visible = true
		txtValue.MouseEnabled = true
		btnCommit.Visible = true
		txtValue.Text = format("%q", v)
	elseif type(v) == "table" or type(v) == "function" or type(v) == "userdata" then
		txtValue.Visible = true
		txtValue.MouseEnabled = false
		btnCommit.Visible = false
		if v == _G then
			txtValue.Text = "_G"
		else
			txtValue.Text = tostring(v)
		end
	elseif type(v) == "number" or type(v) == "boolean" then
		txtValue.Visible = true
		txtValue.MouseEnabled = true
		btnCommit.Visible = true
		txtValue.Text = tostring(v)
	elseif type(v) == "thread" then
		txtValue.Visible = true
		txtValue.MouseEnabled = false
		btnCommit.Visible = (coroutine.status(v) == "suspended")
		btnCommit.Text = L["Resume"]
		txtValue.Text = tostring(v)
	else
		txtValue.Visible = false
		btnCommit.Visible = false
	end
end

function UpdateChild(node)
	local chNode, text, value, isThread

	if not node or node.CanToggle then return end

	if node.MetaData.IsNameSpace then
		local subNS = System.Reflector.GetSubNamespace(node.MetaData.Value)
		local cls, objType, extends
		local name

		-- Super Class
		cls = System.Reflector.GetSuperClass(node.MetaData.Value)
		if cls then
			objType = System.Reflector.GetType(cls)
			name = System.Reflector.GetName(cls)

			if cls then
				chNode = node:AddNode{Text = "\124cff1eff00[Super " .. ( objType or "NS" ) .. "]\124h\124r" ..  name, Value = cls, Key = name, IsNameSpace = true, Type = objType}

				chNode.Menu = Menu
			end
		end

		-- Extend interface
		extends = System.Reflector.GetExtendInterfaces(node.MetaData.Value)
		if extends then
			for _, int in ipairs(extends) do
				objType = System.Reflector.GetType(int)
				name = System.Reflector.GetName(int)

				if int then
					chNode = node:AddNode{Text = "\124cff1eff00[Extend " .. ( objType or "NS" ) .. "]\124h\124r" ..  name, Value = int, Key = name, IsNameSpace = true, Type = objType}

					chNode.Menu = Menu
				end
			end
		end

		-- Sub class
		if subNS then
			for _, name in ipairs(subNS) do
				cls = System.Reflector.ForName(System.Reflector.GetFullName(node.MetaData.Value) .. "." .. name)
				objType = System.Reflector.GetType(cls)

				if cls then
					chNode = node:AddNode{Text = "\124cff1eff00[" .. ( objType or "NS" ) .. "]\124h\124r" .. name, Value = cls, Key = name, IsNameSpace = true, Type = objType}

					chNode.Menu = Menu
				end
			end
		end

		-- No menu
		if node.MetaData.Type == "Class" or node.MetaData.Type == "Interface" then
			-- Script
			node:AddNode{Text = "Script", Value = System.Reflector.GetScripts(node.MetaData.Value, true), Key = "Script"}
			-- Method
			node:AddNode{Text = "Method", Value = System.Reflector.GetMethods(node.MetaData.Value, true), Key = "Method"}
			-- Property
			subNS = System.Reflector.GetProperties(node.MetaData.Value, true)
			local props = {}
			local types
			local info = {}

			for _, prop in ipairs(subNS) do
				types = System.Reflector.GetPropertyType(node.MetaData.Value, prop)

				wipe(info)

				if types then
					for _, ns in ipairs(types) do
						ns = System.Reflector.GetFullName(ns)
						if ns then
							tinsert(info, ns)
						end
					end

					if types:Is(nil) then
						tinsert(info, "nil")
					end
				end

				props[prop] = table.concat(info, " | ")
			end

			node:AddNode{Text = "Property", Value = props, Key = "Property"}
		elseif node.MetaData.Type == "Enum" then
			local enums = System.Reflector.GetEnums(node.MetaData.Value)

			if enums then
				for _, name in ipairs(enums) do
					node:AddNode{Text = name, Value = node.MetaData.Value[name], Key = name}
				end
			end
		elseif node.MetaData.Type == "Struct" then
			local parts = System.Reflector.GetStructParts(node.MetaData.Value)
			local info = {}
			local types

			if parts then
				for _, name in ipairs(parts) do
					types = System.Reflector.GetStructPart(node.MetaData.Value, name)

					wipe(info)

					if types then
						for _, ns in ipairs(types) do
							ns = System.Reflector.GetFullName(ns)
							if ns then
								tinsert(info, ns)
							end
						end

						if types:Is(nil) then
							tinsert(info, "nil")
						end
					end

					node:AddNode{Text = name, Value = table.concat(info, " | "), Key = name}
				end
			end

			info = nil
		end
	elseif type(node.MetaData.Value) == "table" and next(node.MetaData.Value) and node.MetaData.Value ~= _G then
		for i, v in pairsByKeys(node.MetaData.Value) do
			chNode = nil

			if type(i) == "thread" then
				isThread = true
			else
				isThread = false
			end

			text = tostring(i)
			if type(v) == "string" and type(i) == "number" then
				text = text .. " : " .. v
			end

			if type(v) == "table" and type(v[0]) == "userdata" and v.GetObjectType and v.GetName and IGAS:GetUI(v) == v then
				text = text .. " \124cff1eff00[T]\124h\124r" .. (v:GetObjectType() or "NoType") .. " \124cff1eff00[N]\124h\124r" .. (v:GetName() or "nil")
			end

			if type(v) ~= "string" and getmetatable(v) then
				chNode = node:AddNode{Text = "\124cff1eff00[M]\124h\124r"..text, Value = v, Key = i}
			else
				chNode = node:AddNode{Text = text, Value = v, Key = i}
			end

			if chNode then
				if isThread then
					chNode.FunctionName = L["Resume"]
				end
				if node.Menu then
					chNode.Menu = Menu
				end
			end
		end

		if type(node.MetaData.Value[0]) == "userdata" and (node.MetaData.Value.GetRegions or node.MetaData.Value.GetChildren) and IGAS:GetUI(node.MetaData.Value) == node.MetaData.Value then
			if node.MetaData.Value.GetRegions then
				local lst = {node.MetaData.Value:GetRegions()}

				if #lst > 0 then
					chNode = node:AddNode{Text = "Regions", Value = lst, Method = "GetRegions"}	
				end
			end

			if node.MetaData.Value.GetChildren then
				local lst = {node.MetaData.Value:GetChildren()}

				if #lst > 0 then
					chNode = node:AddNode{Text = "Children", Value = lst, Method = "GetChildren"}	
				end
			end
		end
	end
end

function OnNodeSelected(self, node)
	return UpdateType(node)
end

function OnNodeToggle(self, node)
	if node.ToggleState then
		-- Update Child
		node.Root:SuspendLayout()
		for i = 1, node.ChildNodeCount do
			UpdateChild(node:GetNode(i))
		end
		node.Root:ResumeLayout()
	end
end

function OnNodeFunctionClick(self, func, node)
	if node and func == L["Resume"] then
		if type(node.MetaData.Key) == "thread" then
			coroutine.resume(node.MetaData.Key)
			if coroutine.status(node.MetaData.Key) ~= "suspended" then
				node.FunctionName = nil
			end
		end
	end
end

function newView(text, value)
	local isNameSpace, objType

	isNameSpace = type(value) == "userdata" and System.Reflector.IsNameSpace(value)
	if isNameSpace then objType = System.Reflector.GetType(value) end

	if not isNameSpace and type(value) ~= "table" then
		Cube_Debug.Message = L["Value is not table."]
		timer.Interval = 2
		return
	end

	if value == _G then
		Cube_Debug.Message = L["Not support for _G."]
		timer.Interval = 2
		return
	end

	index = index + 1

	local view = TreeView("View"..index, tabF)

	tabF:AddWidget(view, text:match("[_%w]+$") or text:match("%\[\"([_%w]+)\"\]$"))

	local node

	view.Style = "SMOOTH"

	view.OnNodeSelected = OnNodeSelected
	view.OnNodeToggle = OnNodeToggle
	view.OnNodeFunctionClick = OnNodeFunctionClick

	tabF:SelectWidget(view)

	if isNameSpace then
		node = view:AddNode{Text = "\124cff1eff00[" .. ( objType or "NS" ) .. "]\124h\124r" .. text, Value = value, Key = text, IsNameSpace = isNameSpace, Type = objType}
	elseif getmetatable(value) then
		node = view:AddNode{Text = "\124cff1eff00[M]\124h\124r"..text, Value = value, Key = text}
	else
		node = view:AddNode{Text = text, Value = value, Key = text}
	end
	node.Menu = Menu
	node.Root:SuspendLayout()
	UpdateChild(node)
	node.Root:ResumeLayout()
	node:Select()

	return view
end
