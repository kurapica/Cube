IGAS:NewAddon "Cube.Mdl_Cube_Main"

-----------------------------------
-- Cube Definition
-----------------------------------
class "CubeEditor"
	inherit "CodeEditor"

	__Doc__[[Save the content]]
	function Save(self) end

	__Doc__[[Run the content]]
	function Run(self) end

	__Doc__[[Reset the content]]
	function Reset(self) end
endclass "CubeEditor"