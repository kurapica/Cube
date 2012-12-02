---------------------------------------------------------------------------------------------------
-- Cube Frame Script
---------------------------------------------------------------------------------------------------

-- Addon Initialize
IGAS:NewAddon "Cube.Guide"

-- Script
_Addon.OnSlashCmd = _Addon.OnSlashCmd + function(self, option)
	if option and strupper(option) == "CODE" then
		Cube_Guide.Visible = true
		return true
	end
end

function OnLoad(self)

end
