-- Addon Initialize
IGAS:NewAddon "Cube.Mdl_EventPicker"

-- Event Picker
picker = Form("Cube_EventPicker")
picker.Height = 480
picker.Width = 560
picker.Caption = "Cube - "..L["Event Picker"]
picker.Visible = false
picker.Message = L["Data from http://wowprogramming.com/docs/events"]

-- Category
lstC = {}

for k in pairs(Event_Data) do
	k = k:match("^%w+")

	if not lstC[k] then
		lstC[k] = k
	end
end

lstCategory = List("lstCategory", picker)
lstCategory:SetPoint("TOPLEFT", 4, -26)
lstCategory:SetSize(100, 280)
lstCategory:SetList(lstC)

wipe(lstC)

-- List
lstEvent = List("lstEvent", picker)
lstEvent:SetPoint("TOPLEFT", lstCategory, "TOPRIGHT")
lstEvent:SetPoint("BOTTOMLEFT", lstCategory, "BOTTOMRIGHT")
lstEvent.Width = 200

-- Cancel
btnCancel = NormalButton("btnCancel", picker)
btnCancel.Style = "Classic"
btnCancel:SetSize(100, 26)
btnCancel.Text = L["Cancel"]
btnCancel:SetPoint("BOTTOMRIGHT", -4, 26)

-- Okay
btnOkay = NormalButton("btnOkay", picker)
btnOkay.Style = "Classic"
btnOkay:SetSize(100, 26)
btnOkay.Text = L["Okay"]
btnOkay:SetPoint("TOPRIGHT", btnCancel, "TOPLEFT")

-- Arrow Label
lblArrow = FontString("lblArrow", picker)
lblArrow:SetPoint("CENTER", lstEvent, "RIGHT")
lblArrow.Text = "==>"

-- Detail Label
lblDetail = FontString("lblDetail", picker)
lblDetail:SetPoint("TOPLEFT", lstCategory, "BOTTOMLEFT", 0, -4)
lblDetail:SetPoint("RIGHT", btnOkay, "LEFT")
lblDetail:SetPoint("BOTTOM", 0, 26)

-- Selected
lstSelected = List("lstSelected", picker)
lstSelected:SetPoint("TOPRIGHT", -4, -26)
lstSelected:SetPoint("LEFT", lblArrow, "RIGHT")
lstSelected:SetPoint("BOTTOM", lblDetail, "TOP", 4)
