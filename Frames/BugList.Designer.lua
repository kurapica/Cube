---------------------------------------------------------------------------------------------------
-- BugList Frame Designer
---------------------------------------------------------------------------------------------------

-- Addon Initialize
IGAS:NewAddon "Cube.Mdl_Cube_BugList"

local width

Cube_BugList = Form("Cube_BugList")
Cube_BugList.Height = 480
Cube_BugList.Width = 560
Cube_BugList.TitleBarHeight = 32
Cube_BugList.Caption = "Cube - "..L["Simple Bug List"]
Cube_BugList.Visible = false

btnRight = Button("RightBtn", Cube_BugList)
btnRight.FrameLevel = Cube_BugList.FrameLevel + 2
btnRight:SetWidth(32)
btnRight:SetHeight(32)
btnRight:ClearAllPoints()
btnRight:SetPoint("TOPRIGHT", Cube_BugList, "TOPRIGHT", -26, -4)
btnRight:SetNormalTexture("Interface\\BUTTONS\\UI-SpellbookIcon-NextPage-Up")
btnRight:SetPushedTexture("Interface\\BUTTONS\\UI-SpellbookIcon-NextPage-Down")
btnRight:SetDisabledTexture("Interface\\BUTTONS\\UI-SpellbookIcon-NextPage-Disabled")
btnRight:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
btnRight:Disable()
rightNum = FontString("RightNum", btnRight, "ARTWORK", "GameFontHighlight")
rightNum:SetAllPoints(btnRight)

btnLeft = Button("LeftBtn", Cube_BugList)
btnLeft.FrameLevel = Cube_BugList.FrameLevel + 2
btnLeft:SetWidth(32)
btnLeft:SetHeight(32)
btnLeft:ClearAllPoints()
btnLeft:SetPoint("RIGHT", btnRight, "LEFT", 0, 0)
btnLeft:SetNormalTexture("Interface\\BUTTONS\\UI-SpellbookIcon-PrevPage-Up")
btnLeft:SetPushedTexture("Interface\\BUTTONS\\UI-SpellbookIcon-PrevPage-Down")
btnLeft:SetDisabledTexture("Interface\\BUTTONS\\UI-SpellbookIcon-PrevPage-Disabled")
btnLeft:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
btnLeft:Disable()    
leftNum = FontString("LeftNum", btnLeft, "ARTWORK", "GameFontHighlight")
leftNum:SetAllPoints(btnLeft)

-- Text View
textView = MultiLineTextBox("Text", Cube_BugList)
textView:SetPoint("TOPLEFT", Cube_BugList, "TOPLEFT", 6, -34)
textView:SetPoint("BOTTOMRIGHT", Cube_BugList, "BOTTOMRIGHT", -6, 50)

-- Debug Button
debug = NormalButton("Debug", Cube_BugList)
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
debug:SetPoint("BOTTOMRIGHT", Cube_BugList, "BOTTOMRIGHT", -4, 20)

-- Code Button
code = NormalButton("Code", Cube_BugList)
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
code:SetPoint("RIGHT", debug, "LEFT", -6, 0)

-- Clear Button
clear = NormalButton("Clear", Cube_BugList)
clear.Height = 24
clear.Width = 60
clear.Style = "CLASSIC"
clear.Text = L["Clear"]
width = clear:GetTextWidth()
if ( width > 50 ) then
	clear:SetWidth(width + 20)
else
	clear:SetWidth(60)
end
clear:SetPoint("BOTTOMLEFT", Cube_BugList, "BOTTOMLEFT", 4, 20)

-- ClearAll Button
clearAll = NormalButton("ClearAll", Cube_BugList)
clearAll.Height = 24
clearAll.Width = 60
clearAll.Style = "CLASSIC"
clearAll.Text = L["Clear All"]
width = clearAll:GetTextWidth()
if ( width > 50 ) then
	clearAll:SetWidth(width + 20)
else
	clearAll:SetWidth(60)
end
clearAll:SetPoint("LEFT", clear, "RIGHT", 6, 0)

-- Enable Button
enable = NormalButton("EnableButton", Cube_BugList)
enable.Height = 24
enable.Width = 60
enable.Style = "CLASSIC"
enable.Text = L["Enabled"]
width = enable:GetTextWidth()
if ( width > 50 ) then
	enable:SetWidth(width + 20)
else
	enable:SetWidth(60)
end
enable:SetPoint("LEFT", clearAll, "RIGHT", 6, 0)

-- Minimap Icon
icon = MinimapIcon("MapIcon", Cube_BugList)
icon:SetIcon("Interface\\Icons\\INV_Misc_QuestionMark")
icon.Tooltip = L["Simple Bug List"]
icon.Visible = false