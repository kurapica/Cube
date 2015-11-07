-----------------------------------
-- Cube Frame Script
-----------------------------------

-- Addon Initialize
IGAS:NewAddon "Cube.Mdl_Cube_Main"

_LoadedModule = setmetatable({}, {__mode = "k"})

lUnit = _Addon:GetModule("lUnit")

-- Script
_Addon.OnSlashCmd = _Addon.OnSlashCmd + function(self, option)
	if option and strupper(option) == "CODE" then
		Cube_Main.Visible = true
		return true
	end
end

_ModuleType = {
	"Localization",
	--"Definition",
	"Module",
	--"Frame",
	--"Script",
}

_LocaleType = {
	"enUS",
    "frFR",
    "deDE",
    "koKR",
    "zhCN",
    "zhTW",
    "ruRU",
    "esES",
    "esMX",
}

_NewAddonFile = [[
IGAS:NewAddon "%s"

import "System"

%s-----------------------------------
-- Addon Event Handler
-----------------------------------
function OnLoad(self)
	-- Fired when the addon is loaded
%s
end

function OnEnable(self)
	-- Fired when the addon is enabled
end

%s]]

_NewAddonDB = [[
	-- _DB is used to store datas for the account
	_DB = Cube:AddSavedVariable(_Name)
]]

_NewAddonDBChar = [[
	-- _DBChar is used to store datas for the character
	_DBChar = Cube:AddSavedVariablePerCharacter(_Name)
]]

_NewSlashCommand = [[
	-- Register a slash command
	self:AddSlashCmd("%s")
]]

_NewSlashHandler = [[
function OnSlashCmd(self, option, info)
	-- Fired when the player using the registered slash commands
	-- for command /cmd hi some information
	-- option is 'hi'
	-- info is 'some information'
end
]]

_NewRegisterEventHeader = [[
	-- Register System Events
]]

_NewRegisterEvent = [[
	self:RegisterEvent("%s")
]]

_NewEventHandler = [[
function %s(self%s)
	-- Handle %s event
%send
]]

_NewAddonLocale = [[
-----------------------------------
-- Localization manager
-----------------------------------
L = Locale(_Name)
]]

_NewAddonLogger = [[
-----------------------------------
-- Logger
-- Using Debug("some message") to send debug messages
-- Using Info("some message") to send informations
-----------------------------------
Log = Logger(_Name)

Log.LogLevel = 2

Log:SetPrefix(1, System.Widget.FontColor.RED .. "[" .. _Name .. ":Debug]" .. System.Widget.FontColor.CLOSE, "Debug")
Log:SetPrefix(2, "[" .. _Name .. ":Info]", "Info")

Log:AddHandler(print)
]]

_NewLocalizationFile = [[
IGAS:NewAddon "%s"

if GetLocale() ~= "%s" then return end

]]

_NewModuleFile = [[
IGAS:NewAddon "%s.%s"

-----------------------------------
-- Module Event Handler
-----------------------------------
function OnLoad(self)
%s
end

function OnEnable(self)

end

%s]]

_NewFrameDesigner = [[
IGAS:NewAddon "%s.%s"

import "System.Widget"

]]

_NewFrameScript = [[
IGAS:NewAddon "%s.%s"

]]

_NewScriptFile = [[
IGAS:NewAddon "%s"

]]

_CommandKeyOrder = {
	"F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12",
	"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
	"1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "-", "="
}

_ShortKeyListNoPre = {"F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12"}

_ShortKeyListAlt = {
	"F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12",
	"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
	"1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "-", "="
}

_ShortKeyListCtrl = {
	"F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12",
	"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
	"1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "-", "="
}

_NoPreCommand = {}
_AltCommand = {}
_CtrlCommand = {}

