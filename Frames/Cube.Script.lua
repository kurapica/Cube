---------------------------------------------------------------------------------------------------
-- Cube Frame Script
---------------------------------------------------------------------------------------------------

-- Addon Initialize
IGAS:NewAddon "Cube.Mdl_Cube_Main"

local _LoadedModule = setmetatable({}, {__mode = "k"})

local lUnit = _Addon:GetModule("lUnit")

-- Script
_Addon.OnSlashCmd = _Addon.OnSlashCmd + function(self, option)
	if option and strupper(option) == "CODE" then
		Cube_Main.Visible = true
		return true
	end
end

function _M:OnLoad()
	_PlayerName = GetRealmName().."-"..GetUnitName("player")

	CubeSave.CodeTree = CubeSave.CodeTree or {
		{
			Text = "Snippet",
			FunctionName = "Add",
			ChildOrderChangable = true,
			Childs = {},
		},
		{
			Text = "Addon",
			FunctionName = "Add",
			ChildOrderChangable = true,
			Childs = {},
		},
	}

	-- import data from the previous version
	if type(CubeSave.CodeList) == "table" then
		for i, v in pairs(CubeSave.CodeList) do
			if type(i) == "string" and type(v) == "string" then
				tinsert(CubeSave.CodeTree[1].Childs, {Text = i, Content = v, FunctionName = "Del",})
			end
		end

		CubeSave.CodeList = nil
	end

	fileTree:SetTree(CubeSave.CodeTree)
	fileTree:GetNode(1).ToggleState = true
	
	code:RegisterControlKey("S")
	
	chkShowRow.Checked = not CubeSave.NotShowRowNumber
	code.ShowLineNumber = not CubeSave.NotShowRowNumber
	
	if CubeSave.CubeMainSize then
		Cube_Main.Size = CubeSave.CubeMainSize
	end
	
	if CubeSave.CubeMainLocation then
		Cube_Main.Location = CubeSave.CubeMainLocation
	end
end

function Cube_Main:OnSizeChanged()
	CubeSave.CubeMainSize = self.Size
end

function Cube_Main:OnPositionChanged()
	CubeSave.CubeMainLocation = self.Location
end

function toggleBtn:OnClick()
	if fileTree.Visible then
		fileTree.Visible = false
		toggleBtn:SetNormalTexture("Interface\\BUTTONS\\UI-SpellbookIcon-PrevPage-Up")
		toggleBtn:SetPushedTexture("Interface\\BUTTONS\\UI-SpellbookIcon-PrevPage-Down")
		toggleBtn:SetDisabledTexture("Interface\\BUTTONS\\UI-SpellbookIcon-PrevPage-Disabled")
		toggleBtn:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
	else
		fileTree.Visible = true
		toggleBtn:SetNormalTexture("Interface\\BUTTONS\\UI-SpellbookIcon-NextPage-Up")
		toggleBtn:SetPushedTexture("Interface\\BUTTONS\\UI-SpellbookIcon-NextPage-Down")
		toggleBtn:SetDisabledTexture("Interface\\BUTTONS\\UI-SpellbookIcon-NextPage-Disabled")
		toggleBtn:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
	end
end

function _M:OnEnable()
	if initTimer then
		initTimer.Interval = 3
	end
end

function fileTree:OnNodeSelected(node)
	code.Text = node.MetaData.Content or ""

	if node.Level == 2 then
		chkAuto.Visible = true
		chkAuto.Text = L["AutoRun"]
		chkAuto.Checked = node.MetaData[_PlayerName]
	elseif node.Level > 2 then
		chkAuto.Visible = true
		chkAuto.Text = L["Disable"]
		chkAuto.Checked = node.MetaData[_PlayerName]
	else
		chkAuto.Visible = false
		chkAuto.Checked = false
	end

	titleModule.Text = GetTitle(node)

	Cube_Main.Message = ""
	lstUnitTest.Visible = false
	frmResult.Visible = false
end

