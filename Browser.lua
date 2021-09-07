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

export { strtrim = Toolset.trim, tremove = table.remove, unpack = unpack or table.unpack }

VALUE_TYPE_API_DOCUMENT         = 1
VALUE_TYPE_NORMAL_TABLE         = 2
VALUE_TYPE_PLOOP_TYPE           = 3
VALUE_TYPE_BASIC_TYPE           = 4

local _CurrentVal
local _ValueType

local FIRST_SHOW                = true

local _History                  = {}
local _UICache                  = {}

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
        return pushUrl("", APIDocumentation, VALUE_TYPE_API_DOCUMENT)
    elseif text == "PLoop" or Namespace.GetNamespace(text) then
        return pushUrl(text, Namespace.GetNamespace(text) or PLoop, VALUE_TYPE_PLOOP_TYPE)
    else
        local ok, ret           = loadstring("return " .. text)

        if ok then
            ok, ret             = pcall(ok)

            if ok and ret and ret ~= _G then
                return pushUrl(text, ret, type(ret) == "table" and VALUE_TYPE_NORMAL_TABLE or VALUE_TYPE_BASIC_TYPE)
            else
                -- Try the UI System
                ret             = _UICache[text] or UIObject.FromName(text) or UIObject.FromName("UIParent." .. text)

                if ret then
                    return pushUrl(text, ret, VALUE_TYPE_NORMAL_TABLE)
                end
            end
        else
            -- Try the UI System
            ret             = _UICache[text] or UIObject.FromName(text) or UIObject.FromName("UIParent." .. text)

            if ret then
                return pushUrl(text, ret, VALUE_TYPE_NORMAL_TABLE)
            end
        end

        return showTip(_Locale["The input value is not valid"])
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
    elseif path == "^prev" then
        return popUrl()
    elseif path == "^none" then
        return
    end

    local text, value, dtype    = unpack(_History, #_History - 3)
    return pushUrl(text, value, dtype, path)
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

function parseUIObject(data, val, path)
    if UI.IsUIObject(val) then
        local cls           = getmetatable(val)
        if UI.IsUIObjectType(cls) then
            data.cls        = "redirect:" .. tostring(cls)
            data.ploop      = true
        else
            data.cls        = path .. "." .. "meta:" .. val:GetObjectType()
            data.origin     = true
        end
    elseif getmetatable(val) then
        data.cls            = path .. "." .. "meta:" .. tostring(getmetatable(val))
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
        return "[" .. item.Name .. (item.InnerType and (":{" .. item.InnerType .. "}") or item.Type and (":" .. item.Type) or "") .. "]"
    else
        return item.Name .. (item.InnerType and (":{" .. item.InnerType .. "}") or item.Type and (":" .. item.Type) or "")
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

function pushUrl(text, value, type, path)
    if value == nil then return end

    local index                 = #_History
    _History[index + 1]         = text
    _History[index + 2]         = value
    _History[index + 3]         = type
    _History[index + 4]         = (not path or path == "#") and "" or path

    if index >= 80 then
        for i = 1, 4 do tremove(_History, 1) end
    end

    return openUrl()
end

function popUrl()
    if #_History < 8 then return end

    for i = 1, 4 do tremove(_History) end
    return openUrl()
end

function openUrl()
    local index                 = #_History
    if index < 4 then return end

    local t, value, dtype, path = unpack(_History, index - 3)
    input:SetText(t)

    if dtype == VALUE_TYPE_API_DOCUMENT then
        if path == "" then
            -- The root level
            return viewer:SetText(TEMPLATE_API_DOCUMENT_ROOT{
                target          = value,

                -- Helpers
                _Locale         = _Locale,
                Color           = Color,
                List            = List,
                XDictionary     = XDictionary,
            })
        end

        local sys               = path:match("^([^%.]+)(.*)$")

        for _, item in ipairs(APIDocumentation.systems) do
            if item.Name == sys then
                return viewer:SetText(TEMPLATE_API_DOCUMENT_SYSTEM{
                    target      = item,

                    -- Helpers
                    parseEvent  = parseEvent,
                    parseFunc   = parseFunc,
                    parseTable  = parseTable,

                    _Locale     = _Locale,
                    Color       = Color,
                    List        = List,
                    XDictionary = XDictionary,
                })
            end
        end
    elseif dtype == VALUE_TYPE_PLOOP_TYPE then
        return viewer:SetText(TEMPLATE_TYPE{
            target              = value,

            Namespace           = Namespace,
            Enum                = Enum,
            Struct              = Struct,
            Interface           = Interface,
            Class               = Class,
            Property            = Property,
            Event               = Event,
            StructCategory      = StructCategory,

            UI                  = UI,
            _Locale             = _Locale,
            Color               = Color,
            List                = List,
            XDictionary         = XDictionary,
        })
    elseif dtype == VALUE_TYPE_NORMAL_TABLE then
        if path ~= "" then
            for name in path:gmatch("[^%.]+") do
                if name:match("^meta:") then
                    value       = getmetatable(value)
                else
                    value       = value[name] or value[tonumber(name)]
                end
            end
        end

        local data              = {
            target              = value,
            path                = path,

            _UICache            = _UICache,
            _Locale             = _Locale,
            Color               = Color,
            List                = List,
            XDictionary         = XDictionary,
        }

        parseUIObject(data, value, path)

        return viewer:SetText(TEMPLATE_TABLE(data))
    else
        return viewer:SetText(TEMPLATE_SIMPLE{
            target              = value,

            -- Helpers
            _Locale             = _Locale,
            Color               = Color,
            List                = List,
            XDictionary         = XDictionary,
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
TEMPLATE_SIMPLE                 = TemplateString[[
    <html>
        <body>
            <h1>
                <a href="^prev">&lt;&lt;&lt;</a>
                |
                <a href="^none">@type(target)</a>
            </h1>
            <br/>
            <p>@\target</p>
        </body>
    </html>
]]

TEMPLATE_API_DOCUMENT_ROOT      = TemplateString[[
    <html>
        <body>
            <h1>
                <a href="^prev">&lt;&lt;&lt;</a>
                |
                <a href="#">API Document</a>
            </h1>
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
                <a href="^prev">&lt;&lt;&lt;</a>
                |
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
            <h1>
                <a href="^prev">&lt;&lt;&lt;</a>
                |
            @if path ~= "" then
                <a href="#">@_Locale["Root"]</a>
                @local link = ""
                @for name in path:gmatch("[^%.]+") do link = link ~= "" and (link .. "." .. name) or name
                    / <a href="@\link">@\name</a>
                @end
                @>path = path .. "."
            @else
                <a href="^none">table</a>
            @end
            </h1>
            <br/>
            @if cls then
            <p><cyan>@_Locale["ObjectType"]</cyan> - <a href="@\cls">@cls:match(":(.*)$")</a></p>
            <br/>
            @end

            @{
                local lists

                for k, v in pairs(target) do
                    if type(k) == "number" then
                        lists           = lists or List()
                        lists:Insert(k)
                    end
                end
            }
            @if lists then
                <h1><cyan>List</cyan></h1>
                @for _, k in lists:Sort():GetIterator() do local v = target[k]
                    @if type(v) == "table" then
                        @if v == _G then
                            <p><a href="copyto:@\k">[@\k]</a> : _G</p>
                        @else
                            <p><a href="copyto:@\k">[@\k]</a> : <a href="@(path)@k">@tostring(v)</a></p>
                        @end
                    @else
                        <p><a href="copyto:@\k">[@\k]</a> : @\v</p>
                    @end
                @end
                <br/>
            @end

            @{
                local tables, funcs, constants
                local cache = {}

                for k, v in pairs(target) do
                    if type(k) ~= "number" then
                        local t         = type(v)
                        k               = tostring(k)
                        if t == "function" then
                            funcs       = funcs or {}
                            funcs[k]    = v
                        elseif t == "table" then
                            if type(v[0]) == "userdata" then
                                cache[v]= k
                            else
                                tables      = tables or {}
                                tables[k]   = v
                            end
                        else
                            constants   = constants or {}
                            constants[k]= v
                        end
                    end
                end
            }
            @if constants then
                <h1><cyan>Simple</cyan></h1>
                @for _, k in XDictionary(constants).Keys:ToList():Sort():GetIterator() do
                    <p><a href="copyto:@\k">@\k</a> : @\constants[k]</p>
                @end
                <br/>
            @end

            @if funcs then
                <h1><cyan>Function</cyan></h1>
                @for _, k in XDictionary(funcs).Keys:ToList():Sort():GetIterator() do
                    <p><orange>[F]</orange><a href="copyto:@\k">@\k</a></p>
                @end
                <br/>
            @end

            @if tables then
                <h1><cyan>Tables</cyan></h1>
                @for _, k in XDictionary(tables).Keys:ToList():Sort():GetIterator() do local v = tables[k]
                    @if v == _G then
                        <p><a href="copyto:@\k">@\k</a> : _G</p>
                    @else
                        <p><a href="copyto:@\k">@\k</a> : <a href="@(path)@k">@tostring(v)</a></p>
                    @end
                @end
                <br/>
            @end

            @if cls then
                @if origin then
                    @if target.GetChildren then
                        <h1><cyan>Children</cyan></h1>
                        @for i, child in ipairs{ target:GetChildren() } do
                            @if not (child.IsForbidden and child:IsForbidden()) then
                                @local name = child:GetName(true)
                                @local otype = child:GetObjectType()
                                @if name then name = name:gsub("^UIParent%.", "")
                                    <p><white>[@otype]</white><a href="copyto:@name"><orange>[_G]</orange>@name</a> : <a href="redirect:@name">@child</a></p>
                                @elseif cache[child] then name = cache[child] cache[child] = nil
                                    <p><white>[@otype]</white><a href="copyto:@name">[@name]</a> : <a href="@(path)@name">@child</a></p>
                                @else local debugname = child.GetDebugName and child:GetDebugName() or tostring(child) _UICache[debugname] = child
                                    <p><white>[@otype]</white><a href="redirect:@debugname">@debugname</a></p>
                                @end
                            @end
                        @end
                        <br/>
                    @end

                    @if target.GetRegions then
                        <h1><cyan>Regions</cyan></h1>
                        @for _, child in ipairs{ target:GetRegions() } do
                            @if not (child.IsForbidden and child:IsForbidden()) then
                                @local name = child:GetName(true)
                                @local otype = child:GetObjectType()
                                @if name then name = name:gsub("^UIParent%.", "")
                                    <p><white>[@otype]</white><a href="copyto:@name"><orange>[_G]</orange>@name</a> : <a href="redirect:@name">@child</a></p>
                                @elseif cache[child] then name = cache[child] cache[child] = nil
                                    <p><white>[@otype]</white><a href="copyto:@name">[@name]</a> : <a href="@(path)@name">@child</a></p>
                                @else local debugname = child.GetDebugName and child:GetDebugName() or tostring(child) _UICache[debugname] = child
                                    <p><white>[@otype]</white><a href="redirect:@debugname">@debugname</a></p>
                                @end
                            @end
                        @end
                        <br/>
                    @end

                    @if target.GetAnimationGroups then
                        <h1><cyan>AnimationGroup</cyan></h1>
                        @for _, child in ipairs{ target:GetAnimationGroups() } do
                            @if not (child.IsForbidden and child:IsForbidden()) then
                                @local name = child:GetName(true)
                                @local otype = child:GetObjectType()
                                @if name then name = name:gsub("^UIParent%.", "")
                                    <p><white>[@otype]</white><a href="copyto:@name"><orange>[_G]</orange>@name</a> : <a href="redirect:@name">@child</a></p>
                                @elseif cache[child] then name = cache[child] cache[child] = nil
                                    <p><white>[@otype]</white><a href="copyto:@name">[@name]</a> : <a href="@(path)@name">@child</a></p>
                                @else local debugname = child.GetDebugName and child:GetDebugName() or tostring(child) _UICache[debugname] = child
                                    <p><white>[@otype]</white><a href="redirect:@debugname">@debugname</a></p>
                                @end
                            @end
                        @end
                        <br/>
                    @end

                    @if target.GetAnimations then
                        <h1><cyan>Animation</cyan></h1>
                        @for _, child in ipairs{ target:GetAnimations() } do
                            @if not (child.IsForbidden and child:IsForbidden()) then
                                @local name = child:GetName(true)
                                @local otype = child:GetObjectType()
                                @if name then name = name:gsub("^UIParent%.", "")
                                    <p><white>[@otype]</white><a href="copyto:@name"><orange>[_G]</orange>@name</a> : <a href="redirect:@name">@child</a></p>
                                @elseif cache[child] then name = cache[child] cache[child] = nil
                                    <p><white>[@otype]</white><a href="copyto:@name">[@name]</a> : <a href="@(path)@name">@child</a></p>
                                @else local debugname = child.GetDebugName and child:GetDebugName() or tostring(child) _UICache[debugname] = child
                                    <p><white>[@otype]</white><a href="redirect:@debugname">@debugname</a></p>
                                @end
                            @end
                        @end
                        <br/>
                    @end
                @elseif target.GetChilds then
                    @for name, child in target:GetChilds() do local cname = child:GetChildPropertyName()
                        @if cname then
                            <p><a href="copyto:@cname"><orange>[P]</orange>@cname</a> : <a href="redirect:@child:GetName(true):gsub('^UIParent%.', '')">@child</a></p>
                        @else
                            <p><a href="copyto:@name">@name</a> : <a href="redirect:@child:GetName(true):gsub('^UIParent%.', '')">@child</a></p>
                        @end
                    @end
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
                <h1>
                    <a href="^prev">&lt;&lt;&lt;</a>
                    |
                @for sub in fullname:match("^(.*)%..-$"):gmatch("[^%.]+") do
                    @>link = link and (link .. "." .. sub) or sub
                    <a href="redirect:@\link">@\sub</a> /
                @end
                <a href="copyto:@\fullname">@\fullname:match("[^%.]+$")</a>
                </h1>
                <br/>
            @end


            @if nmsps then
                <h1><cyan>Namespace</cyan></h1>
                @for _, ns in nmsps:Sort():GetIterator() do
                    <p><a href="redirect:@ns">@ns</a></p>
                @end
                <br/>
            @end

            @if enums then
                <h1><cyan>Enum</cyan></h1>
                @for _, ns in enums:Sort():GetIterator() do
                    <p><a href="redirect:@ns">@ns</a></p>
                @end
                <br/>
            @end

            @if structs then
                <h1><cyan>Struct</cyan></h1>
                @for _, ns in structs:Sort():GetIterator() do
                    <p><a href="redirect:@ns">@ns</a></p>
                @end
                <br/>
            @end

            @if classes then
                <h1><cyan>Class</cyan></h1>
                @for _, ns in classes:Sort():GetIterator() do
                    <p><a href="redirect:@ns">@ns</a></p>
                @end
                <br/>
            @end

            @if interfaces then
                <h1><cyan>Interface</cyan></h1>
                @for _, ns in interfaces:Sort():GetIterator() do
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
                    local skins, simpprops, childprops

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

                    if UI.IsUIObjectType(target) then
                        skins = List(UI.Style.GetSkins(target)):Sort()

                        simpprops = List()
                        childprops = List()

                        for name, prop in UI.Style.GetProperties(target) do
                            if UI.IsUIObjectType(prop) then
                                childprops:Insert{ name = name, type = prop, tname = tostring(prop) }
                            else
                                simpprops:Insert(name)
                            end
                        end

                        childprops:Sort("x,y=>x.tname == y.tname and x.name < y.name or x.tname < y.tname")
                        simpprops:Sort()
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
                    @for _, name in stevts:Sort():GetIterator() do
                        <p><a href="copyto:@name">@name</a></p>
                    @end
                    <br/>
                @end

                @if stprops then
                    <h1><cyan>Static Property</cyan></h1>
                    @for _, name in stprops:Sort():GetIterator() do
                        <p><a href="copyto:@name">@name</a></p>
                    @end
                    <br/>
                @end

                @if stmtds then
                    <h1><cyan>Static Method</cyan></h1>
                    @for _, name in stmtds:Sort():GetIterator() do
                        <p><a href="copyto:@name">@name</a></p>
                    @end
                    <br/>
                @end

                @if evts then
                    <h1><cyan>Event</cyan></h1>
                    @for _, name in evts:Sort():GetIterator() do
                        <p><a href="copyto:@name">@name</a></p>
                    @end
                    <br/>
                @end

                @if props then
                    <h1><cyan>Property</cyan></h1>
                    @for _, name in props:Sort():GetIterator() do
                        <p><a href="copyto:@name">@name</a></p>
                    @end
                    <br/>
                @end

                @if mtds then
                    <h1><cyan>Method</cyan></h1>
                    @for _, name in mtds:Sort():GetIterator() do
                        <p><a href="copyto:@name">@name</a></p>
                    @end
                    <br/>
                @end

                @if skins and #skins > 0 then
                    <h1><cyan>Skins</cyan></h1>
                    @for _, name in skins:GetIterator() do
                        <p><a href="copyto:@name">@name</a></p>
                    @end
                    <br/>
                @end

                @if simpprops and #simpprops > 0 then
                    <h1><cyan>Style Property</cyan></h1>
                    @for _, name in simpprops:GetIterator() do
                        @local type = UI.Style.GetProperty(target, name)
                        <p><a href="copyto:@name">@name</a> - <a href="redirect:@type">@type</a></p>
                    @end
                    <br/>
                @end

                @if childprops and #childprops > 0 then
                    <h1><cyan>Style Child Property</cyan></h1>
                    @for _, child in childprops:GetIterator() do
                        <p><a href="copyto:@child.name">@child.name</a> - <a href="redirect:@child.type">@child.type</a></p>
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