function OnLoad(self)
	for i, v in ipairs(_CommandKeyOrder) do
		_CommandKeyOrder[v] = i
	end

	self:RegisterEvent("PLAYER_LOGOUT") -- used to clear to keep safe

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

	-- Command keys
	if true or not CubeSave.CodeTree[3] then
		CubeSave.CodeTree[3] = {
			Text = "Command",
			FunctionName = "Add",
			ChildOrderChangable = true,
			Childs = {
				{
					Text = "Undo",
					FunctionName = "Del",
					Modify = "Ctrl",
					Key = "Z",
					Content = "self:Undo()",
				},
				{
					Text = "Redo",
					FunctionName = "Del",
					Modify = "Ctrl",
					Key = "Y",
					Content = "self:Redo()",
				},
				{
					Text = "Save",
					FunctionName = "Del",
					Modify = "Ctrl",
					Key = "S",
					Content = "self:Save()",
				},
				{
					Text = "Run",
					FunctionName = "Del",
					Modify = "",
					Key = "F5",
					Content = "self:Run()",
				},
			},
		}
	end

	-- import data from the v1.0 version
	if type(CubeSave.CodeList) == "table" then
		for i, v in pairs(CubeSave.CodeList) do
			if type(i) == "string" and type(v) == "string" then
				tinsert(CubeSave.CodeTree[1].Childs, {Text = i, Content = v, FunctionName = "Del",})
			end
		end

		CubeSave.CodeList = nil
	end

	-- Clear Addon for the new version
	if not CubeSave.CodeTree[2].StudioVersion then
		CubeSave.CodeTree[2].StudioVersion = 1

		-- Clear directly
		wipe(CubeSave.CodeTree[2].Childs)
	end

	-- Save DB for addons defined in the Cube
	CubeSave.AddonSaveDB = CubeSave.AddonSaveDB or {}
	CubeSavePerCharacter.AddonSaveDB = CubeSavePerCharacter.AddonSaveDB or {}

	-- Build tree
	fileTree:SetTree(CubeSave.CodeTree)
	fileTree:GetNode(1).ToggleState = true

	-- Load the settings
	if CubeSave.CubeMainSize then
		Cube_Main.Size = CubeSave.CubeMainSize
	end

	if CubeSave.CubeMainLocation then
		Cube_Main.Location = CubeSave.CubeMainLocation
	end

	if not CubeSave.EditorConfig then
		CubeSave.EditorConfig = {
			ShowLineNumber = true,
			DefaultColor = System.Widget.ColorType(1, 1, 1, 1),
			CommentColor = System.Widget.ColorType(0, 1, 0, 1),
			StringColor = System.Widget.ColorType(0, 1, 0, 1),
			NumberColor = System.Widget.ColorType(1, 1, 0, 1),
			InstructionColor = System.Widget.ColorType(1, 0.39, 0.09, 1),
			Font = {
				path = STANDARD_TEXT_FONT,
				height = 14,
				outline = "NONE",
				monochrome = false,
			},
		}
	end

	_EditorConfig = CubeSave.EditorConfig

	-- AutoComplete-Delay
	if not _EditorConfig.AutoCompleteDelay then
		_EditorConfig.AutoCompleteDelay = 0.2
	end

	lstAutoCompleteDelay:SelectItemByValue(_EditorConfig.AutoCompleteDelay)

	-- Loading in-game addons
	local node = fileTree:GetNode(2)
	local subNode

	for i = 1, node.ChildNodeCount do
		subNode = node:GetNode(i)
		if subNode.MetaData[_PlayerName] then
			LoadAddon(subNode)
		end
	end

	-- Loading commands
	node = fileTree:GetNode(3)
	for i = 1, node.ChildNodeCount do
		InstallCommand(node:GetNode(i))
		LoadCommand(node:GetNode(i))
	end

	return CodeEditor._AppendCommonAutoCompleteList(API_Data)
end

function OnEnable(self)
	self.OnEnable = nil

	-- Enabling in-game addons
	local node = fileTree:GetNode(2)
	local subNode

	for i = 1, node.ChildNodeCount do
		subNode = node:GetNode(i)
		if subNode.MetaData[_PlayerName] then
			EnableAddon(subNode, true)
		end
	end

	-- Loading the snippets
	self:ThreadCall(function(self)
		System.Threading.Sleep(2)

		local node, subNode

		-- Loading Common code
		node = fileTree:GetNode(1)

		for i = 1, node.ChildNodeCount do
			subNode = node:GetNode(i)
			if subNode.MetaData[_PlayerName] then
				LoadSnippet(subNode)
			end
		end
	end)

	fileTree:GetNode(1):Select()
end

function PLAYER_LOGOUT(self)
	ValidateTable(CubeSave.AddonSaveDB)
	ValidateTable(CubeSavePerCharacter.AddonSaveDB)
end

function Cube_Main:OnSizeChanged()
	CubeSave.CubeMainSize = self.Size
end

function Cube_Main:OnPositionChanged()
	CubeSave.CubeMainLocation = self.Location
end

function menuBtn:OnClick() cubeMenu.Visible = not cubeMenu.Visible end

