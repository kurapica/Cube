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
