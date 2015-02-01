-- Addon Initialize
IGAS:NewAddon "Cube.Mdl_Browser"

-- Main Form
browser = Form("Cube_Browser")
browser.Height = 480
browser.Width = 560
browser.Caption = "Cube - "..L["Simple Browser"]
browser.Visible = false

html = HTMLViewer("HTMLViewer", browser)
html:SetPoint("TOPLEFT", 4, -26)
html:SetPoint("BOTTOMRIGHT", -4, 26)
html:SetBackdrop(nil)

html:ActiveThread("OnHyperlinkClick")

-- Menu Button
menuBtn = Button("MenuButton", browser)
menuBtn.FrameLevel = html.FrameLevel + 5
menuBtn:SetWidth(32)
menuBtn:SetHeight(32)
menuBtn:SetNormalTexture("Interface\\BUTTONS\\UI-SpellbookIcon-PrevPage-Up")
menuBtn:SetPushedTexture("Interface\\BUTTONS\\UI-SpellbookIcon-PrevPage-Down")
menuBtn:SetDisabledTexture("Interface\\BUTTONS\\UI-SpellbookIcon-PrevPage-Disabled")
menuBtn:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
menuBtn:SetPoint("TOPRIGHT", browser, "TOPRIGHT", -42, -4)
menuBtn.NormalTexture:RotateDegree(-90)
menuBtn.PushedTexture:RotateDegree(-90)

-- Config Menu
browserMenu = DropDownList("ConfigMenu", browser)
browserMenu.MultiSelect = true
browserMenu.ShowOnCursor = true
browserMenu.Visible = false

-- Show Description
mnuShowDesc = browserMenu:AddMenuButton(L"Show Description")
mnuShowDesc.IsCheckButton = true
mnuShowDesc:ActiveThread("OnCheckChanged")

-- Font
mnuFontPath = browserMenu:AddMenuButton(L"Font Settings", L"Path")
mnuFontPath:ActiveThread("OnClick")
mnuFontHeight = browserMenu:AddMenuButton(L"Font Settings", L"Height")
mnuFontHeight:ActiveThread("OnClick")
mnuFontOutline = browserMenu:AddMenuButton(L"Font Settings", L"Outline")
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