IGAS:NewAddon "Cube.Mdl_Cube_Main"

-----------------------------------
-- Cube Main Form
-----------------------------------
-- Main Form
Cube_Main = Form("Cube_Main")
Cube_Main.Height = 480
Cube_Main.Width = 560
Cube_Main.Caption = "Cube - "..L["Simple Dev Tool"]
Cube_Main.Visible = false
Cube_Main.ClampedToScreen = true

-- File Tree
fileTree = TreeView("FileTree", Cube_Main)
fileTree.Visible = false
fileTree.Width = 250
fileTree.Style = "Classic"
fileTree:SetPoint("TOPRIGHT", Cube_Main, "TOPLEFT", 0, -24)
fileTree:SetPoint("BOTTOMRIGHT", Cube_Main, "BOTTOMLEFT")
fileTree:ActiveThread("OnNodeFunctionClick")

-- Toggle Button
toggleBtn = Button("ToggleButton", Cube_Main)
toggleBtn.FrameLevel = fileTree.FrameLevel + 5
toggleBtn:SetWidth(32)
toggleBtn:SetHeight(32)
toggleBtn:SetNormalTexture("Interface\\BUTTONS\\UI-SpellbookIcon-PrevPage-Up")
toggleBtn:SetPushedTexture("Interface\\BUTTONS\\UI-SpellbookIcon-PrevPage-Down")
toggleBtn:SetDisabledTexture("Interface\\BUTTONS\\UI-SpellbookIcon-PrevPage-Disabled")
toggleBtn:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
toggleBtn:SetPoint("TOPLEFT", Cube_Main, "TOPLEFT", 4, -4)

-- Menu Button
menuBtn = Button("MenuButton", Cube_Main)
menuBtn.FrameLevel = fileTree.FrameLevel + 5
menuBtn:SetWidth(32)
menuBtn:SetHeight(32)
menuBtn:SetNormalTexture("Interface\\BUTTONS\\UI-SpellbookIcon-PrevPage-Up")
menuBtn:SetPushedTexture("Interface\\BUTTONS\\UI-SpellbookIcon-PrevPage-Down")
menuBtn:SetDisabledTexture("Interface\\BUTTONS\\UI-SpellbookIcon-PrevPage-Disabled")
menuBtn:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
menuBtn:SetPoint("TOPLEFT", Cube_Main, "TOPLEFT", 42, -4)
menuBtn.NormalTexture:RotateDegree(-90)
menuBtn.PushedTexture:RotateDegree(-90)

-- Config Menu
cubeMenu = DropDownList("ConfigMenu", Cube_Main)
cubeMenu.MultiSelect = true
cubeMenu.ShowOnCursor = true
cubeMenu.Visible = false

mnuFontPath = cubeMenu:AddMenuButton(L"Font Settings", L"Path")
mnuFontPath:ActiveThread("OnClick")
mnuFontHeight = cubeMenu:AddMenuButton(L"Font Settings", L"Height")
mnuFontHeight:ActiveThread("OnClick")
mnuFontOutline = cubeMenu:AddMenuButton(L"Font Settings", L"Outline")
do
	lstFontOutline = List("LstOutline", mnuFontOutline)
	lstFontOutline:SetList{
		NONE = L"NONE",
		NORMAL = L"NORMAL",
		THICK = L"THICK",
	}
	lstFontOutline.Width = 150
	lstFontOutline.Height = 250
	lstFontOutline.Visible = false
	mnuFontOutline.DropDownList = lstFontOutline
end
mnuShowLineNum = cubeMenu:AddMenuButton(L["Show Row Number"])
mnuShowLineNum.IsCheckButton = true
mnuShowLineNum.Property = "ShowLineNumber"

