---------------------------------------------------------------------------------------------------
-- LogView Frame Script
---------------------------------------------------------------------------------------------------

-- Addon Initialize
IGAS:NewAddon "Cube.Mdl_Cube_LogView"

-- Addon
_Addon.OnSlashCmd = _Addon.OnSlashCmd + function(self, option)
	if option and strupper(option) == "LOG" then
		Cube_LogView.Visible = true
		return true
	end
end

-- LogView

-- Max Log Count
_MaxLogCnt = 200

-- Scripts
_Loggers = {}
_LoggerPools = {}
_LoggerHandlers = {}

_BaseLog = newproxy(true)

_Meta = getmetatable(_BaseLog)

_Meta.__len = function(self)
	return _LoggerPools[self].EndIdx - _LoggerPools[self].StartIdx - 1
end

_Meta.__index = function(self, index)
	return (index and type(index) == "number" and _LoggerPools[self][_LoggerPools[self].StartIdx + index]) or nil
end

_Meta.__newindex = function(self, index, value)
	if index and type(index) == "number" and index > 0 then
		_LoggerPools[self][_LoggerPools[self].StartIdx + index] = value

		if value == nil then
			-- Remove Items
			for i = _LoggerPools[self].StartIdx + 1, _LoggerPools[self].StartIdx + index do
				_LoggerPools[self][i] = nil
			end

			_LoggerPools[self].StartIdx = _LoggerPools[self].StartIdx + index
		end

		if value ~= nil and _LoggerPools[self].StartIdx + index >= _LoggerPools[self].EndIdx then
			_LoggerPools[self].EndIdx = _LoggerPools[self].StartIdx + index + 1

			if _LoggerPools[self].EndIdx - _LoggerPools[self].StartIdx - 1 > _MaxLogCnt then
				for i = _LoggerPools[self].EndIdx + 1, _LoggerPools[self].EndIdx - _MaxLogCnt - 1 do
					_LoggerPools[self][i] = nil
				end
				_LoggerPools[self].StartIdx = _LoggerPools[self].EndIdx - _MaxLogCnt - 1
			end
		end
	end
end

function NewLogPool(logger)
	_Loggers[logger] = newproxy(_BaseLog)

	_LoggerPools[_Loggers[logger]] = {
		StartIdx = 0,
		EndIdx = 1,
	}

	return _Loggers[logger]
end

function AddLogger(logName)
	if type(logName) == "string" and strtrim(logName) ~= "" then
		local logger = IGAS:NewLogger(strtrim(logName))

		if logger == nil then
			Log(2, "Logger of "..tostring(logName).." is not found.")
		elseif not _Loggers[logger] then
			local logPool = NewLogPool(logger)

			nameList:AddItem(logger, logName)

			for i =#logger, 1, -1 do
				logPool[#logPool + 1] = logger[i]
			end

			_LoggerHandlers[logger] = function(msg)
				logPool[#logPool + 1] = msg
				if nameList:GetSelectedItemValue() == logger then
					viewList:Refresh()
				end
			end

			logger:AddHandler(_LoggerHandlers[logger])

			CubeSave.LogViewList[logName] = true
		end
	end
end

-- _M
function _M:OnLoad()
	CubeSave.LogViewList = CubeSave.LogViewList or {}

	for i in pairs(CubeSave.LogViewList) do
		AddLogger(i)
	end
end

-- spNV
function spNV:OnEnter()
	self.HighLight.Visible = true
end

function spNV:OnLeave()
	self.HighLight.Visible = false
end

function spNV:OnMouseDown()
	nameList:StartSizing("RIGHT")
end

function spNV:OnMouseUp()
	nameList:StopMovingOrSizing()
	nameList:SetPoint("TOPLEFT", Cube_LogView, "TOPLEFT", 4, -26)
	nameList:SetPoint("BOTTOMLEFT", Cube_LogView, "BOTTOMLEFT", 4, 46)
end

-- btnAdd
function btnAdd:OnClick()
	return AddLogger(IGAS:MsgBox(L["Please input the logger's name"], "ic"))
end

-- btnRemove
function btnRemove:OnClick()
	local logger = nameList:GetSelectedItemValue()
	local name = nameList:GetSelectedItemText()

	if logger then
		if IGAS:MsgBox(L["Do you want remove the logger : "]..name, "c") then
			logger:RemoveHandler(_LoggerHandlers[logger])

			viewList:Clear()

			nameList:RemoveItem(logger)

			_LoggerHandlers[logger] = nil
			_Loggers[logger] = nil
			CubeSave.LogViewList[name] = nil
		end
	end
end

-- btnClear
function btnClear:OnClick()
	local logger = nameList:GetSelectedItemValue()
	local name = nameList:GetSelectedItemText()
	
	if logger then
		if IGAS:MsgBox(L["Do you want clear the logger : "]..name, "c") then
			_Loggers[logger][#_Loggers[logger]] = nil
			viewList:Refresh()
		end
	end
end

-- nameList
function nameList:OnItemChoosed(logger, logname)
	if logger then
		viewList.Keys = _Loggers[logger]
		viewList.Items = _Loggers[logger]
		viewList:Refresh()
	end
end