function cubeMenu:OnShow()
	mnuFontPath.Text = L"Path" .. " : " .._EditorConfig.Font.path
	mnuFontHeight.Text = L"Height" .. " : " .._EditorConfig.Font.height
	lstFontOutline:SelectItemByValue(_EditorConfig.Font.outline)
	mnuShowLineNum.Checked =_EditorConfig[mnuShowLineNum.Property]

	for _, btn in ipairs(arMenuProperty) do
		btn.Color = CubeSave.EditorConfig[btn.Property]
	end
end

function mnuFontPath:OnClick()
	cubeMenu.Visible = false

	local path = IGAS:MsgBox(L"Please input the font path", "ic")
	if path and strtrim(path) ~= "" then
		_EditorConfig.Font.path = strtrim(path)

		UpdateAllCodeEditor("Font", _EditorConfig.Font)
	end
end

function mnuFontHeight:OnClick()
	cubeMenu.Visible = false

	local height = IGAS:MsgBox(L"Please input the font height", "ic")
	if tonumber(height) and tonumber(height) >= 1 then
		_EditorConfig.Font.height = tonumber(height)

		UpdateAllCodeEditor("Font", _EditorConfig.Font)
	end
end

function lstFontOutline:OnItemChoosed(key)
	if self.Visible then
		_EditorConfig.Font.outline = key

		UpdateAllCodeEditor("Font", _EditorConfig.Font)
	end
end

function lstAutoCompleteDelay:OnItemChoosed(key, item)
	if self.Visible then
		_EditorConfig.AutoCompleteDelay = key

		UpdateAllCodeEditor("AutoCompleteDelay", _EditorConfig.AutoCompleteDelay)

		cubeMenu.Visible = false
	end
end

function mnuShowLineNum:OnCheckChanged()
	_EditorConfig.ShowLineNumber = self.Checked

	UpdateAllCodeEditor("ShowLineNumber", _EditorConfig.ShowLineNumber)
end

function arMenuProperty:OnColorPicked(index, r, g, b, a)
	local prop = arMenuProperty[index].Property
	_EditorConfig[prop] = ColorType(r, g, b)
	UpdateAllCodeEditor(prop, _EditorConfig[prop])
end

function toggleBtn:OnClick()
	if fileTree.Visible then
		fileTree.Visible = false
		self:SetNormalTexture("Interface\\BUTTONS\\UI-SpellbookIcon-PrevPage-Up")
		self:SetPushedTexture("Interface\\BUTTONS\\UI-SpellbookIcon-PrevPage-Down")
		self:SetDisabledTexture("Interface\\BUTTONS\\UI-SpellbookIcon-PrevPage-Disabled")
		self:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
	else
		fileTree.Visible = true
		self:SetNormalTexture("Interface\\BUTTONS\\UI-SpellbookIcon-NextPage-Up")
		self:SetPushedTexture("Interface\\BUTTONS\\UI-SpellbookIcon-NextPage-Down")
		self:SetDisabledTexture("Interface\\BUTTONS\\UI-SpellbookIcon-NextPage-Disabled")
		self:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
	end
end

function fileTree:OnNodeSelected(node)
	if node.MetaData.Type == "Folder" or (node.Level == 1 and node.Index > 1) then return end

	-- Check if has a editor
	for i = 1, tabCode.Count do
		if tabCode:GetWidget(i).Node == node then
			return tabCode:SelectWidget(i)
		end
	end

	-- New CodeEditor for the node
	local code = rycCodeEditor()

	tabCode:AddWidget(code, node.Text)
	code.Node = node
	code.Text = node.MetaData.Content or node.MetaData.Script or ""

	tabCode:SelectWidget(code)

	UpdateForm(node)
end

