-- UI Designer script file
IGAS:NewAddon "Cube.Mdl_UI_Designer"

------------------------------------------------------
-- Property Editor
------------------------------------------------------
do
	function PropertyAdvance(object, prop)
		if not object or not prop then return end

		local ty = Reflector.GetPropertyType(Reflector.GetObjectClass(object), prop)[1]
		local sty

		-- Handle color type first
		if ty == ColorType then
			local ret = object[prop] or {}

			return IGAS:ColorPick(function(r, g, b, a)
				ret.r = r
				ret.g = g
				ret.b = b
				ret.a = a

				object[prop] = ret
			end, ret.r, ret.g, ret.b, ret.a)
		end

		-- Handle other struct type
		if Reflector.IsStruct(ty) then
			if Reflector.IsStruct(ty) and Reflector.GetStructType(ty) == "MEMBER" then


				return true
			elseif Reflector.IsStruct(ty) and Reflector.GetStructType(ty) == "ARRAY" then
				sty = Reflector.GetStructArrayElement(ty)

				if not sty or #sty ~= 1 or not ValidateType(sty[1]) then
					return false
				end

				return true
			end
		end
	end

	function StructAdvance()
	end
end