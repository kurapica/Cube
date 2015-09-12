-- UI Designer definition file
IGAS:NewAddon "Cube.Mdl_UI_Designer"

import "System.Widget"
import "System.Widget.Action"
import "System.Widget.Unit"

------------------------------------------------------
--- Global Definitions
------------------------------------------------------
do
	-- Default border color
	DEFAULT_BORDER_COLOR = ColorType(1, 1, 1)
	CLICK_BORDER_COLOR = ColorType(1, 0, 0)

	NODE_HEIGHT = 24

	-- Property cache for widget classes
	FILTER_PROPERTY = {
		Parent = true,
	}

	EMPTY = {}

	local function ValidateType(ty)
		if ty == Number or ty == String or ty == Boolean or ty == LocaleString or Reflector.IsEnum(ty) then
			return true
		end

		local sty

		if Reflector.IsStruct(ty) and Reflector.GetStructType(ty) == "MEMBER" then
			for _, part in ipairs(Reflector.GetStructParts(ty) or EMPTY) do
				sty = Reflector.GetStructPart(ty, part)

				if not sty or #sty ~= 1 or not ValidateType(sty[1]) then
					return false
				end
			end

			return true
		elseif Reflector.IsStruct(ty) and Reflector.GetStructType(ty) == "ARRAY" then
			sty = Reflector.GetStructArrayElement(ty)

			if not sty or #sty ~= 1 or not ValidateType(sty[1]) then
				return false
			end

			return true
		end

		return false
	end

	WIDGET_PROPERTY_CACHE = setmetatable({}, {
		__index = function(self, key)
			if Reflector.IsClass(key) and (Reflector.IsSuperClass(key, System.Widget.UIObject) or Reflector.IsSuperClass(key, System.Widget.VirtualUIObject)) then
				self[key] = {}

				for _, name in ipairs(Reflector.GetProperties(key)) do
					self[key][name] = true
				end

				return rawget(self, key)
			end
		end,
	})

	WIDGET_PROPERTY = setmetatable({}, {
		__index = function(self, key)
			if Reflector.IsClass(key) and (Reflector.IsSuperClass(key, System.Widget.UIObject) or Reflector.IsSuperClass(key, System.Widget.VirtualUIObject)) then
				self[key] = {}

				local spCache = Reflector.GetSuperClass(key)
				spCache = WIDGET_PROPERTY_CACHE[spCache] or EMPTY

				-- Fill data
				for name in pairs(WIDGET_PROPERTY_CACHE[key]) do
					if not FILTER_PROPERTY[name] and not spCache[name] and Reflector.IsPropertyReadable(key, name) and Reflector.IsPropertyWritable(key, name) then
						-- Check prop's type
						local ty = Reflector.GetPropertyType(key, name)

						-- Skip complex type now
						-- @todo: complex type support
						if ty and #ty == 1 and ValidateType(ty[1]) then
							tinsert(self[key], name)
						end
					end
				end

				Array.Sort(self[key])

				return rawget(self, key)
			end
		end,
	})
end

------------------------------------------------------
--- IFBorder
------------------------------------------------------
interface "IFBorder"
	THIN_BORDER = {
	    edgeFile = "Interface\\Buttons\\WHITE8x8",
	    edgeSize = 1,
	}

	function _BuildBorder(self)
		if Reflector.ObjectIsClass(self, Frame) then
			self.Backdrop = THIN_BORDER
			self.BackdropBorderColor = DEFAULT_BORDER_COLOR
		else
			local bg = Frame("Back", self)
			bg.FrameStrata = "BACKGROUND"
			bg:SetPoint("TOPLEFT", -1, 1)
			bg:SetPoint("BOTTOMRIGHT", 1, -1)
			bg.Backdrop = THIN_BORDER
			bg.BackdropBorderColor = DEFAULT_BORDER_COLOR
		end
	end

	------------------------------------------------------
	-- Initialize
	------------------------------------------------------
    function IFBorder(self)
    	_BuildBorder(self)
    end
endinterface "IFBorder"

