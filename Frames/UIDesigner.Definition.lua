-- UI Designer definition file
IGAS:NewAddon "Cube.Mdl_UI_Designer"

import "System.Widget"
import "System.Widget.Action"
import "System.Widget.Unit"

-- Default border color
DEFAULT_BORDER_COLOR = ColorType(1, 1, 1)
CLICK_BORDER_COLOR = ColorType(1, 0, 0)

NODE_HEIGHT = 24

------------------------------------------------------
--- IFBorder
------------------------------------------------------
interface "IFBorder"
	THIN_BORDER = {
	    edgeFile = "Interface\\Buttons\\WHITE8x8",
	    edgeSize = 1,
	}

	------------------------------------------------------
	-- Initialize
	------------------------------------------------------
    function IFBorder(self)
		local bg = Frame("Back", self)
		bg.FrameStrata = "BACKGROUND"
		bg:SetPoint("TOPLEFT", -1, 1)
		bg:SetPoint("BOTTOMRIGHT", 1, -1)
		bg.Backdrop = THIN_BORDER
		bg.BackdropBorderColor = DEFAULT_BORDER_COLOR
    end
endinterface "IFBorder"

------------------------------------------------------
-- MenuStrip
------------------------------------------------------
class "MenuStrip"
	inherit "Frame"
	extend "IFBorder"

	doc [======[
		@name MenuStrip
		@type class
		@desc Used to create a menu bar
	]======]

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
				list:SetPoint("TOPLEFT", menu, "BOTTOMLEFT")

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
    function MenuStrip(self)
		self:SetBackdropColor(0,0,0,1)
		self:SetPoint("TOPLEFT")
		self:SetPoint("TOPRIGHT")
		self.Height = 30
    end
endclass "MenuStrip"

------------------------------------------------------
-- WidgetList
------------------------------------------------------
class "WidgetList"
	inherit "ScrollForm"
	extend "IFBorder" "IFIterator"

	NODE_HEIGHT = NODE_HEIGHT

	doc [======[
		@name WidgetList
		@type class
		@desc Used to show the selectable widget classes
	]======]

	------------------------------------------------------
	-- WidgetButton
	------------------------------------------------------
	class "WidgetButton"
		inherit "Button"
		extend "IFBorder"

		doc [======[
			@name WidgetButton
			@type class
			@desc Used to mark a widget class
		]======]

		------------------------------------------------------
		-- Script
		------------------------------------------------------

		------------------------------------------------------
		-- Method
		------------------------------------------------------

		------------------------------------------------------
		-- Property
		------------------------------------------------------
		doc [======[
			@name Widget
			@type property
			@desc The widget class
		]======]
		property "Widget" {
			Get = function(self)
				return self.__Widget
			end,
			Set = function(self, value)
				self.__Widget = value

				self.Text = System.Reflector.GetName(value) or ""
			end,
			Type = - System.Widget.UIObject - System.Widget.VirtualUIObject,
		}

		------------------------------------------------------
		-- Script Handler
		------------------------------------------------------
		local function OnMouseDown(self)
			if self.ButtonState == "PUSHED" then
				self.ButtonState = "NORMAL"
				self.Back.BackdropBorderColor = DEFAULT_BORDER_COLOR

				if self.Root.SelectedButton == self then
					self.Root.SelectedButton = nil

					self.Root:Fire("OnWidgetSelected", nil)
				end
			else
				if self.Root.SelectedButton and self.Root.SelectedButton ~= self then
					self.Root.SelectedButton.ButtonState = "NORMAL"
				end
				self.ButtonState = "PUSHED"
				self.Back.BackdropBorderColor = CLICK_BORDER_COLOR
				self.Root.SelectedButton = self

				self.Root:Fire("OnWidgetSelected", self.Widget)
			end
		end

		------------------------------------------------------
		-- Constructor
		------------------------------------------------------
	    function WidgetButton(self)
			self.Parent.__WidgetCount = (self.Parent.__WidgetCount or 0) + 1

			self:SetNormalFontObject(GameFontNormal)
			self:SetDisabledFontObject(GameFontDisable)
			self:SetHighlightFontObject(GameFontHighlight)

	    	self.Height = NODE_HEIGHT
	    	self.Locked = true
			self:SetPoint("LEFT", 10, 0)
			self:SetPoint("RIGHT", -10, 0)
			self:SetPoint("TOP", - (NODE_HEIGHT + 2) * self.Parent.__WidgetCount)

			self.Visible = self.Parent.ToggleState

			self.OnMouseDown = self.OnMouseDown + OnMouseDown
	    end
	endclass "WidgetButton"

	------------------------------------------------------
	-- WidgetCategory
	------------------------------------------------------
	class "WidgetCategory"
		inherit "Frame"
		extend "IFBorder" "IFIterator"

		doc [======[
			@name WidgetCategory
			@type class
			@desc Used to contain widgets with category
		]======]

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

		doc [======[
			@name AddWidget
			@type method
			@desc Add widget into this category
			@param widget the widget class
			@return WidgetButton
		]======]
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
		doc [======[
			@name ToggleState
			@type property
			@desc Whether the section is expanded
		]======]
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

		doc [======[
			@name Category
			@type property
			@desc The category label
		]======]
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
	    function WidgetCategory(self)
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
	doc [======[
		@name OnWidgetSelected
		@type script
		@desc Fired when a widget class is selected or canceled
		@param widget the widget class that selected, otherwise nil
	]======]
	script "OnWidgetSelected"

	------------------------------------------------------
	-- Method
	------------------------------------------------------
	doc [======[
		@name AddWidget
		@type method
		@desc Add widget to a category
		@param category string
		@param widget widget class
		@return WidgetButton
	]======]
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
	doc [======[
		@name SelectedButton
		@type property
		@desc The selected widget button
	]======]
	property "SelectedButton" {
		Get = function(self)
			return self.__SelectedButton
		end,
		Set = function(self, value)
			self.__SelectedButton = value
		end,
		Type = WidgetButton + nil,
	}

	------------------------------------------------------
	-- Constructor
	------------------------------------------------------
    function WidgetList(self)
    	self:SetBackdrop(nil)
    end
