IGAS:NewAddon "Cube.Mdl_Cube_Main"

-----------------------------------
-- Cube Main Form
-----------------------------------
local width

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
toggleBtn.FrameStrata = "HIGH"
toggleBtn:SetWidth(32)
toggleBtn:SetHeight(32)
toggleBtn:SetNormalTexture("Interface\\BUTTONS\\UI-SpellbookIcon-PrevPage-Up")
toggleBtn:SetPushedTexture("Interface\\BUTTONS\\UI-SpellbookIcon-PrevPage-Down")
toggleBtn:SetDisabledTexture("Interface\\BUTTONS\\UI-SpellbookIcon-PrevPage-Disabled")
toggleBtn:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
toggleBtn:SetPoint("TOPLEFT", Cube_Main, "TOPLEFT", 4, -4)

-- Check AutoRun
chkAuto = CheckBox("AutoRun", Cube_Main)
chkAuto.Text = L["AutoRun"]
chkAuto:SetPoint("TOPRIGHT", Cube_Main, "TOPRIGHT", -4, -24)

-- Check RowNumber
chkShowRow = CheckBox("ShowRow", Cube_Main)
chkShowRow.Text = L["Show Row Number"]
chkShowRow:SetPoint("TOPRIGHT", chkAuto, "TOPLEFT", 0, 0)

-- CodeEditor Container
tabCode = TabLayoutPanel("TabContainer", Cube_Main)
tabCode:SetPoint("TOPLEFT", toggleBtn, "BOTTOMLEFT", 0, -4)
tabCode:SetPoint("BOTTOMRIGHT", Cube_Main, "BOTTOMRIGHT", -4, 50)
tabCode.AutoDisposing = false
tabCode.ShowCloseButton = true

-- CodeEditor Recycle
rycCodeEditor = Recycle(CodeEditor, "CodeEditor_%d", tabCode)

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
reset.Text = L["Reset"]
width = reset:GetTextWidth()
if ( width > 50 ) then
	reset:SetWidth(width + 20)
else
	reset:SetWidth(60)
end
reset:SetPoint("BOTTOMLEFT", Cube_Main, "BOTTOMLEFT", 4, 20)

-- Save Button
save = NormalButton("Save", Cube_Main)
save.Height = 24
save.Width = 60
save.Style = "CLASSIC"
save.Text = L["Save"]
width = save:GetTextWidth()
if ( width > 50 ) then
	save:SetWidth(width + 20)
else
	save:SetWidth(60)
end
save:SetPoint("LEFT", reset, "RIGHT", 6, 0)

-- Debug Button
debug = NormalButton("Debug", Cube_Main)
debug.Height = 24
debug.Width = 60
debug.Style = "CLASSIC"
debug.Text = L["Debug"]
width = debug:GetTextWidth()
if ( width > 50 ) then
	debug:SetWidth(width + 20)
else
	debug:SetWidth(60)
end
debug:SetPoint("LEFT", save, "RIGHT", 6, 0)

-- BugList Button
bugList = NormalButton("BugList", Cube_Main)
bugList.Height = 24
bugList.Width = 60
bugList.Style = "CLASSIC"
bugList.Text = L["BugList"]
width = bugList:GetTextWidth()
if ( width > 50 ) then
	bugList:SetWidth(width + 20)
else
	bugList:SetWidth(60)
end
bugList:SetPoint("LEFT", debug, "RIGHT", 6, 0)

-- CubeLog Button
cubeLog = NormalButton("CubeLog", Cube_Main)
cubeLog.Height = 24
cubeLog.Width = 60
cubeLog.Style = "CLASSIC"
cubeLog.Text = L["Log"]
width = cubeLog:GetTextWidth()
if ( width > 50 ) then
	cubeLog:SetWidth(width + 20)
else
	cubeLog:SetWidth(60)
end
cubeLog:SetPoint("LEFT", bugList, "RIGHT", 6, 0)

-- Run Button
run = NormalButton("Run", Cube_Main)
run.Height = 24
run.Width = 60
run.Style = "CLASSIC"
run.Text = L["Run"]
width = run:GetTextWidth()
if ( width > 50 ) then
	run:SetWidth(width + 20)
else
	run:SetWidth(60)
end
run:SetPoint("BOTTOMRIGHT", Cube_Main, "BOTTOMRIGHT", -4, 20)

-- Result Button
btnUnit = NormalButton("Result", Cube_Main)
btnUnit.Height = 24
btnUnit.Width = 60
btnUnit.Style = "CLASSIC"
btnUnit.Text = L["Unit Test"]
width = btnUnit:GetTextWidth()
if ( width > 50 ) then
	btnUnit:SetWidth(width + 20)
else
	btnUnit:SetWidth(60)
end
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

-----------------------------------
-- New Addon Form
-----------------------------------