function fileTree:OnNodeFunctionClick(func, node)
	if func == "Del" then
		if IGAS:MsgBox(L["Do you want delete %s."]:format(GetTitle(node)), "n") then
			for i = 1, tabCode.Count do
				if tabCode:GetWidget(i).Node == node then
					rycCodeEditor(tabCode:RemoveWidget(i, true))
				end
			end

			if node.Level == 2 and node.Parent.Index == 1 then
				-- Dispose snippets directly
				node:Dispose()
			elseif node.Level == 2 and node.Parent.Index == 3 then
				-- Remove Command Cache
				UninstallCommand(node)

				node:Dispose()
			else
				-- Dispose the addon
				if _LoadedModule[node] then
					_LoadedModule[node]:Dispose()
				end

				node:Dispose()
			end
		end
	elseif func == "Add" then
		if node.Level == 1 then
			if node.Index == 1 then
				local name = IGAS:MsgBox(L["Please input the snippet's name"], "ic")

				if type(name) == "string" then
					name = strtrim(name)

					for i = 1, node.ChildNodeCount do
						if node:GetNode(i).Text == name then
							return node:GetNode(i):Select()
						end
					end

					node = node:AddNode{Text = name, Content = "", FunctionName = "Del",}

					return node:Select()
				end
			elseif node.Index == 3 then
				-- Command
				local name = IGAS:MsgBox(L["Please input the command's name"], "ic")

				if type(name) == "string" then
					name = strtrim(name)

					for i = 1, node.ChildNodeCount do
						if node:GetNode(i).Text == name then
							return node:GetNode(i):Select()
						end
					end

					node = node:AddNode{Text = name, Content = "", FunctionName = "Del",}

					return node:Select()
				end
			else
				local name = IGAS:MsgBox(L["Please input the addon's name"], "ic")

				if type(name) == "string" then
					name = strtrim(name)

					if IGAS:GetAddon(name) then
						return IGAS:MsgBox(L["There is an addon existed with that name."])
					end

					for i = 1, node.ChildNodeCount do
						if node:GetNode(i).Text == name then
							return node:GetNode(i):Select()
						end
					end

					local head = ""
					local useLocale = false

					if IGAS:MsgBox(L["Need localization features?"], "n") then
						head = head .. _NewAddonLocale  .. "\n"
						useLocale = true
					end

					if IGAS:MsgBox(L["Need Logger to control messages?"], "n") then
						head = head .. _NewAddonLogger  .. "\n"
					end

					local content = ""

					if IGAS:MsgBox(L["Need saved variable for account?"], "n") then
						content = _NewAddonDB
					end

					if IGAS:MsgBox(L["Need saved variable for character?"], "n") then
						if content ~= "" then
							content = content .. "\n"
						end

						content = content .. _NewAddonDBChar
					end

					local slashCmd = IGAS:MsgBox(L["Need a slash command?(use ',' to seperate)"], "ic")
					local handler = ""

					if slashCmd and slashCmd ~= "" then
						if content ~= "" then
							content = content .. "\n"
						end

						content = content .. _NewSlashCommand:format(slashCmd:gsub("%s*,%s*", "\", \""))

						handler = _NewSlashHandler
					end

					local events = Cube:PickEvent()
					local args = ""
					local sign = ""

					if events and #events > 0 then
						if content ~= "" then
							content = content .. "\n"
						end

						content = content .. _NewRegisterEventHeader

						for _, e in ipairs(events) do
							content = content .. _NewRegisterEvent:format(e)

							if handler ~= "" then
								handler = handler .. "\n"
							end

							args = ""
							sign = ""

							if Event_Data[e].Description then
								args = args .. "    -- " .. Event_Data[e].Description .. "\n"
							end

							if Event_Data[e].Signature then
								sign = ", " .. Event_Data[e].Signature
							end

							for _, arg in ipairs(Event_Data[e]) do
								args = args .. "    -- " .. arg .. "\n"
							end

							handler = handler .. _NewEventHandler:format(e, sign, e, args)
						end
					end

					node = node:AddNode{Text = name, Content = _NewAddonFile:format(name, head, content, handler), FunctionName = "Del,Add,Load", ChildOrderChangable = true, }

					if useLocale then
						node:AddNode{Text = "Localization", NoOrderChange = true, Type="Folder", FunctionName = "Gather"}
					end

					return node:Select()
				end
			end
		else
			local parent = node

			local mtype = IGAS:MsgBox(L["Please select the module's type"], "ic", _ModuleType)

			if not mtype or mtype == "" then return end

			if mtype == "Localization" then
				local loc = IGAS:MsgBox(L["Please select the code indicating the localization"], "ic", _LocaleType)

				if not loc or loc == "" then return end

				if parent:GetNode(1).Text == "Localization" then
					parent = parent:GetNode(1)
				else
					parent = parent:AddNode{Text = "Localization", NoOrderChange = true, Type="Folder", FunctionName = "Gather"}
					parent.Index = 1
				end

				local name = loc

				for i = 1, parent.ChildNodeCount do
					if parent:GetNode(i).Text == name then
						return parent:GetNode(i):Select()
					end
				end

				node = parent:AddNode{Text = name, Type = mtype, Content = _NewLocalizationFile:format(parent.Parent.Text, loc), FunctionName = "Del"}

				return node:Select()
			elseif mtype == "Module" then
				local name = IGAS:MsgBox(L["Please input the module's name"], "ic")

				if type(name) == "string" then
					name = strtrim(name)

					local parent = node

					for i = 1, parent.ChildNodeCount do
						if parent:GetNode(i).Text == name then
							return parent:GetNode(i):Select()
						end
					end

					local content = ""

					local slashCmd = IGAS:MsgBox(L["Need a slash command?(use ',' to seperate)"], "ic")
					local handler = ""

					if slashCmd and slashCmd ~= "" then
						if content ~= "" then
							content = content .. "\n"
						end

						content = content .. _NewSlashCommand:format(slashCmd:gsub("%s*,%s*", "\", \""))

						handler = _NewSlashHandler
					end

					local events = Cube:PickEvent()
					local args = ""
					local sign = ""

					if events and #events > 0 then
						if content ~= "" then
							content = content .. "\n"
						end

						content = content .. _NewRegisterEventHeader

						for _, e in ipairs(events) do
							content = content .. _NewRegisterEvent:format(e)

							if handler ~= "" then
								handler = handler .. "\n"
							end

							args = ""
							sign = ""

							if Event_Data[e].Description then
								args = args .. "    -- " .. Event_Data[e].Description .. "\n"
							end

							if Event_Data[e].Signature then
								sign = ", " .. Event_Data[e].Signature
							end

							for _, arg in ipairs(Event_Data[e]) do
								args = args .. "    -- " .. arg .. "\n"
							end

							handler = handler .. _NewEventHandler:format(e, sign, e, args)
						end
					end

					node = parent:AddNode{Text = name, Type = mtype, Content = _NewModuleFile:format(parent.Text, name, content, handler), FunctionName = "Del"}

					return node:Select()
				end
			elseif mtype == "Frame" then
				local name = IGAS:MsgBox(L["Please input the frame's name"], "ic")

				if type(name) == "string" then
					name = strtrim(name)

					local parent = node

					for i = 1, parent.ChildNodeCount do
						if parent:GetNode(i).Text == name then
							return parent:GetNode(i):Select()
						end
					end

					node = parent:AddNode{Text = name, Type = mtype, Designer = _NewFrameDesigner:format(parent.Text, name), Script = _NewFrameScript:format(parent.Text, name), FunctionName = "Design,Del"}

					return node:Select()
				end
			elseif mtype == "Script" then
				local name = IGAS:MsgBox(L["Please input the script file's name"], "ic")

				if type(name) == "string" then
					name = strtrim(name)

					local parent = node

					for i = 1, parent.ChildNodeCount do
						if parent:GetNode(i).Text == name then
							return parent:GetNode(i):Select()
						end
					end

					node = parent:AddNode{Text = name, Type = mtype, Content = _NewScriptFile:format(parent.Text, name), FunctionName = "Del"}

					return node:Select()
				end
			end
		end
	elseif func == "Gather" then
		-- Gather localization strings from files in the addon node
		local parent = node.Parent

		local cache = {}

		GatherLocale4Node(cache, parent)

		for i = 1, parent.ChildNodeCount do
			GatherLocale4Node(cache, parent:GetNode(i))
		end

		-- Update localization files
		for i = 1, node.ChildNodeCount do
			UpdateLocaleFile(cache, node:GetNode(i))
		end

		wipe(cache)
	elseif func == "Enable" then
		if node.Level == 2 then
			EnableAddon(node, true)
		else
			EnableModule(node, true)
		end
	elseif func == "Disable" then
		if node.Level == 2 then
			EnableAddon(node, false)
		else
			EnableModule(node, false)
		end
	end
