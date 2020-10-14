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

export { strtrim = Toolset.trim }

VALUE_TYPE_API_DOCUMENT         = 1
VALUE_TYPE_NORMAL_TABLE         = 2
VALUE_TYPE_PLOOP_TYPE           = 3

local _CurrentVal
local _ValueType

local FIRST_SHOW                = true

-------------------------------------------
-- Addon Events
-------------------------------------------
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

input                           = CodeEditor  ("Input",  Browser)
viewer                          = HtmlViewer  ("Viewer", Browser)
tipLine                         = UIPanelLabel("Tips",   Browser)

-------------------------------------------
-- Cube Browser Event Handlers
-------------------------------------------
function input:OnEnterPressed()
    local text                  = strtrim(self:GetText())

    if text == "" then
        _CurrentVal             = APIDocumentation
        _ValueType              = VALUE_TYPE_API_DOCUMENT

        return viewer:SetText(TEMPLATE_API_DOCUMENT_ROOT{
            _Locale             = _Locale,
            Color               = Color,
            target              = _CurrentVal,
        })
    elseif text == "PLoop" or Namespace.GetNamespace(text) then
        -- Browser the PLoop & Scorpio Namespace
        _CurrentVal             = Namespace.GetNamespace(text) or PLoop
        _ValueType              = VALUE_TYPE_PLOOP_TYPE

        return viewer:SetText(TEMPLATE_TYPE{
            _Locale             = _Locale,
            Color               = Color,
            target              = _CurrentVal,

            Namespace           = Namespace,
            Enum                = Enum,
            Struct              = Struct,
            Interface           = Interface,
            Class               = Class,
            Property            = Property,
            Event               = Event,
            StructCategory      = StructCategory,

            List                = List,
        })
    else
        local ok, ret           = loadstring("return " .. text)
        if ok then
            ok, ret             = pcall(ok)

            if ok and ret ~= _G then
                if type(ret) == "table" then
                    _CurrentVal = ret

                    local data  = {
                        _Locale = _Locale,
                        Color   = Color,
                        target  = ret,
                        path    = "",
                    }

                    if UI.IsUIObject(ret) then
                        local cls   = getmetatable(ret)
                        if UI.IsUIObjectType(cls) then
                            data.cls= "redirect:" .. tostring(cls)
                        else
                            data.cls= "meta:" .. ret:GetObjectType()
                        end
                    end

                    _ValueType  = VALUE_TYPE_NORMAL_TABLE
                    return viewer:SetText(TEMPLATE_TABLE(data))
                else
                    return viewer:SetText(TEMPLATE_SIMPLE{
                        _Locale     = _Locale,
                        Color       = Color,
                        target      = ret,
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
    if path:match("^copyto:") then
        path                    = path:match(":(.*)$")

        ChatEdit_ActivateChat(ChatFrame1EditBox)
        ChatFrame1EditBox:SetText(path)
        ChatFrame1EditBox:HighlightText(0, #path)

        return
    elseif path:match("^redirect:") then
        path                    = path:match(":(.*)$")

        input:SetText(path)
        return input:OnEnterPressed()
    end

    if _ValueType == VALUE_TYPE_API_DOCUMENT then
        if path == "#" then
            -- The root level
            return viewer:SetText(TEMPLATE_API_DOCUMENT_ROOT{
                _Locale         = _Locale,
                Color           = Color,
                target          = _CurrentVal,
            })
        end

        local sys               = path:match("^([^%.]+)(.*)$")

        for _, item in ipairs(APIDocumentation.systems) do
            if item.Name == sys then
                return viewer:SetText(TEMPLATE_API_DOCUMENT_SYSTEM{
                    _Locale     = _Locale,
                    Color       = Color,
                    target      = item,
                    parseEvent  = parseEvent,
                    parseFunc   = parseFunc,
                    parseTable  = parseTable,
                })
            end
        end
    elseif _ValueType == VALUE_TYPE_NORMAL_TABLE then
        local val               = _CurrentVal
        if path ~= "#" then
            for name in path:gmatch("[^%.]+") do
                if name:match("^meta:") then
                    val         = getmetatable(val)
                else
                    val         = val[name] or val[tonumber(name)]
                end
            end
        else
            path                = ""
        end

        local data              = {
            _Locale             = _Locale,
            Color               = Color,
            target              = val,
            path                = path,
        }

        if UI.IsUIObject(val) then
            local cls           = getmetatable(val)
            if UI.IsUIObjectType(cls) then
                data.cls        = "redirect:" .. tostring(cls)
            else
                data.cls        = path .. "." .. "meta:" .. val:GetObjectType()
            end
        end

        return viewer:SetText(TEMPLATE_TABLE(data))
    elseif _ValueType == VALUE_TYPE_PLOOP_TYPE then
    end
end

__AsyncSingle__(true)
function Browser:OnShow()
    if FIRST_SHOW then
        FIRST_SHOW              = false
        LoadAddOn("Blizzard_APIDocumentation")

        input:OnEnterPressed()
    end

    while self:IsShown() do
        Delay(10)

        if not tipLine:GetText() or tipLine:GetText() == "" then
            showTip(_Tips[math.random(#_Tips)])
        end
    end
end

__AsyncSingle__(true)
function showTip(text)
    if not text or text == "" then return end

    tipLine:SetAlpha(1)
    tipLine:SetText(text)

    -- Animation
    Delay(2)
    local total                 = GetFramerate() * 3
    for i = total, 0, -1 do tipLine:SetAlpha(i / total) Next() end
    tipLine:SetText("")
end

function parseItem(item)
    if item.Nilable then
        return "[" .. item.Name .. (item.Type and (":" .. item.Type) or "") .. "]"
    else
        return item.Name .. (item.Type and (":" .. item.Type) or "")
    end
end

function parseEvent(sys)
    return sys.Payload and (" - " .. XList(sys.Payload):Map(parseItem):Join(", "))
end

function parseFunc(sys)
    local arg                   = sys.Arguments and XList(sys.Arguments):Map(parseItem):Join(", ") or ""
    local ret                   = sys.Returns and #sys.Returns > 0 and (" - " .. XList(sys.Returns  ):Map(parseItem):Join(", ")) or ""

    return ("(%s)%s"):format(arg, ret)
end

function parseTable(sys)
    return sys.Fields and (" - " .. XList(sys.Fields):Map(parseItem):Join(", "))
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
        multiLine               = false,
        scrollBarHideable       = true,
        showLineNum             = false,
        hideCharCount           = true,

        ScrollBar               = {
            alpha               = 0,
        }
    },

    Viewer                      = {
        location                = { Anchor("TOPLEFT", 0, -8, "Input", "BOTTOMLEFT"), Anchor("BOTTOMRIGHT", -48, 48) },
    },

    Tips                        = {
        location                = { Anchor("BOTTOMLEFT", 16, 16) }
    },
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

TEMPLATE_SIMPLE                 = TemplateString[[
    <html>
        <body>
            <p>@\target</p>
        </body>
    </html>
]]

TEMPLATE_API_DOCUMENT_ROOT      = TemplateString[[
    <html>
        <body>
            <h1><a href="#">API Document</a></h1>
            <br/>
            @for _, sys in ipairs(target.systems) do
            <p><a href="@sys.Name">@sys.Name</a></p>
            @end
        </body>
    </html>
]]

TEMPLATE_API_DOCUMENT_SYSTEM    = TemplateString[[
    <html>
        <body>
            <h1>
                <a href="#">API Document</a>
                /
                <a href="@target.Name">@target.Name</a>
            </h1>
            <br/>
            <h1><cyan>Events</cyan></h1>
            @for _, sys in ipairs(target.Events) do
                <p><a href="copyto:@sys.LiteralName">@sys.LiteralName</a>@\parseEvent(sys)</p>
            @end
            <br/>
            <h1><cyan>Functions</cyan></h1>
            @for _, sys in ipairs(target.Functions) do
                <p><a href="copyto:@sys.Name">@sys.Name</a>@\parseFunc(sys)</p>
            @end
            <br/>
            <h1><cyan>Tables</cyan></h1>
            @for _, sys in ipairs(target.Tables) do
                <p><a href="copyto:@sys.Name">@sys.Name</a>@\parseTable(sys)</p>
            @end
        </body>
    </html>
]]

TEMPLATE_TABLE                  = TemplateString[[
    <html>
        <body>
            <p>
            @if path ~= "" then
                <a href="#">@_Locale["Root"]</a>
                @local link = ""
                @for name in path:gmatch("[^%.]+") do link = link ~= "" and (link .. "." .. name) or name
                    / <a href="@\link">@\name</a>
                @end
                @>path = path .. "."
            @end
            </p>
            <br/>
            @if cls then
            <p><cyan>@_Locale["ObjectType"]</cyan> - <a href="@\cls">@cls:match(":(.*)$")</a></p>
            <br/>
            @end
            @for k, v in pairs(target) do
                @if type(v) == "table" then
                    @if v == _G then
                        <p><a href="copyto:@\k">@\k</a> : _G</p>
                    @else
                        <p><a href="copyto:@\k">@\k</a> : <a href="@(path)@k">@tostring(v)</a></p>
                    @end
                @else
                    <p><a href="copyto:@\k">@\k</a> : @\v</p>
                @end
            @end
        </body>
    </html>
]]

TEMPLATE_TYPE                   = TemplateString[[
    <html>
        <body>
            @{
                local nmsps, enums, structs, classes, interfaces
                local fullname = Namespace.GetNamespaceName(target)

                for name, ns in Namespace.GetNamespaces(target) do
                    local nm = Namespace.GetNamespaceName(ns)
                    if Enum.Validate(ns) then
                        enums = enums or List()
                        enums:Insert(nm)
                    elseif Struct.Validate(ns) then
                        structs = structs or List()
                        structs:Insert(nm)
                    elseif Interface.Validate(ns) then
                        interfaces = interfaces or List()
                        interfaces:Insert(nm)
                    elseif Class.Validate(ns) then
                        classes = classes or List()
                        classes:Insert(nm)
                    else
                        nmsps = nmsps or List()
                        nmsps:Insert(nm)
                    end
                end
            }

            @if fullname:find(".", 1, true) then
                @local link
                <p>
                @for sub in fullname:match("^(.*)%..-$"):gmatch("[^%.]+") do
                    @>link = link and (link .. "." .. sub) or sub
                    <a href="redirect:@\link">@\sub</a> /
                @end
                <a href="copyto:@\fullname">@\fullname:match("[^%.]+$")</a>
                </p>
                <br/>
            @end


            @if nmsps then
                <h1><cyan>Namespace</cyan></h1>
                @for _, ns in nmsps:GetIterator() do
                    <p><a href="redirect:@ns">@ns</a></p>
                @end
                <br/>
            @end

            @if enums then
                <h1><cyan>Enum</cyan></h1>
                @for _, ns in enums:GetIterator() do
                    <p><a href="redirect:@ns">@ns</a></p>
                @end
                <br/>
            @end

            @if structs then
                <h1><cyan>Struct</cyan></h1>
                @for _, ns in structs:GetIterator() do
                    <p><a href="redirect:@ns">@ns</a></p>
                @end
                <br/>
            @end

            @if classes then
                <h1><cyan>Class</cyan></h1>
                @for _, ns in classes:GetIterator() do
                    <p><a href="redirect:@ns">@ns</a></p>
                @end
                <br/>
            @end

            @if interfaces then
                <h1><cyan>Interface</cyan></h1>
                @for _, ns in interfaces:GetIterator() do
                    <p><a href="redirect:@ns">@ns</a></p>
                @end
                <br/>
            @end

            @if Enum.Validate(target) then
                @for name, value in Enum.GetEnumValues(target) do
                <p><a href="copyto:@\name">@\name</a> : @\value</p>
                @end
            @elseif Struct.Validate(target) then
                @local category = Struct.GetStructCategory(target)
                @if category == StructCategory.CUSTOM then
                    <p><cyan>@_Locale["Custom"]</cyan></p>
                @elseif category == StructCategory.ARRAY then
                    @local ele = Namespace.GetNamespaceName(Struct.GetArrayElement(target))
                    <p><cyan>@_Locale["Element"]</cyan> - <a href="redirect:@\ele">@\ele</a></p>
                @elseif category == StructCategory.DICTIONARY then
                    @local key = Namespace.GetNamespaceName(Struct.GetDictionaryKey(target))
                    @local val = Namespace.GetNamespaceName(Struct.GetDictionaryValue(target))
                    <p><cyan>@_Locale["Dict"] - Key</cyan> - <a href="redirect:@\key">@\key</a></p>
                    <p><cyan>@_Locale["Dict"] - Value</cyan> - <a href="redirect:@\val">@\val</a></p>
                @elseif category == StructCategory.MEMBER then
                    <p><cyan>@_Locale["Member"]</cyan></p>
                    @for i, mem in Struct.GetMembers(target) do
                        @local vtype = mem:GetType() and Namespace.GetNamespaceName(mem:GetType())
                        <p>
                            <a href="copyto:@\mem:GetName()">
                                @if mem:IsRequire() then
                                    @\mem:GetName()
                                @else
                                    [@\mem:GetName()]
                                @end
                            </a>
                            @if vtype then
                            : <a href="redirect:@\vtype">@\vtype</a>
                            @end
                        </p>
                    @end
                @end
            @elseif Interface.Validate(target) or Class.Validate(target) then
                @{
                    local stevts, evts, stprops, props, stmtds, mtds
                    local supercls = Class.Validate(target) and Class.GetSuperClass(target)
                    supercls = supercls and Namespace.GetNamespaceName(supercls)

                    local extends = List(Interface.GetExtends(target)):Map(Namespace.GetNamespaceName):ToList()

                    for name in Interface.GetMethods(target) do
                        if Interface.IsStaticMethod(target, name) then
                            stmtds = stmtds or List()
                            stmtds:Insert(name)
                        else
                            mtds = mtds or List()
                            mtds:Insert(name)
                        end
                    end

                    for name, feature in Interface.GetFeatures(target) do
                        if Event.Validate(feature) then
                            if Event.IsStatic(feature) then
                                stevts = stevts or List()
                                stevts:Insert(name)
                            else
                                evts = evts or List()
                                evts:Insert(name)
                            end
                        elseif Property.Validate(feature) then
                            if Property.IsStatic(feature) then
                                stprops = stprops or List()
                                stprops:Insert(name)
                            else
                                props = props or List()
                                props:Insert(name)
                            end
                        end
                    end
                }

                @if supercls then
                    <p><cyan>Super Class</cyan> - <a href="redirect:@supercls">@supercls</a></p>
                    <br/>
                @end

                @if extends and #extends > 0 then
                    @for _, ext in extends:GetIterator() do
                        <p><cyan>Extend Interface</cyan> - <a href="redirect:@ext">@ext</a></p>
                    @end
                    <br/>
                @end

                @if stevts then
                    <h1><cyan>Static Event</cyan></h1>
                    @for _, name in stevts:GetIterator() do
                        <p><a href="copyto:@name">@name</a></p>
                    @end
                    <br/>
                @end

                @if stprops then
                    <h1><cyan>Static Property</cyan></h1>
                    @for _, name in stprops:GetIterator() do
                        <p><a href="copyto:@name">@name</a></p>
                    @end
                    <br/>
                @end

                @if stmtds then
                    <h1><cyan>Static Method</cyan></h1>
                    @for _, name in stmtds:GetIterator() do
                        <p><a href="copyto:@name">@name</a></p>
                    @end
                    <br/>
                @end

                @if evts then
                    <h1><cyan>Event</cyan></h1>
                    @for _, name in evts:GetIterator() do
                        <p><a href="copyto:@name">@name</a></p>
                    @end
                    <br/>
                @end

                @if props then
                    <h1><cyan>Property</cyan></h1>
                    @for _, name in props:GetIterator() do
                        <p><a href="copyto:@name">@name</a></p>
                    @end
                    <br/>
                @end

                @if mtds then
                    <h1><cyan>Method</cyan></h1>
                    @for _, name in mtds:GetIterator() do
                        <p><a href="copyto:@name">@name</a></p>
                    @end
                    <br/>
                @end
            @end
        </body>
    </html>
]]

-------------------------------------------
-- Tips
-------------------------------------------
_Tips                           = {
    _Locale["Input the expression and press enter to display the result"],
    _Locale["The special table like frames have special result"],
    _Locale["The green texts are links that can be click to view more details"],
    _Locale["Press enter with empty input will show api document"],
    _Locale["Some links are used for click to copy, just try"],
    _Locale["Input the global frame name and check its object type"],
    _Locale["Try 'Scorpio' & 'PLoop' to find more features provided by those Libs"],
}