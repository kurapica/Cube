---------------------------------------------------------------------------------------------------
-- LogView Frame Designer
---------------------------------------------------------------------------------------------------

-- Addon Initialize
IGAS:NewAddon "Cube.Mdl_Cube_LogView"

local width

Cube_LogView = Form("Cube_LogView")
Cube_LogView.Height = 480
Cube_LogView.Width = 560
Cube_LogView.TitleBarHeight = 24
Cube_LogView.Caption = "Cube - "..L["Log View"]
Cube_LogView.Visible = false

nameList = List("NameList", Cube_LogView)
nameList:SetPoint("TOPLEFT", Cube_LogView, "TOPLEFT", 4, -26)
nameList:SetPoint("BOTTOMLEFT", Cube_LogView, "BOTTOMLEFT", 4, 46)
nameList:SetMinResize(50, 10)
nameList:SetMaxResize(300, 2000)
nameList.Width = 150
nameList.Resizable = true

viewList = List("ViewList", Cube_LogView)
viewList:SetPoint("TOPRIGHT", Cube_LogView, "TOPRIGHT", -4, -26)
viewList:SetPoint("BOTTOMRIGHT", Cube_LogView, "BOTTOMRIGHT", -4, 46)
viewList:SetPoint("LEFT", nameList, "RIGHT", 5, 0)

-- Seperates
spNV = Frame("SpW2D", Cube_LogView)
spNV.MouseEnabled = true
spNV:SetPoint("TOPLEFT", nameList, "TOPRIGHT")
spNV:SetPoint("BOTTOMLEFT", nameList, "BOTTOMRIGHT")
spNV:SetPoint("TOPRIGHT", viewList, "TOPLEFT")
spNV:SetPoint("BOTTOMRIGHT", viewList, "BOTTOMLEFT")	
local highLight = Texture("HighLight", spNV, "BACKGROUND")
highLight:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
highLight:SetBlendMode("ADD")
highLight:SetAllPoints(spNV)
highLight.Visible = false	

-- Add Button
btnAdd = NormalButton("BtnAdd", Cube_LogView)
btnAdd.Height = 24
btnAdd.Width = 60
btnAdd.Style = "CLASSIC"
btnAdd.Text = L["Add Logger"]
width = btnAdd:GetTextWidth()
if ( width > 50 ) then
	btnAdd:SetWidth(width + 20)
else
	btnAdd:SetWidth(60)
end
btnAdd:SetPoint("BOTTOMLEFT", Cube_LogView, "BOTTOMLEFT", 4, 20)
btnAdd:ActiveThread("OnClick")

-- Remove Button
btnRemove = NormalButton("BtnRemove", Cube_LogView)
btnRemove.Height = 24
btnRemove.Width = 60
btnRemove.Style = "CLASSIC"
btnRemove.Text = L["Remove Logger"]
width = btnRemove:GetTextWidth()
if ( width > 50 ) then
	btnRemove:SetWidth(width + 20)
else
	btnRemove:SetWidth(60)
end
btnRemove:SetPoint("LEFT", btnAdd, "RIGHT", 6, 0)
btnRemove:ActiveThread("OnClick")

-- Clear Logger
btnClear = NormalButton("BtnClear", Cube_LogView)
btnClear.Height = 24
btnClear.Width = 60
btnClear.Style = "CLASSIC"
btnClear.Text = L["Clear Logger"]
width = btnClear:GetTextWidth()
if ( width > 50 ) then
	btnClear:SetWidth(width + 20)
else
	btnClear:SetWidth(60)
end
btnClear:SetPoint("LEFT", btnRemove, "RIGHT", 6, 0)
btnClear:ActiveThread("OnClick")