endclass "WidgetList"

------------------------------------------------------
-- PropertyList
------------------------------------------------------
class "PropertyList"
	inherit "ScrollForm"
	extend "IFBorder" "IFIterator"

	NODE_HEIGHT = NODE_HEIGHT

	doc [======[
		@name PropertyList
		@type class
		@desc Used to show an object's property settings
	]======]

	local function ValidateType(ty)
		if ty == Number or ty == String or ty == Boolean or Reflector.IsEnum(ty) then
			return true
		end

		local sty

		if Reflector.IsStruct(ty) and Reflector.GetStructType(ty) == "MEMBER" then
			for _, part in ipairs(Reflector.GetStructParts(ty)) do
				sty = Reflector.GetStructPart(ty, part)

				if not sty or #sty ~= 1 or not ValidateType(sty[1]) then
					return false
				end
			end

			return true
		end

		return false
	end

	_WidgetPropCache = setmetatable({}, {
		__index = function(self, key)
			if Reflector.IsClass(key) and (Reflector.IsSuperClass(key, System.Widget.UIObject) or Reflector.IsSuperClass(key, System.Widget.VirtualUIObject)) then
				self[key] = {}

				-- Fill data
				local props = Reflector.GetProperties(key, true)

				for _, name in ipairs(props) do
					if Reflector.IsPropertyReadable(key, name) and Reflector.IsPropertyWritable(key, name) then
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

	------------------------------------------------------
	-- PropertySet
	------------------------------------------------------
	class "PropertySet"
		inherit "Frame"

		doc [======[
			@name PropertySet
			@type class
			@desc Used to show a property's name-value pairs of an object
		]======]

		------------------------------------------------------
		-- PropertyAccessor
		------------------------------------------------------
		class "PropertyAccessor"
			inherit "ComboBox"
			extend "IFBorder"

			doc [======[
				@name PropertyAccessor
				@type class
				@desc Used to access the property's value
			]======]

			------------------------------------------------------
			-- Constructor
			------------------------------------------------------
		    function PropertyAccessor(self)
				self:SetBackdrop(nil)
		    end
		endclass "PropertyAccessor"

		------------------------------------------------------
		-- Script
		------------------------------------------------------

		------------------------------------------------------
		-- Method
		------------------------------------------------------

		------------------------------------------------------
		-- Property
		------------------------------------------------------

		------------------------------------------------------
		-- Script Handler
		------------------------------------------------------

		------------------------------------------------------
		-- Constructor
		------------------------------------------------------
	    function PropertySet(self)
	    	self.Parent.__WidgetCount = (self.Parent.__WidgetCount or 0) + 1

	    	self:SetPoint("LEFT", 10, 0)
	    	self:SetPoint("RIGHT")
	    	self.Height = NODE_HEIGHT
			self:SetPoint("TOP", - NODE_HEIGHT * self.Parent.__WidgetCount)

			local title = FontString("Header", self)
			title:SetPoint("TOPLEFT")
			title:SetPoint("BOTTOMLEFT")
			title:SetPoint("RIGHT", self, "CENTER", -10, 0)

			local accessor = PropertyAccessor("Accessor", self)
			accessor:SetPoint("TOPRIGHT")
			accessor:SetPoint("BOTTOMRIGHT")
			accessor:SetPoint("LEFT", title, "RIGHT")
			accessor:SetBackdrop(nil)
			accessor.Editable = true
			accessor.AutoFocus = false
	    end
	endclass "PropertySet"

	------------------------------------------------------
	-- PropertyCategory
	------------------------------------------------------
	class "PropertyCategory"
		inherit "Frame"
		extend "IFIterator"

		doc [======[
			@name PropertyCategory
			@type class
			@desc Used to show a category contains property settings
		]======]

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

		------------------------------------------------------
		-- Property
		------------------------------------------------------
		doc [======[
			@name Category
			@type property
			@desc description
		]======]
		property "Category" {
			Get = function(self)
				return self:GetChild("Text").Text
			end,
			Set = function(self, value)
				self:GetChild("Text").Text = value
			end,
			Type = String,
		}

		------------------------------------------------------
		-- Constructor
		------------------------------------------------------
	    function PropertyCategory(self)
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

			toggleBtn:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-UP")
			toggleBtn:SetPushedTexture("Interface\\Buttons\\UI-MinusButton-DOWN")
			toggleBtn:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
			toggleBtn:GetHighlightTexture():SetBlendMode("ADD")

            local text = FontString("Text", self)
            text:SetPoint("TOPRIGHT")
            text:SetPoint("BOTTOMLEFT", 14, 0)
            text.JustifyH = "Left"
	    end
	endclass "PropertyCategory"

	local function nextWidget(self, key)
		key = key + 1
		local obj = self.ScrollChild:GetChild("PropertyCategory" .. key)

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

	------------------------------------------------------
	-- Property
	------------------------------------------------------

	------------------------------------------------------
	-- Constructor
	------------------------------------------------------
    function PropertyList(self)
    	self:SetBackdrop(nil)
    end
endclass "PropertyList"