end

function chkAuto:OnValueChanged(value)
	if not tabCode.SelectedWidget then return end

	local node = tabCode.SelectedWidget.Node

	if node.Level == 2 then
		node.MetaData[_PlayerName] = value or nil
	end
end

function reset:OnClick()
	local code = tabCode.SelectedWidget

	if not code then return end

	local node = code.Node

	code.Text = node.MetaData.Content or node.MetaData.Script or ""

	return cboModify.Visible and RefreshCboKey(node.MetaData.Modify)
end

function save:OnClick()
	local code = tabCode.SelectedWidget

	if code then
		local node = code.Node

		if node.Level > 1 then
			if node.Level == 2 and node.Parent.Index == 3 then
				-- Command
				local text = code.Text

				if node.MetaData.Content ~= text then
					node.MetaData.Content = text
					LoadCommand(node)
				end

				if node.MetaData.Modify ~= cboModify.Text or node.MetaData.Key ~= cboKey.Text then
					UninstallCommand(node)

					node.MetaData.Modify = cboModify.Text
					node.MetaData.Key = cboKey.Text

					InstallCommand(node)
				end
			elseif node.MetaData.Type == "Frame" then
				node.MetaData.Script = code.Text
			else
				node.MetaData.Content = code.Text
			end
		elseif node.Level == 1 and node.Index == 1 then
			local name = IGAS:MsgBox(L["Please input the snippet's name"], "ic")

			if type(name) == "string" then
				name = strtrim(name)

				for i = 1, node.ChildNodeCount do
					if node:GetNode(i).Text == name then
						Cube_Main.Message = L["Can't save code."]
						return
					end
				end

				node = node:AddNode{Text = name, Content = code.Text, FunctionName = "Del" }

				code.Node = node
				tabCode:AddWidget(code, node.Text)

				return
			end
		end
	else
		Cube_Main.Message = L["Can't save the code."]
	end