function fileTree:OnNodeFunctionClick(func, node)
	if func == "Del" then
		if IGAS:MsgBox(L["Do you want delete %s."]:format(GetTitle(node)), "n") then
			node:Dispose()
		end
	elseif func == "Add" then
		if node.Level == 1 then
			if node.Index == 1 then
				local name = IGAS:MsgBox(L["Please input the snipet's name"], "ic")
				
				if type(name) == "string" then
					name = strtrim(name)

					local parent = fileTree:GetNode(1)

					for i = 1, parent.ChildNodeCount do
						if parent:GetNode(i).Text == name then
							return parent:GetNode(i):Select()
						end
					end

					local node = parent:AddNode{Text = name, Content = "", FunctionName = "Del",}

					return node:Select()
				end
			else
				local name = IGAS:MsgBox(L["Please input the addon's name"], "ic")
				
				if type(name) == "string" then
					name = strtrim(name)

					local parent = fileTree:GetNode(2)

					for i = 1, parent.ChildNodeCount do
						if parent:GetNode(i).Text == name then
							return parent:GetNode(i):Select()
						end
					end

					local node = parent:AddNode{Text = name, Content = ("IGAS:NewAddon \"%s\"\n\n"):format(name), FunctionName = "Del,Add", ChildOrderChangable = true, }

					return node:Select()
				end
			end
		else
			local name = IGAS:MsgBox(L["Please input the module's name"], "ic")
			
			if type(name) == "string" then
				name = strtrim(name)

				local parent = node

				for i = 1, parent.ChildNodeCount do
					if parent:GetNode(i).Text == name then
						return parent:GetNode(i):Select()
					end
				end

				node = parent:AddNode{Text = name, Content =  ("IGAS:NewAddon \"%s.%s\"\n\n"):format(GetTitle(parent), name), FunctionName = "Del,Add", ChildOrderChangable = true, }

				return node:Select()
			end
		end
	elseif func == "Enable" then
		if node.Level == 2 then
			return EnableAddon(node, true)
		else
			return EnableModule(node, true)
		end
	elseif func == "Disable" then
		if node.Level == 2 then
			return EnableAddon(node, false)
		else
			return EnableModule(node, false)
		end
	end
end

function chkAuto:OnValueChanged(value)
	if fileTree.SelectedNode and fileTree.SelectedNode.Level > 1 then
		fileTree.SelectedNode.MetaData[_PlayerName] = value or nil
	end
end

function chkShowRow:OnValueChanged(value)
	CubeSave.NotShowRowNumber = not value
	code.ShowLineNumber = not CubeSave.NotShowRowNumber
end

function initTimer:OnTimer()
	local node, subNode

	self.Interval = 0

	-- Loading Common code
	node = fileTree:GetNode(1)

	for i = 1, node.ChildNodeCount do
		subNode = node:GetNode(i)
		if subNode.MetaData[_PlayerName] then
			LoadSnippet(subNode)
		end
	end

	-- Loading Addon code
	node = fileTree:GetNode(2)

	for i = 1, node.ChildNodeCount do
		subNode = node:GetNode(i)
		LoadAddon(subNode)
		EnableAddon(subNode)
	end

	self:Dispose()

	initTimer = nil
end

function reset:OnClick()
	return fileTree.SelectedNode and fileTree:OnNodeSelected(fileTree.SelectedNode)
end

function save:OnClick()
	if fileTree.SelectedNode and fileTree.SelectedNode.Level > 1 then
		fileTree.SelectedNode.MetaData.Content = code.Text
	else
		Cube_Main.Message = L["Can't save code."]
	end
end

function run:OnClick()
	Cube_Main.Message = ""
	lstUnitTest.Visible = false
	frmResult.Visible = false

	local func, err, status

	if code.Text ~= "" then		
		func, err = loadstring(code.Text)

		if func then
			status, err = pcall(func)

			if not status then
				frmResult.Visible = true
				frmResult:ClearAllPoints()
				frmResult:SetPoint("TOPLEFT", Cube_Main, "TOPRIGHT")
				txtResult.Text = GetErrMsg(err)
			end
		else
			frmResult.Visible = true
			frmResult:ClearAllPoints()
			frmResult:SetPoint("TOPLEFT", Cube_Main, "TOPRIGHT")
			txtResult.Text = GetErrMsg(err)
		end
	end

	local node = fileTree.SelectedNode

	if not node then return end

	if node.Level == 2 and node.Parent.Index == 2 then
		_LoadedModule[node] = _LoadedModule[node] or IGAS(GetTitle(node))
		if _LoadedModule[node]:IsEnabled() then
			node.FunctionName = "Del,Add,Disable"
		else
			node.FunctionName = "Del,Add,Enable"
		end
	elseif node.Level > 2 then
		_LoadedModule[node] = _LoadedModule[node] or IGAS(GetTitle(node))
		if _LoadedModule[node]:IsEnabled() then
			node.FunctionName = "Del,Add,Disable"
		else
			node.FunctionName = "Del,Add,Enable"
		end
	end
end

function btnUnit:OnClick()
	Cube_Main.Message = ""

	local sm

	if code.Text ~= "" then
		lstUnitTest.Report = lUnit.Run(code.Text)

		lstUnitTest:Clear()
		lstUnitTest.Visible = true
		lstUnitTest:SuspendLayout()
		for func, msg in pairsByKeys(lstUnitTest.Report) do
			if next(msg) then
				sm = RED..func.." : ERR!"
			else
				sm = GRN..func.." : Ok!"
			end
			lstUnitTest:AddItem(func, sm)
		end
		lstUnitTest:ResumeLayout()

		frmResult.Visible = true
		frmResult:ClearAllPoints()
		frmResult:SetPoint("TOPLEFT", Cube_Main, "TOPRIGHT")
	end
end

function lstUnitTest:OnItemChoosed(key, text)
	if lstUnitTest.Report[key] and next(lstUnitTest.Report[key]) then
		txtResult.Text = table.concat(lstUnitTest.Report[key], "\n\n")
	else
		txtResult.Text = ""
	end
