-- UI Designer layout file
IGAS:NewAddon "Cube.Mdl_UI_Designer"

------------------------------------------------------
-- Main Layout
------------------------------------------------------
_UIDesigner = SplitLayoutPanel("Cube_UI_Designer", WorldFrame)
_UIDesigner.Visible = false
_UIDesigner:SetAllPoints()
_UIDesigner.MouseEnabled = true

_MenuStrip = MenuStrip("MenuStrip", _UIDesigner)
_UIDesigner:AddWidget(_MenuStrip, "north", NODE_HEIGHT + 6, "px")

_WidgetList = WidgetList("WidgetList", _UIDesigner)
_UIDesigner:AddWidget(_WidgetList, "west", 150, "px")

_ElementList = ElementList("ElementList", _UIDesigner)
_UIDesigner:AddWidget(_ElementList, "east", 150, "px")

_Designer = Designer("Designer", _UIDesigner)
_UIDesigner:AddWidget(_Designer, "rest")