------------------------------------------------------
-- MenuStrip
------------------------------------------------------
__Doc__[[Used to create a menu bar]]
class "MenuStrip"
	inherit "Frame"
	extend "IFBorder"

    local function Menu_OnClick(self)
        self.MenuList.Visible = not self.MenuList.Visible
    end

	------------------------------------------------------
	-- Script
	------------------------------------------------------

	------------------------------------------------------
	-- Method
	------------------------------------------------------
	function AddMenuItem(self, ...)
		local name
		local list
		local menu

		if select("#", ...) == 0 then
			return
		end

		-- Create Menu
		name = select(1, ...)
		if name and type(name) == "string" and name ~= "" then
			local i = 1
			while self:GetChild("Menu"..i) and self:GetChild("Menu"..i).Text ~= name do
				i = i + 1
			end
			if self:GetChild("Menu"..i) then
				list = self:GetChild("Menu"..i).MenuList
			else
				menu = Button("Menu"..i, self)
				menu:SetNormalFontObject(GameFontNormal)
				menu:SetDisabledFontObject(GameFontDisable)
				menu:SetHighlightFontObject(GameFontHighlight)
				menu.Text = name
				menu.Height = NODE_HEIGHT
				menu.Width = menu:GetTextWidth() + 10
				menu:SetPoint("TOP", self, "TOP", 0, -10)
				menu:SetPoint("BOTTOM", self, "BOTTOM", 0, 10)
				if i == 1 then
					menu:SetPoint("LEFT", self, "LEFT", 10, 0)
				else
					menu:SetPoint("LEFT", self:GetChild("Menu"..(i-1)), "RIGHT", 10, 0)
				end
				menu:RegisterForClicks("AnyUp")

				list = DropDownList("MenuList", menu)
				list.ShowOnCursor = false
				list:SetPoint("LEFT", menu, "LEFT")
				list:SetPoint("TOP", self, "BOTTOM")

				menu.OnClick = Menu_OnClick
			end

			if list then
				return list:AddMenuButton(select(2, ...))
			end
		else
			return
		end
	end

	------------------------------------------------------
	-- Property
	------------------------------------------------------

	------------------------------------------------------
	-- Constructor
	------------------------------------------------------
    function MenuStrip(self, name, parent, ...)
		Super(self, name, parent, ...)

		self:SetBackdropColor(0,0,0,1)
    end
endclass "MenuStrip"

