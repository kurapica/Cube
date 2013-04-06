---------------------------------------------------------------------------------------------------
-- Cube Main
---------------------------------------------------------------------------------------------------

-- Addon Initialize
IGAS:NewAddon("Cube")

import "System"
import "System.Widget"

-- Localization
L = IGAS:NewLocale("Cube")

-- Logger
Log = IGAS:NewLogger("Cube")

Log.LogLevel = 2

Log:SetPrefix(1, "[Cube:Debug]")
Log:SetPrefix(2, "[Cube:Info]")

Log:AddHandler(print)

GRN    ='|cff20ff20'
YEL    ='|cffffff00'
RED    ='|cffff0000'
WHT    ='|cffffffff'
BLU    ='|cff8888ff'
DRKBLU ='|cff1b0495'
ORN    ='|cffff9C00'
GRY    ='|cffA0A0A0'

-- Binding Text
_G.BINDING_HEADER_CUBE = L["Cube"]
_G.BINDING_NAME_CUBE_CODE = L["Simple Dev Tool"]
_G.BINDING_NAME_CUBE_BUGLIST = L["Simple Bug List"]
_G.BINDING_NAME_CUBE_DEBUG = L["Simple Debug Tool"]
_G.BINDING_NAME_CUBE_LOGVIEW = L["Simple Log View"]
_G.BINDING_NAME_CUBE_BROWSER = L["Simple Browser"]

_G.Cube = {}
Cube = _G.Cube

function _Addon:OnLoad()
	-- SavedVariables
	self:AddSavedVariable("CubeSave")
	self:AddSavedVariable("CubeSavePerCharacter")

	-- Slash command
	self:AddSlashCmd("/cube")
end

function _Addon:OnSlashCmd()
	Log(2, "/cube code  ("..L["Open the code editor"]..")")
	Log(2, "/cube bug   ("..L["Open the buglist"]..")")
	Log(2, "/cube debug ("..L["Open the debug tool"]..")")
	Log(2, "/cube log   ("..L["Open the log view"]..")")
	Log(2, "/cube br   ("..L["Open the igas browser"]..")")
end

-- Functions
function GetErrMsg(err)
	if not err or err == "" then
		return
	end

	-- Get the full backtrace
	local real =
		err:find("^.-([^\\]+\\)([^\\]-)(:%d+):(.*)$") or
		err:find("^%[string \".-([^\\]+\\)([^\\]-)\"%](:%d+):(.*)$") or
		err:find("^%[string (\".-\")%](:%d+):(.*)$") or err:find("^%[C%]:(.*)$")

	err = err .. "\n" .. debugstack(real and 4 or 3)

	local errorType = "error"

	-- Normalize the full paths into last directory component and filename.
	local errmsg = ""

	for trace in err:gmatch("(.-)\n") do
		local match, found, path, file, line, msg, _
		found = false

		-- "Interface\AddOns\path\to\file.lua:linenum:message"
		if not found then
			match, _, path, file, line, msg = trace:find("^.-[A%.][d%.][d%.][Oo]ns\\(.*)([^\\]-)(:%d+):(.*)$")
			if match then
				found = true
				local addon = path:gsub("\\.*$", "")
				local addonObject = _G[addon]
				if not addonObject then
					addonObject = _G[addon:match("^[^_]+_(.*)$")]
				end
				local version, revision = nil, nil
				local objectName = addon:upper()
				if not version then version = _G[objectName .. "_VERSION"] end
				if not revision then revision = _G[objectName .. "_REVISION"] or _G[objectName .. "_REV"] end
				if not version then version = GetAddOnMetadata(addon, "Version") end
				if not version and revision then version = revision
				elseif type(version) == "string" and revision and not version:find(revision) then
					version = version .. "." .. revision
				end
				if version then
					path = addon .. "-" .. version .. path:gsub("^[^\\]*", "")
				end
			end
		end

		-- "path\to\file.lua:linenum:message"
		if not found then
			match, _, path, file, line, msg = trace:find("^.-([^\\]+\\)([^\\])(:%d+):(.*)$")
			if match then
				found = true
			end
		end

		-- "[string \"path\\to\\file.lua:<foo>\":linenum:message"
		if not found then
			match, _, path, file, line, msg = trace:find("^%[string \".-([^\\]+\\)([^\\]-)\"%](:%d+):(.*)$")
			if match then
				found = true
			end
		end

		-- "[string \"FOO\":linenum:message"
		if not found then
			match, _, file, line, msg = trace:find("^%[string (\".-\")%](:%d+):(.*)$")
			if match then
				found = true
				path = "<string>:"
			end
		end

		-- "[C]:message"
		if not found then
			match, _, msg = trace:find("^%[C%]:(.*)$")
			if match then
				found = true
				path = "<in C code>"
				file = ""
				line = ""
			end
		end

		-- Anything else
		if not found then
			path = trace--"<unknown>"
			file = ""
			line = ""
			msg = line
		end

		-- Add it to the formatted error
		errmsg = errmsg .. path .. file .. line .. ":" .. msg .. "\n"
	end

	return errmsg