end

function run:OnClick()
	local code = tabCode.SelectedWidget

	if not code then return end

	Cube_Main.Message = ""
	lstUnitTest.Visible = false
	frmResult.Visible = false

	local func, err, status, text

	text = code.Text

	if text ~= "" then
		func, err = loadstring(text)

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
	--[[
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
	end--]]
end

function btnUnit:OnClick()
	local code = tabCode.SelectedWidget

	if not code then return end

	Cube_Main.Message = ""

	local sm, text

	text = code.Text

	if text ~= "" then
		lstUnitTest.Report = lUnit.Run(text)

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

function OnGameTooltipShow(self, gameTooltip, key)
	local detail = API_Data[key]

	gameTooltip:AddLine(" ")

	if detail then
		if detail.Desc then
			gameTooltip:AddLine(detail.Desc, 1, 1, 1, true)
		end
	end
end

function OnAutoComplete(self, key)

end

function rycCodeEditor:OnInit(obj)
	obj.ShowLineNumber = true

	obj.OnFunctionKey = OnFunctionKey
	obj.OnControlKey = OnControlKey
	obj.OnAltKey = OnAltKey
	obj.OnGameTooltipShow = OnGameTooltipShow
	obj.OnAutoComplete = OnAutoComplete
end

function rycCodeEditor:OnPush(obj)
	obj.Node = nil
	obj.Visible = false
end

function rycCodeEditor:OnPop(obj)
	obj.ShowLineNumber = _EditorConfig.ShowLineNumber
	obj.Font = _EditorConfig.Font
	obj.DefaultColor = _EditorConfig.DefaultColor
	obj.CommentColor = _EditorConfig.CommentColor
	obj.StringColor = _EditorConfig.StringColor
	obj.NumberColor = _EditorConfig.NumberColor
	obj.InstructionColor = _EditorConfig.InstructionColor
	obj.AutoCompleteDelay = _EditorConfig.AutoCompleteDelay
end

function tabCode:OnTabClose(obj)
	rycCodeEditor(obj)
	UpdateForm(false)
end

function tabCode:OnTabChange(old, new)
	UpdateForm(new.Node)
end

function loadAddon:OnClick()
	local code = tabCode.SelectedWidget

	if code and code.Node.Level == 2 and code.Node.Parent.Index == 2 then
		LoadAddon(code.Node)
	end
end

function cboModify:OnTextChanged(text)
	return RefreshCboKey(text)
end

-----------------------------------
-- Helper API
-----------------------------------
function UpdateAllCodeEditor(prop, value)
	for i = 1, tabCode.Count do
		tabCode:GetWidget(i)[prop] = value
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

function LoadAddon(node)
	_LoadedModule[node] = nil

	-- Loading
	if node.Level == 2 then
		Log(2, "Loading Addon......%s", GetTitle(node))
	end

	if node.MetaData.Type ~= "Folder" then
		if node.MetaData.Type == "Frame" then
			LoadCode(node.MetaData.Designer)
			LoadCode(node.MetaData.Script)
		else
			LoadCode(node.MetaData.Content)
		end

		_LoadedModule[node] = IGAS:GetAddon(GetTitle(node))
	end

	if _LoadedModule[node] then
		for i = 1, node.ChildNodeCount do
			LoadAddon(node:GetNode(i))
		end
	end

	if node.Level == 2 and _LoadedModule[node] then
		-- Fire OnLoad & OnEnable
		FinishLoad(node)
	end
end

function LoadCommand(node)
	Log(2, "Loading Command......%s", GetTitle(node))

	node.CommandFunc = nil

	local code = node.MetaData.Content or ""

	code = "return function(self)\n" .. code .. "\nend"

	local func, err = loadstring(code)

	if func then
		func, err = pcall(func)

		if func then
			node.CommandFunc = err
			return
		end
	end

	Log(2, "Error Load Command %s: %s", GetTitle(node), err)
end