------------------------------------------------------
-- WidgetList
------------------------------------------------------
__Doc__[[Used to show the selectable widget classes]]
class "WidgetList"
	inherit "ScrollForm"
	extend "IFBorder" "IFIterator"

	NODE_HEIGHT = NODE_HEIGHT

	------------------------------------------------------
	-- WidgetButton
	------------------------------------------------------
	__Doc__[[Used to represent a widget class]]
	class "WidgetButton"
		inherit "Button"
		extend "IFBorder"

		------------------------------------------------------
		-- Script
		------------------------------------------------------

		------------------------------------------------------
		-- Method
		------------------------------------------------------

		------------------------------------------------------
		-- Property
		------------------------------------------------------
		__Doc__[[The widget class]]
		property "Widget" {
			Handler = function(self, value)
				self.Text = System.Reflector.GetName(value) or ""
			end,
			Type = Class,
		}

		------------------------------------------------------
		-- Script Handler
		------------------------------------------------------
		local function OnMouseDown(self)
			if self.ButtonState == "PUSHED" then
				self.ButtonState = "NORMAL"
				self.BackdropBorderColor = DEFAULT_BORDER_COLOR

				if self.Root.SelectedButton == self then
					self.Root.SelectedButton = nil

					self.Root:Fire("OnWidgetSelected", nil)
				end
			else
				if self.Root.SelectedButton and self.Root.SelectedButton ~= self then
					self.Root.SelectedButton.ButtonState = "NORMAL"
					self.Root.SelectedButton.BackdropBorderColor = DEFAULT_BORDER_COLOR
				end
				self.ButtonState = "PUSHED"
				self.BackdropBorderColor = CLICK_BORDER_COLOR
				self.Root.SelectedButton = self

				self.Root:Fire("OnWidgetSelected", self.Widget)
			end
		end

		------------------------------------------------------
		-- Constructor
		------------------------------------------------------
	    function WidgetButton(self, name, parent, ...)
			Super(self, name, parent, ...)

			self.Parent.__WidgetCount = (self.Parent.__WidgetCount or 0) + 1

			self:SetNormalFontObject(GameFontNormal)
			self:SetDisabledFontObject(GameFontDisable)
			self:SetHighlightFontObject(GameFontHighlight)

	    	self.Height = NODE_HEIGHT
	    	self.Locked = true
			self:SetPoint("LEFT", 10, 0)
			self:SetPoint("RIGHT", -10, 0)
			self:SetPoint("TOP", 0, - (NODE_HEIGHT + 2) * self.Parent.__WidgetCount)

			self.Visible = self.Parent.ToggleState

			self.OnMouseDown = self.OnMouseDown + OnMouseDown
	    end
	endclass "WidgetButton"

	------------------------------------------------------
	-- WidgetCategory
	------------------------------------------------------
	__Doc__[[Used to contain widgets with category]]
	class "WidgetCategory"
		inherit "Frame"
		extend "IFBorder" "IFIterator"

		local function nextWidget(self, key)
			key = key + 1
			local obj = self:GetChild("WidgetButton" .. key)

			if obj then
				return key, obj
			end
		end

		local function Update(self)
			if self.__ToggleState then
				self.Height = (NODE_HEIGHT + 2) * (self.__WidgetCount + 1)

				self:Each("Visible", true)
			else
				self.Height = NODE_HEIGHT + 2

				self:Each("Visible", false)
			end

			return self.Parent:UpdateSize()
		end

		------------------------------------------------------
		-- Script
		------------------------------------------------------

		------------------------------------------------------
		-- Method
		------------------------------------------------------
		function Next(self, key)
			return nextWidget, self, tonumber(key) or 0
		end

		__Doc__[[
			@desc Add widget into this category
			@param widget the widget class
			@return WidgetButton
		]]
		function AddWidget(self, widget)
			if Reflector.IsClass(widget) and (Reflector.IsSuperClass(widget, System.Widget.UIObject) or Reflector.IsSuperClass(widget, System.Widget.VirtualUIObject)) then
				-- Check if already existed
				for _, btn in self:Next() do
					if btn.Widget == widget then
						return btn
					end
				end

				-- keep name part nil, so will be auto named to WidgetButton%d
				local btn = WidgetButton(nil, self)
				btn.Widget = widget

				Update(self)

				return btn
			end
		end

		------------------------------------------------------
		-- Property
		------------------------------------------------------
		__Doc__[[Whether the section is expanded]]
		property "ToggleState" {
			Get = function(self)
				return self.__ToggleState
			end,
			Set = function(self, value)
				if self.__ToggleState ~= value then
					self.__ToggleState = value

					Update(self)
				end
			end,
			Type = Boolean,
		}

		__Doc__[[The category label]]
		property "Category" {
			Get = function(self)
				return self:GetChild("Header").Text
			end,
			Set = function(self, value)
				self:GetChild("Header").Text = value
			end,
			Type = String,
		}

		------------------------------------------------------
		-- Script Handler
		------------------------------------------------------
		local function OnClick(self)
			self.Parent.ToggleState = not self.Parent.ToggleState
		end

		------------------------------------------------------
		-- Constructor
		------------------------------------------------------
	    function WidgetCategory(self, name, parent, ...)
			Super(self, name, parent, ...)

	    	self.Parent.__WidgetCount = (self.Parent.__WidgetCount or 0) + 1

	    	if self.Parent.__WidgetCount == 1 then
	    		self:SetPoint("TOPLEFT")
	    		self:SetPoint("RIGHT")
	    	else
	    		self:SetPoint("TOPLEFT", self.Parent:GetChild("WidgetCategory" .. (self.Parent.__WidgetCount-1)), "BOTTOMLEFT", 0, -2)
	    		self:SetPoint("RIGHT")
	    	end

	    	self.Height = NODE_HEIGHT + 2

	    	local header = Button("Header", self)
	    	header:SetPoint("TOPLEFT")
	    	header:SetPoint("TOPRIGHT")
	    	header.Height = NODE_HEIGHT
			header:SetNormalFontObject(GameFontNormal)
			header:SetDisabledFontObject(GameFontDisable)
			header:SetHighlightFontObject(GameFontHighlight)

			header.OnClick = OnClick
	    end
	endclass "WidgetCategory"

	local function nextWidget(self, key)
		key = key + 1
		local obj = self.ScrollChild:GetChild("WidgetCategory" .. key)

		if obj then
			return key, obj
		end
	end

	function Next(self, key)
		return nextWidget, self, tonumber(key) or 0
	end

	------------------------------------------------------
	-- Script
	------------------------------------------------------
	__Doc__[[
		@desc Fired when a widget class is selected or canceled
		@param widget the widget class that selected, otherwise nil
	]]
	event "OnWidgetSelected"

	------------------------------------------------------
	-- Method
	------------------------------------------------------
	__Doc__[[
		@desc Add widget to a category
		@param category string
		@param widget widget class
		@return WidgetButton
	]]
	function AddWidget(self, category, widget)
		if type(category) == "string" and Reflector.IsClass(widget) and (Reflector.IsSuperClass(widget, System.Widget.UIObject) or Reflector.IsSuperClass(widget, System.Widget.VirtualUIObject)) then
			local cg = nil

			-- Check if already existed
			for _, btnCate in self:Next() do
				if btnCate.Category ==  category then
					cg = btnCate
					break
				end
			end

			if not cg then
				cg = WidgetCategory(nil, self.ScrollChild)
				cg.Category = category
			end

			local btn = cg:AddWidget(widget)
			btn.Root = self

			return btn
		end
	end

	------------------------------------------------------
	-- Property
	------------------------------------------------------
	__Doc__[[The selected widget button]]
	property "SelectedButton" { Type = WidgetButton }

	------------------------------------------------------
	-- Constructor
	------------------------------------------------------