mnuColorDefault = cubeMenu:AddMenuButton(L"Color Settings", L"Default Color")
mnuColorDefault.IsColorPicker = true
mnuColorDefault.Property = "DefaultColor"
mnuColorComment = cubeMenu:AddMenuButton(L"Color Settings", L"Comment Color")
mnuColorComment.IsColorPicker = true
mnuColorComment.Property = "CommentColor"
mnuColorString = cubeMenu:AddMenuButton(L"Color Settings", L"String Color")
mnuColorString.IsColorPicker = true
mnuColorString.Property = "StringColor"
mnuColorNumber = cubeMenu:AddMenuButton(L"Color Settings", L"Number Color")
mnuColorNumber.IsColorPicker = true
mnuColorNumber.Property = "NumberColor"
mnuColorInstruction = cubeMenu:AddMenuButton(L"Color Settings", L"Instruction Color")
mnuColorInstruction.IsColorPicker = true
mnuColorInstruction.Property = "InstructionColor"

arMenuProperty = Array(DropDownList.DropDownMenuButton)
arMenuProperty:Push(
	mnuColorDefault,
	mnuColorComment,
	mnuColorString,
	mnuColorNumber,
	mnuColorInstruction
)

mnuAutoCompleteDelay = cubeMenu:AddMenuButton(L"Auto-Complete Delay")
lstAutoCompleteDelay = List("lstDelay", mnuAutoCompleteDelay)
local key, item = {}, {}
for i = 1, 9 do
	key[i] = (i+1)/10
	item[i] = tostring(key[i])
end
lstAutoCompleteDelay.Keys = key
lstAutoCompleteDelay.Items = item
lstAutoCompleteDelay.Width = 150
lstAutoCompleteDelay.Height = 250
lstAutoCompleteDelay.Visible = false
mnuAutoCompleteDelay.DropDownList = lstAutoCompleteDelay

-- Check AutoRun
chkAuto = CheckBox("AutoRun", Cube_Main)
chkAuto.Text = L["AutoRun"]
chkAuto:SetPoint("TOPRIGHT", Cube_Main, "TOPRIGHT", -4, -24)

-- CodeEditor Container
tabCode = TabLayoutPanel("TabContainer", Cube_Main)
tabCode:SetPoint("TOPLEFT", toggleBtn, "BOTTOMLEFT", 0, -4)
tabCode:SetPoint("BOTTOMRIGHT", Cube_Main, "BOTTOMRIGHT", -4, 50)
tabCode.AutoDisposing = false
tabCode.ShowCloseButton = true

-- CodeEditor Recycle
rycCodeEditor = Recycle(CubeEditor, "CodeEditor_%d", tabCode)

-- Code Form
-- code = CodeEditor("Code", Cube_Main)
-- code:SetPoint("TOPLEFT", toggleBtn, "BOTTOMLEFT", 0, -4)
-- code:SetPoint("BOTTOMRIGHT", Cube_Main, "BOTTOMRIGHT", -4, 50)
-- code.ShowLineNumber = true

-- Reset Button
reset = NormalButton("Reset", Cube_Main)
reset.Height = 24
reset.Width = 60
reset.Style = "CLASSIC"
reset.AutoSize = true
reset.Text = L["Reset"]
reset:SetPoint("BOTTOMLEFT", Cube_Main, "BOTTOMLEFT", 4, 20)

-- Save Button
save = NormalButton("Save", Cube_Main)
save.Height = 24
save.Width = 60
save.Style = "CLASSIC"
save.AutoSize = true
save.Text = L["Save"]
save:SetPoint("LEFT", reset, "RIGHT", 6, 0)
save:ActiveThread("OnClick")

-- Debug Button
debug = NormalButton("Debug", Cube_Main)
debug.Height = 24
debug.Width = 60
debug.Style = "CLASSIC"
debug.AutoSize = true
debug.Text = L["Debug"]
debug:SetPoint("LEFT", save, "RIGHT", 6, 0)

-- BugList Button
bugList = NormalButton("BugList", Cube_Main)
bugList.Height = 24
bugList.Width = 60
bugList.Style = "CLASSIC"
bugList.AutoSize = true
bugList.Text = L["BugList"]
bugList:SetPoint("LEFT", debug, "RIGHT", 6, 0)

