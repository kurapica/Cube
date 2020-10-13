--========================================================--
--                Cube - Browser                          --
--                                                        --
-- Author      :  kurapica125@outlook.com                 --
-- Create Date :  2020/10/13                              --
--========================================================--

--========================================================--
Scorpio           "Cube.Browser"                          ""
--========================================================--

import "System.Text"

-------------------------------------------
-- Addon Events
-------------------------------------------
function OnLoad()
end

__SlashCmd__("cube", "debug", _Locale["open/close the data browser"])
__SystemEvent__()
function CUBE_DEBUG_BROWSER_TOGGLE()
    Browser:SetShown(not Browser:IsShown())
end

-------------------------------------------
-- Cube Browser
-------------------------------------------
Browser                         = Dialog("Cube_Data_Browser")
Browser:Hide()

input                           = InputBox       ("Input",  Browser)
viewer                          = HTMLViewer     ("Viewer", Browser)

-------------------------------------------
-- Cube Browser Event Handlers
-------------------------------------------
function input:OnEnterPressed()
    if self:GetText() ~= "" then
        local ok, ret           = loadstring("return " .. self:GetText())
        if ok then
            ok, ret             = pcall(ok)

            if ok then
                if type(ret) == "table" and getmetatable(ret) == nil and ret ~= _G then
                    return viewer:SetText(TEMPLATE_TABLE{
                        _Locale = _Locale,
                        Color   = Color,
                        target  = ret,
                    })
                end
            end
        end

        viewer:SetText(TEMPLATE_NOT_VALID{
            _Locale             = _Locale,
            Color               = Color,
        })
    end
end

-------------------------------------------
-- Cube Browser Style
-------------------------------------------
Style[Browser]                  = {
    Header                      = { Text = _Locale["Cube"] .. " - " .. _Locale["Data Browser"] },
    Size                        = Size(800, 600),
    clampedToScreen             = true,
    minResize                   = Size(600, 400),

    Input                       = {
        location                = { Anchor("TOPLEFT", 24, -32), Anchor("RIGHT", -24) },
        height                  = 32,
        autofocus               = false,
    },

    Viewer                      = {
        location                = { Anchor("TOPLEFT", 0, -8, "Input", "BOTTOMLEFT"), Anchor("BOTTOMRIGHT", -48, 26) },
    }
}

-------------------------------------------
-- Cube Browser Template String
-------------------------------------------
TEMPLATE_NOT_VALID              = TemplateString[[
    <html>
        <body>
            <p>@_Locale["The input value is not valid"]</p>
        </body>
    </html>
]]

TEMPLATE_TABLE                  = TemplateString[[
    <html>
        <body>
        @for k, v in pairs(target) do
            <p><red>@k</red> - <yellow>@\v</yellow></p>
        @end
        </body>
    </html>
]]