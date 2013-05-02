-- Addon Initialize
IGAS:NewAddon "Cube.Mdl_EventPicker"

-- Event Picker
picker = Form("Cube_EventPicker")
picker.Height = 420
picker.Width = 720
picker.Resizable = false
picker.Caption = "Cube - "..L["Event Picker"]
picker.Visible = false
picker.Message = L["Double click item to choose."]

-- Category
lstC = {}
tmp = {}

for k in pairs(Event_Data) do
	k = k:match("^%w+")

	if not tmp[k] then
		tmp[k] = true
		tinsert(lstC, k)
	end
end

tmp = nil

System.Array.Sort(lstC)

lstCategory = List("lstCategory", picker)
lstCategory:SetPoint("TOPLEFT", 4, -26)
lstCategory:SetSize(150, 280)
lstCategory.Keys = lstC
lstCategory.Items = lstC
lstCategory:Refresh()

-- List
lstEvent = List("lstEvent", picker)
lstEvent:SetPoint("TOPLEFT", lstCategory, "TOPRIGHT")
lstEvent:SetPoint("BOTTOMLEFT", lstCategory, "BOTTOMRIGHT")
lstEvent.Width = 280
lstE = {}
lstEvent.Keys = lstE
lstEvent.Items = lstE

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
btnOkay:SetPoint("BOTTOM", btnCancel, "TOP")

-- Arrow Label
lblArrow = FontString("lblArrow", picker)
lblArrow:SetPoint("LEFT", lstEvent, "RIGHT")
lblArrow.Text = ">>"

-- Detail Label
lblDetail = FontString("lblDetail", picker)
lblDetail:SetPoint("TOPLEFT", lstCategory, "BOTTOMLEFT", 0, -4)
lblDetail:SetPoint("RIGHT", btnOkay, "LEFT")
lblDetail:SetPoint("BOTTOM", 0, 26)
lblDetail.JustifyH = "LEFT"
lblDetail.JustifyV = "TOP"
lblDetail.TextColor = ColorType(0, 1, 0)

-- Selected
lstSelected = List("lstSelected", picker)
lstSelected:SetPoint("TOPRIGHT", -4, -26)
lstSelected:SetPoint("LEFT", lblArrow, "RIGHT")
lstSelected:SetPoint("BOTTOM", lblDetail, "TOP", 4)