end

function lstUnitTest:OnShow()
	txtResult:SetPoint("TOPLEFT", lstUnitTest, "TOPRIGHT")
end

function lstUnitTest:OnHide()
	txtResult:SetPoint("TOPLEFT", frmResult, "TOPLEFT", 4, -20)
end

function debug:OnClick()
	if Cube_Main.Parent:GetChild("Cube_Debug") then
		Cube_Main.Parent:GetChild("Cube_Debug").Visible = true
	end
end

function bugList:OnClick()
	if Cube_Main.Parent:GetChild("Cube_BugList") then
		Cube_Main.Parent:GetChild("Cube_BugList").Visible = true
	end
end

function cubeLog:OnClick()
	frmLog.Visible = not frmLog.Visible
end

function code:OnFunctionKey(key)
    if key == "F5" then
        run:OnClick()
    end
end

function code:OnControlKey(key)
	if key and string.upper(key) == "S" then
		if fileTree.SelectedNode and fileTree.SelectedNode.Level > 1 then
			fileTree.SelectedNode.MetaData.Content = code.Text
			Cube_Main.Message = L["Snippet is saved."]
		else
			Cube_Main.Message = L["Can't save code."]
		end
	end
end

function GetTitle(node)
	if node.Level == 2 and node.Parent.Index == 1 then
		return node.MetaData.Text
	elseif node.Level >= 2 then
		local text = node.MetaData.Text

		while node.Level > 2 do
			node = node.Parent

			text = node.MetaData.Text.."."..text
		end

		return text
	end

	return ""
end

function AddModule(name)
	
end

function errorhandler(err)
	return geterrorhandler and geterrorhandler()(err)
end

function LoadCode(code)
	if type(code) ~= "string" then
		return
	end

	local func, err = loadstring(code)

	if func then
		func, ret = pcall(func)

		if func then
			return true
		end
	end

	if err then
		errorhandler(err)
	end
end

function LoadSnippet(node)
	Log(2, "Loading Snippet......%s", GetTitle(node))

	LoadCode(node.MetaData.Content)
end

function LoadModule(node)
	local subNode
	local parentLoaded = _LoadedModule[node.Parent] or _LoadedModule[node.Parent] and true

	_LoadedModule[node] = nil
	node.FunctionName = "Del,Add"

	if parentLoaded and not node.MetaData[_PlayerName] then
		Log(2, "Loading Module......%s", GetTitle(node))

		LoadCode(node.MetaData.Content)

		_LoadedModule[node] = IGAS(GetTitle(node))
	end

	for i = 1, node.ChildNodeCount do
		subNode = node:GetNode(i)
		LoadModule(subNode)
	end
end

function LoadAddon(node)
	local subNode

	node.FunctionName = "Del,Add"

	_LoadedModule[node] = nil
	
	-- Loading
	if node.MetaData[_PlayerName] then
		Log(2, "Loading Addon......%s", GetTitle(node))

		LoadCode(node.MetaData.Content)

		_LoadedModule[node] = IGAS(GetTitle(node))
	end

	for i = 1, node.ChildNodeCount do
		subNode = node:GetNode(i)
		LoadModule(subNode)
	end

end

function EnableModule(node, flag)
	if _LoadedModule[node] then
		if flag == nil then _LoadedModule[node]:Fire("OnLoad") end

		if flag == false then
			_LoadedModule[node]:Disable()
		elseif flag == true then
			_LoadedModule[node]:Enable()
		end

		if _LoadedModule[node]:IsEnabled() then
			if flag == nil then _LoadedModule[node]:Fire("OnEnable") end
			node.FunctionName = "Del,Add,Disable"
		else
			if flag == nil then _LoadedModule[node]:Fire("OnDisable") end
			node.FunctionName = "Del,Add,Enable"
		end
	end

	for i = 1, node.ChildNodeCount do
		subNode = node:GetNode(i)
		EnableModule(subNode, flag)
	end
end

function EnableAddon(node, flag)
	if _LoadedModule[node] then
		if flag == nil then _LoadedModule[node]:Fire("OnLoad") end

		if flag == false then
			_LoadedModule[node]:Disable()
		elseif flag == true then
			_LoadedModule[node]:Enable()
		end

		if _LoadedModule[node]:IsEnabled() then
			if flag == nil then _LoadedModule[node]:Fire("OnEnable") end
			node.FunctionName = "Del,Add,Disable"
		else
			if flag == nil then _LoadedModule[node]:Fire("OnDisable") end
			node.FunctionName = "Del,Add,Enable"
		end
	end

	for i = 1, node.ChildNodeCount do
		subNode = node:GetNode(i)
		EnableModule(subNode, flag)
	end
end

function _G.CubeLog(msg)
	if txtLog.Text and txtLog.Text ~= "" then
		txtLog.Text = txtLog.Text..msg.."\n"
	else
		txtLog.Text = msg.."\n"
	end
	frmLog.Visible = true
end
