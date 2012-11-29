---------------------------------------------------------------------------------------------------
-- Debug Frame Designer
---------------------------------------------------------------------------------------------------

-- Addon Initialize
IGAS:NewAddon "Cube.Mdl_Cube_Debug"

Cube_Debug = Form("Cube_Debug")
Cube_Debug.Height = 480
Cube_Debug.Width = 560
Cube_Debug.Caption = "Cube - "..L["Simple Debug Tool"]
Cube_Debug.Visible = false

txtIn = SingleTextBox("Input", Cube_Debug)
txtIn:SetPoint("TOPLEFT", Cube_Debug, "TOPLEFT", 14, -26)
txtIn:SetPoint("RIGHT", Cube_Debug, "RIGHT", -14, 0)

tabF = TabLayoutPanel("TabF", Cube_Debug)
tabF:SetPoint("TOPLEFT", Cube_Debug, "TOPLEFT", 4, -50)
tabF:SetPoint("BOTTOMRIGHT", Cube_Debug, "BOTTOMRIGHT", -4, 50)
tabF.ShowCloseButton = true

-- BugList Button
bugList = NormalButton("BugList", Cube_Debug)
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
bugList:SetPoint("BOTTOMRIGHT", Cube_Debug, "BOTTOMRIGHT", -4, 20)

-- Code Button
code = NormalButton("Code", Cube_Debug)
code.Height = 24
code.Width = 60
code.Style = "CLASSIC"
code.Text = L["Code"]
width = code:GetTextWidth()
if ( width > 50 ) then
	code:SetWidth(width + 20)
else
	code:SetWidth(60)
end
code:SetPoint("RIGHT", bugList, "LEFT", -6, 0)

-- Value Input
txtValue = SingleTextBox("Value", Cube_Debug)
txtValue.Height = 24
txtValue.Width = 200
txtValue.Visible = false
txtValue:SetPoint("BOTTOMLEFT",Cube_Debug,"BOTTOMLEFT", 10, 20)

-- Commit Button
btnCommit = NormalButton("Commit", Cube_Debug)
btnCommit.Height = 24
btnCommit.Width = 100
btnCommit.Style = "CLASSIC"
btnCommit.Visible = false
btnCommit.Text = L["Commit"]
btnCommit:SetPoint("LEFT", txtValue, "RIGHT", 6, 0)

btnCommit:ActiveThread("OnClick")

-- Timer for message
timer = Timer("MsgTimer", Cube_Debug)
timer.Interval = 0

-- Menu
Menu = DropDownList("Menu", Cube_Debug)
mnuShow = Menu:AddMenuButton(L["Show in new page"])
mnuShowMeta = Menu:AddMenuButton(L["Show metatable in new page"])
mnuShowKey = Menu:AddMenuButton(L["Show key in new page"])
mnuDel = Menu:AddMenuButton(L["Delete this"])

mnuDel:ActiveThread("OnClick")