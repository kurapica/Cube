-- Addon Initialize
IGAS:NewAddon "Cube.Mdl_Browser"

import "System"
import "System.Reflector"

IsClass = Reflector.IsClass
IsInterface = Reflector.IsInterface
HasEvent = Reflector.HasEvent

HTML_TEMPLATE = [[
<html>
<body>
%s
<br/>　
%s
</body>
</html>
]]

HTML_PAGE_TEMPLATE = [[<p>%s</p>]]
HTML_HREF_TEMPLATE = [[<a href="%s">%s</a>]]

HTML_NO_DOCUMENT = [[
<html>
<body>
<p>
The document system in IGAS is disabled, please enable it to use the browser :<br/><br/>

Open the /World of Warcraft/Interface/AddOns/IGAS/IGAS.lua, find<br/><br/>
<lime>System.Reflector.EnableDocumentSystem(<red>false</red>)</lime><br/><br/>
Change to<br/><br/>
<lime>System.Reflector.EnableDocumentSystem(<red>true</red>)</lime><br/><br/>
Save the file, then reload the game.
</p>
</body>
</html>
]]

-- Event handler
_Addon.OnSlashCmd = _Addon.OnSlashCmd + function(self, option)
	if option and (strupper(option) == "BROWSER" or strupper(option) == "BR") then
		browser.Visible = true
		return true
	end
end

function _M:OnLoad()
	if CubeSave.BrowserSize then
		browser.Size = CubeSave.BrowserSize
	end

	if CubeSave.BrowserLocation then
		browser.Location = CubeSave.BrowserLocation
	end
end

function browser:OnShow()
	if _G.PLOOP_DOCUMENT_ENABLED or _G.PLOOP_DOCUMENT_ENABLED == nil then
		html.Text = LoadUrl("System")
	else
		html.Text = HTML_NO_DOCUMENT
	end
	browser.OnShow = nil
end

function browser:OnSizeChanged()
	CubeSave.BrowserSize = self.Size
end

function browser:OnPositionChanged()
	CubeSave.BrowserLocation = self.Location
end

function html:OnHyperlinkClick(data)
	local data = LoadUrl(data)

	if data then
		Threading.Sleep(0.1)

		html.Text = data
	end
end

_History = {
	Index = 0,
}

function LoadUrl(data)
	if data == "Back" then
		if _History.Index <= 1 then
			return
		end

		_History.Index = _History.Index - 1

		data = _History[_History.Index]
	elseif data == "Next" then
		if not _History[_History.Index + 1] then
			return
		end

		_History.Index = _History.Index + 1
		data = _History[_History.Index]
	else
		if data == _History[_History.Index] then
			return
		end

		_History.Index = _History.Index + 1
		_History[_History.Index] = data
	end

	local header = HTML_PAGE_TEMPLATE:format(BuildHeader(data))
	local body = HTML_PAGE_TEMPLATE:format(BuildBody(data))

	return HTML_TEMPLATE:format(header, body)
end

function BuildHref(data, text)
	if type(data) == "string" then
		text = text or data
		return HTML_HREF_TEMPLATE:format(data, text)
	else
		text = text or GetNameSpaceFullName(data)
		return HTML_HREF_TEMPLATE:format(GetNameSpaceFullName(data), text)
	end
end

function ParseInfo(content)
	if content then
		content = content:gsub("|", "||")
		content = content:gsub("System%.[%._%w]*%w+", BuildHref)
	end

	return content
end

function BuildHeader(data)
	local ns = IGAS
	local header = BuildHref("Back", "&lt;&lt;&lt;") .. "　" .. BuildHref("Next", "&gt;&gt;&gt;") .. "　　　"

	local isFirst = true

	if type(data) == "string" then
		for sname in data:gmatch("[^%.]+") do
			sname = sname:match("[_%w]+")

			if type(ns[sname]) == "userdata" then
				ns = ns[sname]
				if isFirst then
					isFirst = false
					header = header .. BuildHref(ns, sname)
				else
					header = header .. " &gt; " .. BuildHref(ns, sname)
				end
			else
				if header == "" then
					header = sname
				else
					header = header .. " &gt; " .. sname
				end

				break
			end
		end
	end

	return header
end

_Enums = {}
_Structs = {}
_Classes = {}
_Interfaces = {}
_Namespaces = {}