function UninstallCommand(node)
	local meta = node.MetaData
	local lst, keys

	if meta.Modify == "Ctrl" then
		lst = _CtrlCommand
		keys = _ShortKeyListCtrl
	elseif meta.Modify == "Alt" then
		lst = _AltCommand
		keys = _ShortKeyListAlt
	else
		lst = _NoPreCommand
		keys = _ShortKeyListNoPre
	end

	local key = meta.Key

	if not key or key == "" then return end

	lst[key] = nil

	Log(2, "Uninstall Command %s", (lst ~= _NoPreCommand and (meta.Modify .. "+") or "") .. key)

	local order = _CommandKeyOrder[key]

	for i, v in ipairs(keys) do
		if _CommandKeyOrder[v] >= order then
			return tinsert(keys, i, key)
		end
	end

	return tinsert(keys, key)
end

function InstallCommand(node)
	local meta = node.MetaData
	local lst, keys

	if meta.Modify == "Ctrl" then
		lst = _CtrlCommand
		keys = _ShortKeyListCtrl
	elseif meta.Modify == "Alt" then
		lst = _AltCommand
		keys = _ShortKeyListAlt
	else
		lst = _NoPreCommand
		keys = _ShortKeyListNoPre
	end

	local key = meta.Key

	if not key or key == "" then return end

	lst[key] = node

	for i, v in ipairs(keys) do
		if v == key then
			tremove(keys, i)
			break
		end
	end

	Log(2, "Install Command %s for %s", (lst ~= _NoPreCommand and (meta.Modify .. "+") or "") .. key, GetTitle(node))
end

function FinishLoad(node)
	if _LoadedModule[node] then
		_LoadedModule[node]:Fire("OnLoad")
	end

	for i = 1, node.ChildNodeCount do
		FinishLoad(node:GetNode(i))
	end
end

function EnableAddon(node, flag)
	local enabled = (flag == nil) or flag

	if _LoadedModule[node] then
		_LoadedModule[node]._Enabled = enabled

		if _LoadedModule[node]._Enabled then
			if flag == nil then _LoadedModule[node]:Fire("OnEnable") end
			node.FunctionName = "Del,Add,Disable"
		else
			if flag == nil then _LoadedModule[node]:Fire("OnDisable") end
			node.FunctionName = "Del,Add,Enable"
		end

		for i = 1, node.ChildNodeCount do
			subNode = node:GetNode(i)
			EnableModule(subNode, flag)
		end
	end
end

function EnableModule(node, flag)
	local enabled = (flag == nil) or flag

	if _LoadedModule[node] then
		_LoadedModule[node]._Enabled = enabled

		if _LoadedModule[node]._Enabled then
			if flag == nil then _LoadedModule[node]:Fire("OnEnable") end
			node.FunctionName = "Del,Disable"
		else
			if flag == nil then _LoadedModule[node]:Fire("OnDisable") end
			node.FunctionName = "Del,Enable"
		end

		for i = 1, node.ChildNodeCount do
			subNode = node:GetNode(i)
			EnableModule(subNode, flag)
		end
	end
end

function ValidateTable(tbl, cache)
	cache = cache or {[_G] = true}

	cache[tbl] = true

	for k, v in pairs(tbl) do
		if type(k) == "table" then
			-- no table as key
			tbl[k] = nil
		end

		if type(v) == "table" then
			if cache[v] then
				-- make sure no recursive, no table be the value twice, just keep simple
				tbl[k] = nil
			else
				ValidateTable(v, cache)
			end
		end
	end
end

function GatherLocale(cache, ct)
	for str in ct:gmatch("[^_%w]L(%b[])") do
		cache[str:sub(2, -2)] = true
	end

	for str in ct:gmatch("[^_%w]L(%b\"\")") do
		cache[str] = true
	end
end

function GatherLocale4Node(cache, node)
	if node.MetaData.Content then
		GatherLocale(cache, node.MetaData.Content)
	elseif node.MetaData.Type == "Frame" then
		GatherLocale(cache, node.MetaData.Designer)
		GatherLocale(cache, node.MetaData.Script)
	end
end

