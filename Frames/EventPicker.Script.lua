-- Addon Initialize
IGAS:NewAddon "Cube.Mdl_EventPicker"

_ThreadList = {}

function Cube:PickEvent()
	local thread = System.Threading.Thread()

	tinsert(_ThreadList, thread)

	picker.Visible = true

	return thread:Yield()
end

function picker:OnShow()
	lstCategory.SelectedIndex = 1

	lstSelected:Clear()
end

function picker:OnHide()
	local ret = {}

	for _, v in ipairs(lstSelected.Items) do
		tinsert(ret, v)
	end

	local thread = _ThreadList[1]

	if thread then
		tremove(_ThreadList, 1)

		if #_ThreadList > 0 then
			self.Visible = true
		end

		return thread(ret)
	end
end

function lstCategory:OnItemChoosed(key)
	local header

	for k in pairs(Event_Data) do
		header = k:match("^%w+")

		if header == key then
			tinsert(lstC, k)
		end
	end

	lstEvent:SetList(lstC)

	wipe(lstC)
end

function lstEvent:OnItemChoosed(key)
	lblDetail.Text = Event_Data[key].Description or ""
end

function lstEvent:OnItemDoubleClick(key)
	lstSelected:SetItem(key, key)
end

function btnOkay:OnClick()
	picker.Visible = false
end

function btnCancel:OnClick()
	lstSelected:Clear()

	picker.Visible = false
end