function BuildSubNamespace(ns)
	local result = ""

	wipe(_Enums)
	wipe(_Structs)
	wipe(_Classes)
	wipe(_Interfaces)
	wipe(_Namespaces)

	local subNS = GetSubNamespace(ns)

	if subNS and next(subNS) then
		for _, sns in ipairs(subNS) do
			sns = ns[sns]

			if IsEnum(sns) then
				tinsert(_Enums, sns)
			elseif IsStruct(sns) then
				tinsert(_Structs, sns)
			elseif IsInterface(sns) then
				tinsert(_Interfaces, sns)
			elseif IsClass(sns) then
				tinsert(_Classes, sns)
			else
				tinsert(_Namespaces, sns)
			end
		end

		if next(_Enums) then
			result = result .. "<br/><br/>　<cyan>Sub Enum</cyan> :"

			for _, sns in ipairs(_Enums) do
				result = result .. "<br/>　　" .. BuildHref(sns)
			end
		end

		if next(_Structs) then
			result = result .. "<br/><br/>　<cyan>Sub Struct</cyan> :"

			for _, sns in ipairs(_Structs) do
				result = result .. "<br/>　　" .. BuildHref(sns)
			end
		end

		if next(_Interfaces) then
			result = result .. "<br/><br/>　<cyan>Sub Interface</cyan> :"

			for _, sns in ipairs(_Interfaces) do
				result = result .. "<br/>　　" .. BuildHref(sns)
			end
		end

		if next(_Classes) then
			result = result .. "<br/><br/>　<cyan>Sub Class</cyan> :"

			for _, sns in ipairs(_Classes) do
				result = result .. "<br/>　　" .. BuildHref(sns)
			end
		end

		if next(_Namespaces) then
			result = result .. "<br/><br/>　<cyan>Sub NameSpace</cyan> :"

			for _, sns in ipairs(_Namespaces) do
				result = result .. "<br/>　　" .. BuildHref(sns)
			end
		end
	end

	return result
end

function GetDocumentPart(owner, name, part)
	local doc = GetDocument(owner, name)
	if doc and doc:match("<.->") then
		return doc:gmatch(("<%s(.-)>(.-)</%s>"):format(part, part))
	elseif doc and part == "desc" then
		local flag = true
		return function() if flag then flag = false return "", doc end end
	end
end

function GetParameterPart(param, part)
	if param then
		return param:match(part .. "%s*=%s*[\'\"](.-)[\'\"]")
	end
end

