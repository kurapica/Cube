---------------------------------------------------------------------------------------------------
-- BugList Frame Script
---------------------------------------------------------------------------------------------------

-- Addon Initialize
IGAS:NewAddon "Cube.Mdl_Cube_BugList"

local ErrList = {}
local maxErr = 99
local errIndex = 0
local width

_Addon.OnSlashCmd = _Addon.OnSlashCmd + function(self, option)
	if option and strupper(option) == "BUG" then
		Cube_BugList.Visible = true
		return true
	end
end

function _M:OnLoad()
	_Enabled = (not CubeSave.DisableBugList)

	if CubeSave.IconPosition then
		icon.Position = CubeSave.IconPosition
	end
	icon.Init = true
end

local function Refresh()
	if errIndex < 1 then
		errIndex = 1
	end
	if errIndex > getn(ErrList) then
		errIndex = getn(ErrList)
	end
	if errIndex < 2 then
		btnLeft:Disable()
		leftNum.Text = ""
	else
		btnLeft:Enable()
		leftNum.Text = tostring(errIndex - 1)
	end

	if errIndex > getn(ErrList) - 1 then
		btnRight:Disable()
		rightNum.Text = ""
	else
		btnRight:Enable()
		rightNum.Text = tostring(getn(ErrList) - errIndex)
	end

	textView.Text = ErrList[errIndex] or ""
	if getn(ErrList) > 0 then
		icon.Text = tostring(getn(ErrList))
		if not icon.Visible then
			PlaySound("igMainMenuOpen")
			icon.Visible = true
		end
	else
		icon.Text = ""
		icon.Visible = false
	end
end

function btnLeft:OnClick()
	errIndex = errIndex - 1
	if errIndex < 1 then
		errIndex = 1
	end
	if errIndex > getn(ErrList) then
		errIndex = getn(ErrList)
	end
	Refresh()
end

function btnLeft:OnEnter()
	leftNum.Visible = false
end

function btnLeft:OnLeave()
	leftNum.Visible = true
end

function btnRight:OnClick()
	errIndex = errIndex + 1
	if errIndex < 1 then
		errIndex = 1
	end
	if errIndex > getn(ErrList) then
		errIndex = getn(ErrList)
	end
	Refresh()
end

function btnRight:OnEnter()
	rightNum.Visible = false
end

function btnRight:OnLeave()
	rightNum.Visible = true
end

function clear:OnClick()
	if ErrList[errIndex] then
		tremove(ErrList, errIndex)
		if errIndex > getn(ErrList) then
			errIndex = getn(ErrList)
		end
		Refresh()
	end
end

function clearAll:OnClick()
	if getn(ErrList) > 0 then
		for i = getn(ErrList), 1, -1 do
			tremove(ErrList, i)
		end
	end
	errIndex = 0
	Refresh()
end

function code:OnClick()
	if Cube_BugList.Parent:GetChild("Cube_Main") then
		Cube_BugList.Parent:GetChild("Cube_Main").Visible = true
	end
end

function debug:OnClick()
	if Cube_BugList.Parent:GetChild("Cube_Debug") then
		Cube_BugList.Parent:GetChild("Cube_Debug").Visible = true
	end
end

function enable:OnClick()
	if CubeSave.DisableBugList then
		Cube_BugList:Fire("OnEnable")
	else
		Cube_BugList:Fire("OnDisable")
	end
end

function Cube_BugList:OnEnable()
	enable.Text = L["Enabled"]
	width = enable:GetTextWidth()
	if ( width > 50 ) then
		enable:SetWidth(width + 20)
	else
		enable:SetWidth(60)
	end
	CubeSave.DisableBugList = nil
end

function Cube_BugList:OnDisable()
	enable.Text = L["Disabled"]
	width = enable:GetTextWidth()
	if ( width > 50 ) then
		enable:SetWidth(width + 20)
	else
		enable:SetWidth(60)
	end
	CubeSave.DisableBugList = true
end

function Cube_BugList:OnShow()
	Refresh()
end

function icon:OnPositionChanged()
	if self.Init then
		CubeSave.IconPosition = icon.Position
	end
end

function icon:OnClick()
	Cube_BugList.Visible = not Cube_BugList.Visible
end

-- Core Function
local real_seterrorhandler = seterrorhandler

-- Error handler
local function grabError(err)
	if CubeSave.DisableBugList then return end
	if getn(ErrList) >= maxErr then return end

	tinsert(ErrList, GetErrMsg(err))
	Refresh()
end

Cube_BugList.grabError = grabError

real_seterrorhandler(grabError)
function seterrorhandler() end