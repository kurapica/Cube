------------------------------------------------------
-- Develop's Guide
------------------------------------------------------

IGAS:NewAddon "Cube.Guide"

Cube_Guide = Form("Cube_Guide")
Cube_Guide.Caption = L"Developer's Guide"
Cube_Guide.Visible = false

-- HTML Viewer
htmlViewer = HTMLViewer("HTMLViewer", Cube_Guide)
htmlViewer:SetPoint("TOPLEFT", 4, -26)
htmlViewer:SetPoint("TOPRIGHT", -4, -26)
htmlViewer:SetPoint("BOTTOM", Cube_Guide, "CENTER", 0, 26)

-- Code Form
code = CodeEditor("Code", Cube_Guide)
code:SetPoint("TOP", htmlViewer, "BOTTOM")
code:SetPoint("BOTTOMLEFT", 4, 50)
code:SetPoint("BOTTOMRIGHT", -4, 50)
code.ShowLineNumber = true

-- Run Button
run = NormalButton("Run", Cube_Guide)
run.Height = 24
run.Width = 100
run.Style = "CLASSIC"
run.Text = L"Run"
run:SetPoint("BOTTOMRIGHT", Cube_Guide, "BOTTOMRIGHT", -4, 20)

-- Reset Button
reset = NormalButton("Reset", Cube_Guide)
reset.Height = 24
reset.Width = 100
reset.Style = "CLASSIC"
reset.Text = L"Reset"
reset:SetPoint("BOTTOMLEFT", Cube_Guide, "BOTTOMLEFT", 4, 20)