function BuildBody(data)
	local ns = IGAS
	local name = nil
	local doctype = nil

	if type(data) == "string" then
		for sname in data:gmatch("[^%.]+") do
			sname = sname:match("[_%w]+")

			if type(ns[sname]) == "userdata" then
				ns = ns[sname]
			elseif not name then
				name = sname
			else
				doctype = sname
			end
		end

		if IsNameSpace(ns) then
			if IsEnum(ns) then
				-- Enum
				local result = "<blue>[Enum]</blue> " .. BuildHref(ns) .. " :<br/>"
				local value
				for _, enums in ipairs(GetEnums(ns)) do
					value = ns[enums]

					if type(value) == "string" then
						value = ("%q"):format(value)
					else
						value = tostring(value)
					end

					result = result .. "<br/>　　" .. enums .. " = " .. value
				end
				return result
			elseif IsStruct(ns) then
				-- Struct
				local result = "<blue>[Struct]</blue> " .. BuildHref(ns) .. " :"

				-- SubNameSpace
				result = result .. BuildSubNamespace(ns)

				if GetStructType(ns) == "MEMBER" then
					-- Part
					local parttype, typestring
					local parts = GetStructMembers(ns)

					if parts and next(parts) then
						result = result .. "<br/><br/>　<cyan>Member</cyan>:"

						for _, name in ipairs(parts) do
							parttype = GetStructMember(ns, name)

							typestring = ""

							for _, tns in ipairs(parttype) do
								typestring = typestring .. " + " .. BuildHref(tns)
							end

							-- NameSpace
							local index = -1
							while parttype[index] do
								typestring = typestring .. " - " .. BuildHref(parttype[index])

								index = index - 1
							end

							-- Allow nil
							if parttype.AllowNil then
								typestring = typestring .. " + nil"
							end

							if typestring:sub(1, 2) == " +" then
								typestring = typestring:sub(3, -1)
							end

							result = result .. "<br/>　　" .. name .. " =" .. typestring
						end
					end
				elseif GetStructType(ns) == "ARRAY" then
					local parttype = GetStructArrayElement(ns)
					local typestring = ""

					if parttype then
						for _, tns in ipairs(parttype) do
							typestring = typestring .. " + " .. BuildHref(tns)
						end

						-- NameSpace
						local index = -1
						while parttype[index] do
							typestring = typestring .. " - " .. BuildHref(parttype[index])

							index = index - 1
						end

						-- Allow nil
						if parttype.AllowNil then
							typestring = typestring .. " + nil"
						end

						if typestring:sub(1, 2) == " +" then
							typestring = typestring:sub(3, -1)
						end

						result = result .. "<br/><br/>　<cyan>Element</cyan> :<br/>　　Type =" .. typestring
					end
				else
					result = result .. "<br/><br/>　<cyan>Basic Element</cyan>"
				end
				return result
			elseif IsClass(ns) or IsInterface(ns) then
				-- Interface & Class
				if not name or name == "" then
					local result
					local desc
					local isInterface = false

					if IsInterface(ns) then
						isInterface = true
						result = "<blue>[Interface]</blue> " .. BuildHref(ns) .. " :"
					else
						result = "<blue>[Class]</blue> " .. BuildHref(ns) .. " :"
					end

					-- Desc
					desc = GetDocumentPart(ns, nil, "desc")
					desc = desc and select(2, desc())
					if desc then
						result = result .. "<br/><br/>　<cyan>Description</cyan> :<br/>　　" .. desc:gsub("<br>", "<br/>　　")
					end

					-- Inherit
					if GetSuperClass(ns) then
						result = result .. "<br/><br/>　<cyan>Super Class</cyan> :<br/>　　" .. BuildHref(GetSuperClass(ns))
					end

					-- Extend
					local extends = GetExtendInterfaces(ns)
					if extends and next(extends) then
						result = result .. "<br/><br/>　<cyan>Extend Interface</cyan> :"
						for _, IF in ipairs(extends) do
							result = result .. "<br/>　　" .. BuildHref(IF)
						end
					end

					-- SubNameSpace
					result = result .. BuildSubNamespace(ns)

					-- Event
					local events = GetEvents(ns, true)
					if events and next(events) then
						result = result .. "<br/><br/>　<cyan>Event</cyan> :"
						for _, sc in pairs(events) do
							-- Desc
							desc = GetDocumentPart(ns, sc, "desc")
							desc = desc and select(2, desc())
							if desc then
								desc = "　-　" .. desc:gsub("<br>", "<br/>　　　　")
							else
								desc = ""
							end

							result = result .. "<br/>　　" .. BuildHref(GetNameSpaceFullName(ns).."."..sc.."-event", sc) .. desc
						end
					end

					-- Property
					local props = GetProperties(ns, true)
					if props and next(props) then
						result = result .. "<br/><br/>　<cyan>Property</cyan> :"
						for _, prop in pairs(props) do
							-- Desc
							desc = GetDocumentPart(ns, prop, "desc")
							desc = desc and select(2, desc())
							if desc then
								desc = "　-　" .. desc:gsub("<br>", "<br/>　　　　")
							else
								desc = ""
							end

							if isInterface then
								if IsRequireProperty(ns, prop) then
									desc = desc .. "(Require)"
								elseif IsOptionalProperty(ns, prop) then
									desc = desc .. "(Optional)"
								end
							end

							result = result .. "<br/>　　" .. BuildHref(GetNameSpaceFullName(ns).."."..prop.."-property", prop) .. desc
						end
					end

					-- Method
					local methods = GetMethods(ns, true)
					if methods and next(methods) then
						result = result .. "<br/><br/>　<cyan>Method</cyan> :"
						for _, method in pairs(methods) do
							-- Desc
							desc = GetDocumentPart(ns, method, "desc")
							desc = desc and select(2, desc())
							if desc then
								desc = "　-　" .. desc:gsub("<br>", "<br/>　　　　")
							else
								desc = ""
							end

							if isInterface then
								if IsRequireMethod(ns, method) then
									desc = desc .. "(Require)"
								elseif IsOptionalMethod(ns, method) then
									desc = desc .. "(Optional)"
								end
							end

							result = result .. "<br/>　　" .. BuildHref(GetNameSpaceFullName(ns).."."..method.."-method", method) .. desc
						end
					end

					-- Constructor
					local isFormat = false
					desc = nil

					if not isInterface then
						local ons = ns

						while ns do
							isFormat = true

							desc = GetDocumentPart(ns, nil, "format")
							if not desc then
								isFormat = false
								desc = GetDocumentPart(ns, nil, "param")
							end

							if desc then
								-- Constructor
								result = result .. "<br/><br/>　<cyan>Constructor</cyan> :"
								if isFormat then
									for _, fmt in desc do
										result = result .. "<br/>　　" .. GetNameSpaceName(ns) .. "(" .. fmt .. ")"
									end
								else
									result = result .. "<br/>　　" .. GetNameSpaceName(ns) .. "("

									local cnt = 1

									for param in desc do
										local name = GetParameterPart(param, "name") or "arg" .. cnt
										if cnt == 1 then
											result = result .. name
										else
											result = result .. ", " .. name
										end
										cnt = cnt + 1
									end

									result = result .. ")"
								end

								-- Params
								desc = GetDocumentPart(ns, nil, "param")
								if desc then
									result = result .. "<br/><br/>　<cyan>Parameter</cyan> :"
									local cnt = 1
									for param, info in desc do
										local name = GetParameterPart(param, "name") or "arg" .. cnt
										local ty = GetParameterPart(param, "type")

										if ty then name = name .. " (" .. ty .. ")" end

										if info and info:len() > 0 then
											result = result .. "<br/>　　" .. ParseInfo(name) .. " - " .. ParseInfo(info)
										else
											result = result .. "<br/>　　" .. ParseInfo(name)
										end
										cnt = cnt + 1
									end
								end

								break
							end

							ns = GetSuperClass(ns)
						end

						ns = ons
					end

					-- Usage
					desc = GetDocumentPart(ns, nil, "usage")
					if desc then
						result = result .. "<br/><br/>　<cyan>Usage</cyan> :"
						for _, usage in desc do
							result = result .. "<br/>　　" .. usage:gsub("<br>", "<br/>　　"):gsub("  ", "　"):gsub("\t", "　　")
						end
					end

					return result
				else
					local result
					local querytype

					if IsInterface(ns) then
						result = "<blue>[Interface]</blue> " .. BuildHref(ns) .. " - "
					else
						result = "<blue>[Class]</blue> " .. BuildHref(ns) .. " - "
					end

					querytype = doctype

					if not querytype then
						if HasEvent(ns, name) then
							querytype = "event"
						elseif HasProperty(ns, name) then
							querytype = "property"
						elseif type(ns[name]) == "function" then
							querytype = "method"
						else
							return
						end
					end

					local doctype = querytype or "default"

					if doctype:match("^%a") then
						result = result .. "[" .. doctype:match("^%a"):upper() .. doctype:sub(2, -1) .. "] " .. name .. " :"
					else
						result = result .. "[" .. doctype .. "] " .. name .. " :"
					end

					-- Desc
					local desc = GetDocumentPart(ns, name, "desc")
					desc = desc and select(2, desc())
					if desc then
						result = result .. "<br/><br/>　<cyan>Description</cyan> :<br/>　　" .. desc:gsub("<br>", "<br/>　　")
					end

					if querytype == "event" then
						-- Format
						desc = GetDocumentPart(ns, name, "format")
						if desc then
							result = result .. "<br/><br/>　<cyan>Format</cyan> :"
							for _, fmt in desc do
								result = result .. "<br/>　　" .. "function object:" .. name .. "(" .. ParseInfo(fmt) .. ")<br/>　　   -- Handle the event<br/>　  end"
							end
						else
							result = result .. "<br/><br/>　<cyan>Format</cyan> :<br/>　  function object:" .. name .. "("

							desc = GetDocumentPart(ns, name, "param")

							if desc then
								local cnt = 1
								for param in desc do
									local name = GetParameterPart(param, "name") or "arg" .. cnt
									if cnt == 1 then
										result = result .. ParseInfo(name)
									else
										result = result .. ", " .. ParseInfo(name)
									end
									cnt = cnt + 1
								end
							end

							result = result .. ")<br/>　  　  -- Handle the event<br/>　  end"
						end

						-- Params
						desc = GetDocumentPart(ns, name, "param")
						if desc then
							local cnt = 1
							result = result .. "<br/><br/>　<cyan>Parameter</cyan> :"
							for param, info in desc do
								local name = GetParameterPart(param, "name") or "arg" .. cnt
								local ty = GetParameterPart(param, "type")
								if ty then name = name .. " (" .. ty .. ")"
								if info and info:len() > 0 then
									result = result .. "<br/>　  " .. ParseInfo(name) .. " - " .. ParseInfo(info)
								else
									result = result .. "<br/>　  " .. ParseInfo(name)
								end
								cnt = cnt + 1
							end
						end
					elseif querytype == "property" then
						local types = GetPropertyType(ns, name)

						if types then
							result = result .. "<br/><br/>　<cyan>Type</cyan> :<br/>　　" .. tostring(types)
						end

						-- Readonly
						result = result .. "<br/><br/>　<cyan>Readable</cyan> :<br/>　　" .. tostring(IsPropertyReadable(ns, name))

						-- Writable
						result = result .. "<br/><br/>　<cyan>Writable</cyan> :<br/>　　" .. tostring(IsPropertyWritable(ns, name))
					elseif querytype == "method" then
						local isGlobal = false

						if name:match("^_") or (IsInterface(ns) and IsNonInheritable(ns)) then
							isGlobal = true
						end

						-- Format
						desc = GetDocumentPart(ns, name, "format")
						result = result .. "<br/><br/>　<cyan>Format</cyan> :"
						if desc then
							for _, fmt in desc do
								if isGlobal then
									result = result .. "<br/>　　" .. GetNameSpaceName(ns) .. "." .. name .. "(" .. ParseInfo(fmt) .. ")"
								else
									result = result .. "<br/>　　object:" .. name .. "(" .. ParseInfo(fmt) .. ")"
								end
							end
						else
							if isGlobal then
								result = result .. "<br/>　　" .. GetNameSpaceName(ns) .. "." .. name .. "("
							else
								result = result .. "<br/>　　object:" .. name .. "("
							end

							desc = GetDocumentPart(ns, name, "param")

							if desc then
								local cnt = 1
								for param in desc do
									local name = GetParameterPart(param, "name") or "arg" .. cnt
									if cnt == 1 then
										result = result .. ParseInfo(name)
									else
										result = result .. ", " .. ParseInfo(name)
									end
									cnt = cnt + 1
								end
							end

							result = result .. ")"
						end

						-- Params
						desc = GetDocumentPart(ns, name, "param")
						if desc then
							local cnt = 1
							result = result .. "<br/><br/>　<cyan>Parameter</cyan> :"
							for param, info in desc do
								local name = GetParameterPart(param, "name") or "arg" .. cnt
								local ty = GetParameterPart(param, "type")
								if ty then name = name .. " (" .. ty .. ")" end
								if info and info:len() > 0 then
									result = result .. "<br/>　　" .. ParseInfo(name) .. " - " .. ParseInfo(info)
								else
									result = result .. "<br/>　　" .. ParseInfo(name)
								end
								cnt = cnt + 1
							end
						end

						-- ReturnFormat
						desc = GetDocumentPart(ns, name, "returnformat")
						if desc then
							result = result .. "<br/><br/>　<cyan>Return Format</cyan> :"
							for _, fmt in desc do
								result = result .. "<br/>　　" .. ParseInfo(fmt)
							end
						end

						-- Returns
						desc = GetDocumentPart(ns, name, "return")
						if desc then
							local cnt = 1
							result = result .. "<br/><br/>　<cyan>Return</cyan> :"
							for ret, info in desc do
								local name = GetParameterPart(ret, "name") or "ret" .. cnt
								local ty = GetParameterPart(ret, "type")
								if ty then name = name .. " (" .. ty .. ")" end
								if info and info:len() > 0 then
									result = result .. "<br/>　　" .. ParseInfo(name) .. " - " .. ParseInfo(info)
								else
									result = result .. "<br/>　　" .. ParseInfo(name)
								end
								cnt = cnt + 1
							end
						end
					else
						-- skip
					end

					-- Usage
					desc = GetDocumentPart(ns, name, "usage")
					if desc then
						result = result .. "<br/><br/>　<cyan>Usage</cyan> :"
						for _, usage in desc do
							result = result .. "<br/>　　" .. usage:gsub("<br>", "<br/>　　"):gsub("  ", "　"):gsub("\t", "　　")
						end
					end

					return result
				end
			else
				local result = "<blue>[NameSpace]</blue> " .. BuildHref(ns) .. " :"
				local desc = GetDocumentPart(ns, nil, "desc")

				-- Desc
				desc = desc and select(2, desc())
				if desc then
					result = result .. "<br/><br/>　<cyan>Description</cyan> :<br/>　　" .. desc
				end

				-- SubNameSpace
				result = result .. BuildSubNamespace(ns)

				return result
			end
		end
	end

	return data
end
