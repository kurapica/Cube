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

local _CurrentVal

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

input                           = InputBox  ("Input",  Browser)
viewer                          = HtmlViewer("Viewer", Browser)

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
                    _CurrentVal = ret

                    return viewer:SetText(TEMPLATE_TABLE{
                        _Locale = _Locale,
                        Color   = Color,
                        target  = ret,
                        path    = "",
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

function viewer:OnHyperlinkClick(path)
    local val                   = _CurrentVal
    if path ~= "#" then
        for name in path:gmatch("[^%.]+") do
            val                 = val[name]
        end
    else
        path                    = ""
    end

    viewer:SetText(TEMPLATE_TABLE{
        _Locale                 = _Locale,
        Color                   = Color,
        target                  = val,
        path                    = path,
    })
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
        @if path ~= "" then
            <p>
                <a href="#">@_Locale["Root"]</a>
                @local link = ""
                @for name in path:gmatch("[^%.]+") do link = link ~= "" and (link .. "." .. name) or name
                / <a href="@\link">@\name</a>
                @end
            </p>
            @>path = path .. "."
        @end
            <br/>
        @for k, v in pairs(target) do
            @if type(v) == "table" then
                <p><a href="@(path)@k">table: @k</a></p>
            @else
                <p>@k = @\v</p>
            @end
        @end
        </body>
    </html>
]]