endclass "WidgetList"

------------------------------------------------------
-- ElementList
------------------------------------------------------
__Doc__[[Used to show the elements on the frame]]
class "ElementList"
	inherit "TreeView"
	extend "IFBorder"

	------------------------------------------------------
	-- Event
	------------------------------------------------------

	------------------------------------------------------
	-- Method
	------------------------------------------------------

	------------------------------------------------------
	-- Property
	------------------------------------------------------

	------------------------------------------------------
	-- Constructor
	------------------------------------------------------
    function ElementList(self, name, parent, ...)
		Super(self, name, parent, ...)

		self:SetBackdrop(nil)

		self.Style = "RIGHT"
    end
endclass "ElementList"

------------------------------------------------------
-- PropertyList
------------------------------------------------------
__Doc__[[Used to show an object's property settings]]
class "PropertyList"
	inherit "ScrollForm"
	extend "IFBorder" "IFIterator"

	NODE_HEIGHT = NODE_HEIGHT

	------------------------------------------------------
	-- PropertySet
	------------------------------------------------------
	__Doc__[[Used to show a property's name-value pairs of an object]]
	class "PropertySet"
		inherit "Frame"
		extend "IFBorder"

		local function SetValue(self, prop, value)
			self[prop] = value
		end

		local function RefreshView(self)
			if self.__Object and self.__Property then
				local ty = Reflector.GetPropertyType(Reflector.GetObjectClass(self.__Object), self.__Property)[1]
				local value = self.__Object[self.__Property]

				if ty == Number then
					self.Accessor.Text = string.format("%.1f", value or 0)
				elseif ty == String or ty == LocaleString then
					self.Accessor.Text = tostring(value or "")
				elseif ty == Boolean then
					self.Accessor.Value = value and true or false
				elseif Reflector.IsEnum(ty) then
					self.Accessor.Text = Reflector.ParseEnum(ty, value)
				end
			end
		end

		local function UpdateValue(self)
			if self.__Object and self.__Property then
				local ty = Reflector.GetPropertyType(Reflector.GetObjectClass(self.__Object), self.__Property)[1]
				local oldValue = self.__Object[self.__Property]
				local value

				if ty == Number then
					value = tonumber(self.Accessor.Text)

					if not value then
						self.Accessor.Text = string.format("%.1f", oldValue or 0)
						return
					end
				elseif ty == String or ty == LocaleString then
					value = tostring(self.Accessor.Text) or ""
				elseif ty == Boolean then
					value = self.Accessor.Value
				elseif Reflector.IsEnum(ty) then
					value = self.Accessor.Text
					oldValue = Reflector.ParseEnum(ty, oldValue)
				end

				if oldValue == value then return end

				pcall(SetValue, self.__Object, self.__Property, value)

				RefreshView(self)
			end
		end

		local function Advance_Click(self)
			PropertyAdvance(self.__Object, self.__Property)

			return true
		end

		------------------------------------------------------
		-- Script
		------------------------------------------------------

		------------------------------------------------------
		-- Method
		------------------------------------------------------
		__Doc__[[
			@desc Set the property for an object
			@param object object
			@param property string, the property name
			@return nil
		]]
		function SetProperty(self, object, prop)
			self.Accessor.DropdownBtn.OnClick = self.Accessor.DropdownBtn.OnClick - Advance_Click

			if object and prop then
				self.__Object = object
				self.__Property = prop

				local ty = Reflector.GetPropertyType(Reflector.GetObjectClass(object), prop)[1]

				self.Header.Text = prop

				if ty == Number or ty == String or ty == LocaleString then
					self.Accessor.DropdownBtn.Visible = false
					self.Accessor.Editable = true
					self.Accessor:Clear()
				elseif ty == Boolean then
					self.Accessor.DropdownBtn.Visible = true
					self.Accessor.Editable = false
					self.Accessor:Clear()
					self.Accessor:AddItem(false, "false")
					self.Accessor:AddItem(true, "true")
				elseif Reflector.IsEnum(ty) then
					self.Accessor.DropdownBtn.Visible = true
					self.Accessor.Editable = false
					self.Accessor:SetList(Reflector.GetEnums(ty))
				elseif Reflector.IsStruct(ty) then
					self.Accessor.DropdownBtn.Visible = true
					self.Accessor.Editable = false
					self.Accessor:Clear()

					self.Accessor.Text = "(Advance)"
					self.Accessor.DropdownBtn.OnClick = self.Accessor.DropdownBtn.OnClick + Advance_Click
				end

				RefreshView(self)
			else
				self.__Object = nil
				self.__Property = nil
				self.Header.Text = ""
				self.Accessor:Clear()
				self.Accessor.Editable = false

				self.Visible = false
			end
		end

		__Doc__[[Try show the property set, if point to an object's property]]
		function TryShow(self)
			if self.__Object and self.__Property then
				self.Visible = true
			end
		end

		------------------------------------------------------
		-- Property
		------------------------------------------------------

		------------------------------------------------------
		-- Script Handler
		------------------------------------------------------
		local function OnValueChanged(self, value)
			UpdateValue(self.Parent)
		end

		local function OnEnterPressed(self)
			self = self.Parent

			if self.ID < self.Parent.__WidgetCount then
				if self.Parent:GetChild("PropertySet"..(self.ID+1)).Visible then
					self.Parent:GetChild("PropertySet"..(self.ID+1)).Accessor:SetFocus()
				end
			end
		end

		local function OnEditFocusGained(self)
			RefreshView(self.Parent)
		end

		local function OnEditFocusLost(self)
			UpdateValue(self.Parent)
		end

		local function OnTabPressed(self)
			return OnEnterPressed(self)
		end

		------------------------------------------------------
		-- Constructor
		------------------------------------------------------
	    function PropertySet(self, name, parent, ...)
			Super(self, name, parent, ...)

	    	self.Parent.__WidgetCount = (self.Parent.__WidgetCount or 0) + 1
	    	self.ID = self.Parent.__WidgetCount

	    	self:SetBackdropColor(0, 0, 0, 1)
	    	self:SetPoint("LEFT", 10, 0)
	    	self:SetPoint("RIGHT")
	    	self.Height = NODE_HEIGHT
			self:SetPoint("TOP", 0, - NODE_HEIGHT * self.Parent.__WidgetCount)

			local title = FontString("Header", self)
			title:SetPoint("TOPLEFT")
			title:SetPoint("BOTTOMLEFT")
			title:SetPoint("RIGHT", self, "CENTER", -10, 0)

			local accessor = ComboBox("Accessor", self)
			IFBorder._BuildBorder(accessor)
			accessor:SetPoint("TOPRIGHT")
			accessor:SetPoint("BOTTOMRIGHT")
			accessor:SetPoint("LEFT", title, "RIGHT")
			accessor.Editable = true
			accessor.AutoFocus = false

			-- Script handlers
			accessor.OnValueChanged = OnValueChanged
			accessor.OnEnterPressed = OnEnterPressed
			accessor.OnTabPressed = OnTabPressed
			accessor.OnEditFocusGained = OnEditFocusGained
			accessor.OnEditFocusLost = OnEditFocusLost
	    end
	endclass "PropertySet"

	------------------------------------------------------
	-- PropertyCategory
	------------------------------------------------------
	__Doc__[[Used to show a category contains property settings]]
	class "PropertyCategory"
		inherit "Frame"
		extend "IFIterator"

		local function nextWidget(self, key)
			key = key + 1
			local obj = self:GetChild("PropertySet" .. key)

			if obj then
				return key, obj
			end
		end

		------------------------------------------------------
		-- Script
		------------------------------------------------------

		------------------------------------------------------
		-- Method
		------------------------------------------------------
		function Next(self, key)
			return nextWidget, self, tonumber(key) or 0
		end

		__Doc__[[
			@desc Set the object to be show with inherited classes
			@param widget
			@param object
			@return nil
		]]
		function SetObject(self, widget, object)
			if widget and object then
				self.Visible = true

				self:GetChild("Text").Text = Reflector.GetName(widget)

				local cache = WIDGET_PROPERTY[widget]
				local index = 0

				for _, name in ipairs(cache) do
					index = index + 1

					PropertySet("PropertySet" .. index, self):SetProperty(object, name)
				end

				self:EachK(index, "SetProperty", nil)

				self.ToggleState = true
			else
				self.ToggleState = false

				self:Each("SetProperty", nil)

				self.Visible = false

				self:GetChild("Text").Text = ""
			end
		end

		------------------------------------------------------
		-- Property
		------------------------------------------------------
		__Doc__[[The toggle state of the property category]]
		property "ToggleState" {
			Get = function(self)
				return self.__ToggleState
			end,
			Set = function(self, value)
				self.__ToggleState = value

				if value then
					self.Toggle:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-UP")
					self.Toggle:SetPushedTexture("Interface\\Buttons\\UI-MinusButton-DOWN")

					self:Each("TryShow")

					local index = self.__WidgetCount or 0

					while index > 0 and not self:GetChild("PropertySet"..index).Visible do
						index = index - 1
					end

					self.Height = (index + 1) * NODE_HEIGHT

					self.Parent:UpdateSize()
				else
					self.Toggle:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-UP")
					self.Toggle:SetPushedTexture("Interface\\Buttons\\UI-PlusButton-DOWN")

					self:Each("Visible", false)

					self.Height = NODE_HEIGHT

					self.Parent:UpdateSize()
				end
			end,
			Type = Boolean,
		}

		------------------------------------------------------
		-- Event Handler
		------------------------------------------------------
		local function Toggle_OnClick(self)
			self.Parent.ToggleState = not self.Parent.ToggleState
		end

		------------------------------------------------------
		-- Constructor
		------------------------------------------------------
	    function PropertyCategory(self, name, parent, ...)
			Super(self, name, parent, ...)

	    	self.Parent.__WidgetCount = (self.Parent.__WidgetCount or 0) + 1

	    	self.Height = NODE_HEIGHT

	    	if self.Parent.__WidgetCount == 1 then
	    		self:SetPoint("TOPLEFT", 0, -6)
	    		self:SetPoint("RIGHT")
	    	else
	    		self:SetPoint("TOPLEFT", self.Parent:GetChild("PropertyCategory"..(self.Parent.__WidgetCount-1)), "BOTTOMLEFT")
	    		self:SetPoint("RIGHT")
	    	end

	    	local toggle = Button("Toggle", self)
	    	toggle:SetSize(14, 14)
	    	toggle:SetPoint("TOPLEFT", 4, -1)

			toggle:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
			toggle:GetHighlightTexture():SetBlendMode("ADD")

			toggle.OnClick = Toggle_OnClick

            local text = FontString("Text", self)
            text:SetPoint("TOPRIGHT")
            text:SetPoint("TOPLEFT", 14, 0)
            text.Height = NODE_HEIGHT
            text.JustifyH = "Left"

            self.ToggleState = false
	    end
	endclass "PropertyCategory"

	local function nextWidget(self, key)
		key = key + 1
		local obj = self.ScrollChild:GetChild("PropertyCategory" .. key)

		if obj then
			return key, obj
		end
	end

	local function SetWidgetObject(self, widget, object)
		if widget ~= UIObject and widget ~= VirtualUIObject then
			SetWidgetObject(self, Reflector.GetSuperClass(widget), object)
		end

		self.__OperIndex = self.__OperIndex + 1

		PropertyCategory("PropertyCategory" .. self.__OperIndex, self.ScrollChild):SetObject(widget, object)
	end

	------------------------------------------------------
	-- Script
	------------------------------------------------------

	------------------------------------------------------
	-- Method
	------------------------------------------------------
	function Next(self, key)
		return nextWidget, self, tonumber(key) or 0
	end

	function SetObject(self, obj)
		local cls = Reflector.GetObjectClass(obj)

		if cls then
			self.__OperIndex = 0
			SetWidgetObject(self, cls, obj)
			self:EachK(self.__OperIndex, "SetObject", nil)

			self.ScrollChild:UpdateSize()
		else
			self:Each("SetObject", nil)

			self.ScrollChild.Height = 10
		end
	end

	------------------------------------------------------
	-- Property
	------------------------------------------------------

	------------------------------------------------------
	-- Constructor
	------------------------------------------------------
    function PropertyList(self, name, parent, ...)
		Super(self, name, parent, ...)

		self:SetBackdrop(nil)
    end
endclass "PropertyList"

------------------------------------------------------
-- Designer
------------------------------------------------------
__Doc__[[Used to edit the frame]]
class "Designer"
	inherit "Frame"

	------------------------------------------------------
	-- Event
	------------------------------------------------------

	------------------------------------------------------
	-- Method
	------------------------------------------------------

	------------------------------------------------------
	-- Property
	------------------------------------------------------

	------------------------------------------------------
	-- Constructor
	------------------------------------------------------
    function Designer(self, name, parent, ...)
		Super(self, name, parent, ...)

    end
endclass "Designer"

------------------------------------------------------
-- StructEditor
------------------------------------------------------
__Doc__[[Used to edit or generate struct table]]
class "StructEditor"
	inherit "Form"

	------------------------------------------------------
	-- MemberEditor
	------------------------------------------------------
	__Doc__[[Used to create a struct table of member type]]
	class "MemberEditor"
		inherit "DataGrid"

		------------------------------------------------------
		-- Event
		------------------------------------------------------

		------------------------------------------------------
		-- Method
		------------------------------------------------------
		__Doc__[[
			@desc Show the editor and return a struct value
			@param struct type
			@param value init value
			@return result
		]]
		function GetStructValue(self, srt, value)
			local ty
			local parts = Reflector.GetStructParts(srt)

			if parts and #parts > 0 then
				self.InitValue = value
				self.Struct = srt

				self.RowCount = #parts

				for i, part in ipairs(parts) do
					-- Refresh the name
					self.Cells(i, 1).Text = part

					-- Refresh the value
					ty = Reflector.GetStructPart(srt, part)[1]

					if ty == Number then
						self.Cells(i, 2).CellType = "Number"

						self.Cells(i, 2).Value = value and value[part] or 0
					elseif ty == String or ty == LocaleString then
						self.Cells(i, 2).CellType = "String"

						self.Cells(i, 2).Value = value and value[part] or ""
					elseif ty == Boolean then
						self.Cells(i, 2).CellType = "Boolean"

						self.Cells(i, 2).Value = value and value[part]
					elseif Reflector.IsEnum(ty) then
						self.Cells(i, 2).CellType = "ComboBox"

						local enums = Reflector.GetEnums(ty)
						self.Cells(i, 2).Keys = enums
						self.Cells(i, 2).Items = enums

						self.Cells(i, 2).Value = Reflector.ParseEnum(ty, value and value[part])
					elseif Reflector.IsStruct(ty) then
						self.Cells(i, 2).CellType = "Advance"
						self.Cells(i, 2).SubType = ty

						self.Cells(i, 2).StructValue = value and value[part]
					end
				end

				return self.Thread:Yield()
			else
				self.Parent.RcyStructMemberEditor(self)

				return value
			end
		end

		__Doc__[[
			@desc Resume the thread with or without new value
			@param cancel boolean
			@return nil
		]]
		function Resume(self, cancel)
			if cancel then
				return self.Thread(self.InitValue)
			else
				return self.Thread(self:GetValue())
			end
		end

		__Doc__[[
			@desc Get the value of the editor
			@return value
		]]
		function GetValue(self)
			local ty
			local parts = Reflector.GetStructParts(self.Struct)

			if parts and #parts > 0 then
				local params = {}

				for i, part in ipairs(parts) do
					-- Refresh the value
					ty = Reflector.GetStructPart(srt, part)[1]

					if ty == Number or ty == String or ty == LocaleString or ty == Boolean or Reflector.IsEnum(ty) then
						params[part] = self.Cells(i, 2).Value
					elseif Reflector.IsStruct(ty) then
						params[part] = self.Cells(i, 2).StructValue
					end
				end

				return params
			else
				return nil
			end
		end

		------------------------------------------------------
		-- Property
		------------------------------------------------------

		------------------------------------------------------
		-- Event Handler
		------------------------------------------------------
		local function OnAdvance(self, row, col)
			if self.Cells(row, col).SubType then
				self.Cells(row, col).StructValue =  self.Parent:GetStructValue(self.Cells(row, col).SubType, self.Cells(row, col).StructValue)
			end
		end

		------------------------------------------------------
		-- Constructor
		------------------------------------------------------
	    function MemberEditor(self, name, parent, ...)
			Super(self, name, parent, ...)

			self:SetPoint("TOPLEFT", 4, -26)
			self:SetPoint("BOTTOMRIGHT", -4, 30)
			self.ColumnCount = 2
			self.Columns(1).CellType = "Label"
			self.Columns(1).Text = L"Field"
			self.Columns(2).Text = L"Value"
			self.Columns(1).ColumnWidth = 40

			self.OnAdvance = OnAdvance

			self:ActiveThread("OnAdvance")
			self.Thread = System.Threading.Thread()
	    end
	endclass "MemberEditor"

	------------------------------------------------------
	-- ArrayEditor
	------------------------------------------------------
	__Doc__[[Used to create a struct table of array type]]
	class "ArrayEditor"
		inherit "Form"

		------------------------------------------------------
		-- Event
		------------------------------------------------------

		------------------------------------------------------
		-- Method
		------------------------------------------------------

		------------------------------------------------------
		-- Property
		------------------------------------------------------

		------------------------------------------------------
		-- Constructor
		------------------------------------------------------
	    function ArrayEditor(self, name, parent, ...)
			Super(self, name, parent, ...)

	    	local lst = List("List", self)
			lst:SetPoint("TOPLEFT", 4, -26)
			lst:SetPoint("BOTTOMRIGHT", -4, 30)
	    end
	endclass "ArrayEditor"

	------------------------------------------------------
	-- Event
	------------------------------------------------------

	------------------------------------------------------
	-- Method
	------------------------------------------------------
	__Doc__[[
		@desc Get a struct value
		@format srt[, value]
		@param srt struct type
		@param value init value
		@return value
	]]
	function GetStructValue(self, srt, value)
		if Reflector.IsStruct(srt) then
			if Reflector.GetStructType(srt) == "MEMBER" then
				local editor = self.RcyStructMemberEditor()

				value = editor:GetStructValue(srt, value)
			elseif Reflector.GetStructType(ty) == "ARRAY" then
				local editor = self.RcyStructArrayEditor()

				value = editor:GetStructValue(srt, value)
			end
		end

		return value
	end

	------------------------------------------------------
	-- Property
	------------------------------------------------------

	------------------------------------------------------
	-- Event Handler
	------------------------------------------------------
	local function btnCancel_OnClick(self)
		return self.CurrentEditor:Resume(true)
	end

	local function btnOkay_OnClick(self)
		return self.CurrentEditor:Resume()
	end

	local function OnHide(self)
		-- Clear if existed
		for i = #(self.EditorList), 1, -1 do
			local editor = self.EditorList[i]

			if Reflector.ObjectIsClass(editor, MemberEditor) then
				self.RcyStructMemberEditor(editor)
			elseif Reflector.ObjectIsClass(editor, ArrayEditor) then
				self.RcyStructArrayEditor(editor)
			end
		end
	end

	local function OnPop(self, obj)
		local index = #(self.MainEditor.EditorList)

		if index > 0 then
			self.MainEditor.EditorList[index].Visible = false
		else
			self.MainEditor.Visible = true
		end

		tinsert(self.MainEditor.EditorList, obj)

		obj.Visible = true

		self.MainEditor.CurrentEditor = obj
	end

	local function OnPush(self, obj)
		tremove(self.MainEditor.EditorList)

		obj.Visible = false

		local index = #(self.MainEditor.EditorList)

		if index > 0 then
			self.MainEditor.EditorList[index].Visible = true

			self.MainEditor.CurrentEditor = self.MainEditor.EditorList[index]
		else
			self.MainEditor.Visible = false

			self.MainEditor.CurrentEditor = nil
		end
	end

	------------------------------------------------------
	-- Constructor
	------------------------------------------------------
    function StructEditor(self, name, parent, ...)
		Super(self, name, parent, ...)

    	self.Visible = false
    	self.OnHide = self.OnHide + OnHide

		local btnCancel = NormalButton("btnCancel", self)
		btnCancel.Style = "Classic"
		btnCancel.AutoSize = true
		btnCancel.Text = L"Cancel"
		btnCancel:SetPoint("BOTTOMRIGHT", -4, 4)

		btnCancel.OnClick = btnCancel_OnClick

		local btnOkay = NormalButton("btnOkay", self)
		btnOkay.Style = "Classic"
		btnOkay.AutoSize = true
		btnOkay.Text = L"Okay"
		btnOkay:SetPoint("RIGHT", btnCancel, "LEFT", -4, 0)

		btnOkay.OnClick = btnOkay_OnClick

		self.Thread = System.Threading.Thread()
		self.EditorList = {}
		self.CurrentEditor = nil

		self.RcyStructMemberEditor = Recycle(MemberEditor, "MemberEditor_%d", self)
		self.RcyStructArrayEditor = Recycle(ArrayEditor, "ArrayEditor_%d", self)

		self.RcyStructMemberEditor.MainEditor = self
		self.RcyStructArrayEditor.MainEditor = self

		self.RcyStructMemberEditor.OnPop = OnPop
		self.RcyStructArrayEditor.OnPop = OnPop

		self.RcyStructMemberEditor.OnPush = OnPush
		self.RcyStructArrayEditor.OnPush = OnPush
    end
endclass "StructEditor"