end

local function orderKey(t1, t2)
	if t1 and t2 then
		if type(t1) == "number" and type(t2) == "number" then
			return t1 < t2
		elseif type(t1) == "string" and type(t2) ~= "string" then
			return true
		elseif type(t1) ~= "string" and type(t2) == "string" then
			return false
		else
			return tostring(t1) < tostring(t2)
		end
	else
		return tostring(t1) < tostring(t2)
	end
end

function pairsByKeys (t, f)
	local a = {}
	for n in pairs(t) do table.insert(a, n) end
	table.sort(a, f or orderKey)
	local i = 0      -- iterator variable
	local iter = function ()   -- iterator function
		i = i + 1
		if a[i] == nil then
			return nil
		else
			return a[i], t[a[i]]
		end
	end
	return iter
end

local readedTable = {}
function Format(v, format)
    if type(v) == "string" and format then
        return string.format("%q", v)
    elseif type(v) == "table" then
    	wipe(readedTable)
    	local ret = SerializeTable(v)
    	wipe(readedTable)
    	return ret
    else
        return tostring(v)
    end
end

function SerializeTable(t)
    readedTable[t] = true

    local str = "{\n"

    for name, value in pairs(t) do
        if type(name) == "string" or type(name) == "number" then
            name = Format(name, true)
            if type(value) == "table" then
            	if readedTable[value] then
            		str = str.."    ["..name.."] = "..tostring(value)..",\n"
            	else
                	str = str.."    ["..name.."] = "..string.gsub(SerializeTable(value), "\n", "\n    ")..",\n"
                end
            elseif type(value) == "number" or type(value) == "string" then
                str = str.."    ["..name.."] = "..Format(value, true)..",\n"
            elseif type(value) == "boolean" then
                value = (value and true) or false
                str = str.."    ["..name.."] = "..Format(value, true)..",\n"
            end
        end
    end

    str = str.."}"

    return str
end

local LOCAL_ToStringAllTemp = {}
function tostringall(...)
    local n = select('#', ...)
    -- Simple versions for common argument counts
    if (n == 1) then
        return Format(...)
    elseif (n == 2) then
        local a, b = ...
        return Format(a), Format(b)
    elseif (n == 3) then
        local a, b, c = ...
        return Format(a), Format(b), Format(c)
    elseif (n == 0) then
        return
    end

    local needfix
    for i = 1, n do
        local v = select(i, ...)
        if (type(v) ~= "string") then
            needfix = i
            break
        end
    end
    if (not needfix) then return ... end

    wipe(LOCAL_ToStringAllTemp)
    for i = 1, needfix - 1 do
        LOCAL_ToStringAllTemp[i] = select(i, ...)
    end
    for i = needfix, n do
        LOCAL_ToStringAllTemp[i] = Format(select(i, ...))
    end
    return unpack(LOCAL_ToStringAllTemp)
end

local LOCAL_PrintHandler =
    function(...)
        DEFAULT_CHAT_FRAME:AddMessage(strjoin(" ", tostringall(...)))
    end

function setprinthandler(func)
    if (type(func) ~= "function") then
        error("Invalid print handler")
    else
        LOCAL_PrintHandler = func
    end
end

function getprinthandler() return LOCAL_PrintHandler end

function print(...)
	LOCAL_PrintHandler(...)
end