-- CubeLog Button
cubeLog = NormalButton("CubeLog", Cube_Main)
cubeLog.Height = 24
cubeLog.Width = 60
cubeLog.Style = "CLASSIC"
cubeLog.AutoSize = true
cubeLog.Text = L["Log"]
cubeLog:SetPoint("LEFT", bugList, "RIGHT", 6, 0)

-- Run Button
run = NormalButton("Run", Cube_Main)
run.Height = 24
run.Width = 60
run.Style = "CLASSIC"
run.AutoSize = true
run.Text = L["Run"]
run:SetPoint("BOTTOMRIGHT", Cube_Main, "BOTTOMRIGHT", -4, 20)

-- Load Addon Button
loadAddon = NormalButton("LoadAddon", Cube_Main)
loadAddon.Height = 24
loadAddon.Width = 60
loadAddon.Style = "CLASSIC"
loadAddon.AutoSize = true
loadAddon.Text = L["Load Addon"]
loadAddon:SetPoint("RIGHT", run, "LEFT", -6, 0)
loadAddon.Visible = false

-- Result Button
btnUnit = NormalButton("Result", Cube_Main)
btnUnit.Height = 24
btnUnit.Width = 60
btnUnit.Style = "CLASSIC"
btnUnit.AutoSize = true
btnUnit.Text = L["Unit Test"]
btnUnit:SetPoint("RIGHT", run, "LEFT", -6, 0)
btnUnit.Visible = false	-- block now

-- Result Frame
frmResult = Form("frmResult", Cube_Main)
frmResult.Width = 400
frmResult.Height = 300
frmResult.Visible = false
frmResult.Caption = ""
frmResult.HasTitleBar = false
frmResult:SetMinResize(400, 300)
frmResult:ClearAllPoints()
frmResult:SetPoint("TOPLEFT", Cube_Main, "TOPRIGHT")

lstUnitTest = List("lstUnitTest", frmResult)
lstUnitTest:SetPoint("TOPLEFT", frmResult, "TOPLEFT", 4, -20)
lstUnitTest:SetPoint("BOTTOMLEFT", frmResult, "BOTTOMLEFT", 4, -4)
lstUnitTest:SetPoint("RIGHT", frmResult, "CENTER", -40, 0)
lstUnitTest.Visible = false

txtResult = MultiLineTextBox("Result", frmResult)
txtResult:SetPoint("TOPLEFT", frmResult, "TOPLEFT", 4, -20)
txtResult:SetPoint("BOTTOMRIGHT", frmResult, "BOTTOMRIGHT", -4, 4)

-- CubeLog
frmLog = Form("frmLog", Cube_Main)
frmLog.Height = 100
frmLog.Visible = false
frmLog.Caption = ""
frmLog.HasTitleBar = false
frmLog:SetMinResize(10, 10)
frmLog:ClearAllPoints()
frmLog:SetPoint("TOPLEFT", Cube_Main, "BOTTOMLEFT")
frmLog:SetPoint("TOPRIGHT", Cube_Main, "BOTTOMRIGHT")

txtLog = MultiLineTextBox("Result", frmLog)
txtLog:SetPoint("TOPLEFT", frmLog, "TOPLEFT", 4, -4)
txtLog:SetPoint("BOTTOMRIGHT", frmLog, "BOTTOMRIGHT", -4, 4)

-- Command bind
cboKey = ComboBox("CommandKey", Cube_Main)
cboKey:SetPoint("RIGHT", run, "LEFT")
cboKey.Width = 100
cboKey.Visible = false
cboKey.Editable = false

cboModify = ComboBox("ModifyKey", Cube_Main)
cboModify:SetPoint("RIGHT", cboKey, "LEFT")
cboModify:SetList{ "", "Alt", "Ctrl" }
cboModify.Width = 100
cboModify.Visible = false
cboModify.Editable = false