function UpdateLocaleFile(cache, node)
	local ct = node.MetaData.Content

	-- Add not exist
    for str in pairs(cache) do
        if not strfind(ct, str) then
            if strfind(ct, "\n$") then
                ct = ct.."L["..str.."] = "..str.."\n"
            else
                ct = ct.."\n".."L["..str.."] = "..str.."\n"
            end
        end
    end

    -- remove not exist
    for str in ct:gmatch("L(%b[])%s*=%s*[^\n]*") do
        str = str:sub(2, -2)
        if not cache[str] then
            ct = gsub(ct, "L%["..str.."%]%s*=%s*[^\n]*\n", "")
            ct = gsub(ct, "L%["..str.."%]%s*=%s*[^\n]*", "")
        end
    end

    node.MetaData.Content = ct

    -- Reset the editor
    for i = 1, tabCode.Count do
		if tabCode:GetWidget(i).Node == node then
			tabCode:GetWidget(i).Text = node.MetaData.Content
			break
		end
	end
end

function OnFunctionKey(self, key)
	local node = _NoPreCommand[strupper(key)]

	if node and node.CommandFunc then
		return node.CommandFunc(self)
	end
end

function OnControlKey(self, key)
	local node = _CtrlCommand[strupper(key)]

	if node and node.CommandFunc then
		return node.CommandFunc(self)
	end
end

function OnAltKey(self, key)
	local node = _AltCommand[strupper(key)]

	if node and node.CommandFunc then
		return node.CommandFunc(self)
	end
end

function UpdateForm(node)
	chkAuto.Visible = false
	chkAuto.Checked = false
	cboKey.Visible = false
	cboModify.Visible = false
	loadAddon.Visible = false

	Cube_Main.Message = ""
	lstUnitTest.Visible = false
	frmResult.Visible = false
	run.Visible = false

	if node then
		if node.Level == 1 and node.Index == 1 then
			run.Visible = true
		elseif node.Level == 2 and node.Parent.Index == 3 then
			cboModify:BlockEvent("OnTextChanged")
			cboKey:BlockEvent("OnTextChanged")

			cboModify.Text = node.MetaData.Modify or ""
			cboModify.DefaultModify = node.MetaData.Modify
			cboModify.DefaultKey = node.MetaData.Key

			RefreshCboKey(node.MetaData.Modify)

			cboModify:UnBlockEvent("OnTextChanged")
			cboKey:UnBlockEvent("OnTextChanged")

			cboKey.Visible = true
			cboModify.Visible = true
		elseif node.Level == 2 then
			chkAuto.Visible = true
			chkAuto.Text = L["AutoRun"]
			chkAuto.Checked = node.MetaData[_PlayerName]
			run.Visible = true

			loadAddon.Visible = (node.Parent.Index == 2)
		end
	end
end

function RefreshCboKey(text)
	if text == "" then
		cboKey:SetList(_ShortKeyListNoPre)
	elseif text == "Ctrl" then
		cboKey:SetList(_ShortKeyListCtrl)
	elseif text == "Alt" then
		cboKey:SetList(_ShortKeyListAlt)
	end

	if text == cboModify.DefaultModify then
		if cboModify.DefaultKey then
			cboKey.Keys[#cboKey.Keys + 1] = #cboKey.Keys + 1

			local order = _CommandKeyOrder[cboModify.DefaultKey]
			local inserted = false

			for i, k in ipairs(cboKey.Items) do
				if _CommandKeyOrder[k] >= order then
					tinsert(cboKey.Items, i, cboModify.DefaultKey)
					inserted = true
					break
				end
			end

			if not inserted then
				tinsert(cboKey.Items, cboModify.DefaultKey)
			end

			cboKey.Text = cboModify.DefaultKey
		else
			cboKey.Value = 1
		end
	end
end

-----------------------------------
-- Cube API
-----------------------------------
function Cube:Log(...)
	local msg = strjoin(" ", tostringall(...))

	if txtLog.Text and txtLog.Text ~= "" then
		txtLog.Text = txtLog.Text..msg.."\n"
	else
		txtLog.Text = msg.."\n"
	end
	frmLog.Visible = true
end

function Cube:AddSavedVariable(name)
	if type(name) ~= "string" then return end

	CubeSave.AddonSaveDB[name] = CubeSave.AddonSaveDB[name] or {}

	return CubeSave.AddonSaveDB[name]
end

function Cube:AddSavedVariablePerCharacter(name)
	if type(name) ~= "string" then return end

	CubeSavePerCharacter.AddonSaveDB[name] = CubeSavePerCharacter.AddonSaveDB[name] or {}

	return CubeSavePerCharacter.AddonSaveDB[name]
end

-----------------------------------
-- CubeEditor
-----------------------------------
__Delegate__(Task.ThreadCall)
function CubeEditor:Save() return save.Visible and save:OnClick() end

function CubeEditor:Run() return run.Visible and run:OnClick() end

function CubeEditor:Reset() return reset.Visible and reset:OnClick() end