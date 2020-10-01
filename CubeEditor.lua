--========================================================--
--                Cube - Code Editor                      --
--                                                        --
-- Author      :  kurapica125@outlook.com                 --
-- Create Date :  2020/09/22                              --
--========================================================--

--========================================================--
Scorpio           "Cube.Editor"                           ""
--========================================================--

export {
    strtrim                     = Toolset.trim,
    tremove                     = table.remove,
    loadsnippet                 = Toolset.loadsnippet,
}

-------------------------------------------
-- Addon Events
-------------------------------------------
function OnLoad()
    _PlayerName = GetRealmName().."-"..GetUnitName("player")

    -- Check if the save data is old version, only the snippets will be kept
    if _SVDB.CodeTree then
        local codes             = { { name = "snippet" } }

        for i, code in ipairs(_SVDB.CodeTree[1].Childs) do
            local autorun

            for k, v in pairs(code) do
                if k:find('-', 1, true) then
                    autorun     = autorun or {}
                    autorun[k]  = true
                end
            end

            codes[i + 1]        = {
                name            = code.Text,
                code            = code.Content,
                autorun         = autorun,
            }

            print(i+1, code.Text)
        end

        _SVDB:Reset()

        _SVDB.CodeList          = codes
    end

    _SVDB:SetDefault{ CodeList  = { { name = "snippet" } } }

    -- Loading the SavedVariables
    for i, snippet in ipairs(_SVDB.CodeList) do
        cboSippets.Items[i]     = snippet.name

        if snippet.autorun and snippet.autorun[_PlayerName] then
            if runCode(snippet.code, snippet.name) then
                Info("[%s] is loaded", snippet.name)
            else
                Info("[%s] loading failed", snippet.name)
            end
        end
    end

    cboSippets.SelectedValue    = 1
end

function OnQuit()
end

__SlashCmd__("cube", "code", _Locale["open/close the code editor"])
__SystemEvent__()
function CUBE_CODE_EDITOR_TOGGLE()
    CubeDialog:SetShown(not CubeDialog:IsShown())
end

-------------------------------------------
-- Cube Code Editor
-------------------------------------------
CubeDialog                      = Dialog("Cube_Code_Editor")
CubeDialog:Hide()

cboSippets                      = ComboBox("CboSippets", CubeDialog)
codeEditor                      = CodeEditor("Editor", CubeDialog)
logView                         = InputScrollFrame("LogView", CubeDialog)
tipLine                         = UIPanelLabel("Tips", CubeDialog)

btnAdd                          = UIPanelButton("Add", CubeDialog)
btnDelete                       = UIPanelButton("Delete", CubeDialog)
btnSave                         = UIPanelButton("Save", CubeDialog)
btnRun                          = UIPanelButton("Run", CubeDialog)
btnReset                        = UIPanelButton("Reset", CubeDialog)

-------------------------------------------
-- Cube Code Editor Event Handlers
-------------------------------------------
function cboSippets:OnSelectedChange(index)
    codeEditor:SetText(_SVDB.CodeList[index] and _SVDB.CodeList[index].code or "")
end

function codeEditor:OnAltKey(key)
    -- Switch to each snippet based on the number index
end

function codeEditor:OnControlKey(key)
    if key:upper() == "S" then
        btnSave:Click()
    end
end

function codeEditor:OnFunctionKey(key)
    if key == "F5" then
        btnRun:Click()
    end
end

__Async__()
function btnAdd:OnClick()
    local name                  = Input(_Locale["Please input the snippet's name"])
    name                        = name and strtrim(name)
    if name then
        for i, snippet in ipairs(_SVDB.CodeList) do
            if snippet.name == name then
                Alert(_Locale["The snippet name is already used."])
                return
            end
        end

        local index             = #_SVDB.CodeList + 1
        _SVDB.CodeList[index]   = { name = name }

        cboSippets.Items[index] = name
        cboSippets.SelectedValue= index
        cboSippets:OnSelectedChange(index)
    end
end

function btnSave:OnClick()
    if cboSippets.SelectedValue and cboSippets.SelectedValue ~= 1 then
        _SVDB.CodeList[cboSippets.SelectedValue].code = codeEditor:GetText()
        showTip(_Locale["The code is saved"])
    end
end

function btnRun:OnClick()
    runCode(codeEditor:GetText(), cboSippets.SelectedValue and _SVDB.CodeList[cboSippets.SelectedValue].name)
end

function btnReset:OnClick()
    codeEditor:SetText(cboSippets.SelectedValue and _SVDB.CodeList[cboSippets.SelectedValue] and _SVDB.CodeList[cboSippets.SelectedValue].code or "")
end

__Async__()
function btnDelete:OnClick()
    local snippet               = cboSippets.SelectedValue and _SVDB.CodeList[cboSippets.SelectedValue]
    if not snippet then return end

    if Confirm("Are you sure you want to delete " .. snippet.name) then
        tremove(_SVDB.CodeList, cboSippets.SelectedValue)

        cboSippets:ClearItems()

        for i, snippet in ipairs(_SVDB.CodeList) do
            cboSippets.Items[i] = snippet.name
        end
        cboSippets.SelectedValue= 1
    end
end

__AsyncSingle__(true)
function CubeDialog:OnShow()
    while self:IsShown() do
        Delay(10)

        if not tipLine:GetText() or tipLine:GetText() == "" then
            showTip(_Tips[math.random(#_Tips)])
        end
    end
end

__AsyncSingle__(true)
function showTip(text)
    if not text or text == "" then return end

    tipLine:SetAlpha(1)
    tipLine:SetText(text)

    -- Animation
    Delay(2)
    local total                 = GetFramerate() * 3
    for i = total, 0, -1 do tipLine:SetAlpha(i / total) Next() end
    tipLine:SetText("")
end

function runCode(text, source, silent)
    -- Need replace the print to log
    local func, err, ok         = loadsnippet(text or "", source)

    if func then
        local oldprint          = getprinthandler()
        setprinthandler(log)
        ok, err                 = pcall(func)
        setprinthandler(oldprint)
    end

    if not silent and err then

    end

    return not err and true or false
end

function log(...)
    local editBox               = logView:GetScrollChild():GetChild("EditBox")
    editBox:SetCursorPosition(#(editBox:GetText() or ""))
    for i = 1, select("#", ...) do
        if i > 1 then editBox:Insert(" ") end
        editBox:Insert(Toolset.tostring((select(i, ...))))
    end
    editBox:Insert("\n")
end


-------------------------------------------
-- Cube Code Editor Style
-------------------------------------------
Style[CubeDialog]               = {
    Header                      = { Text = _Locale["Cube"] .. " - " .. _Locale["Code Editor"] },
    Size                        = Size(800, 600),

    CboSippets                  = {
        size                    = Size(200, 32),
        location                = { Anchor("TOPLEFT", 4, -26) },
    },
    Editor                      = {
        location                = { Anchor("TOPLEFT", 24, -8, "CboSippets", "BOTTOMLEFT"), Anchor("BOTTOM", 0, 16, "LogView", "TOP"), Anchor("RIGHT", -16, 0) },
    },
    LogView                     = {
        height                  = 100,
        location                = { Anchor("BOTTOMLEFT", 28, 48), Anchor("RIGHT", -16, 0) },
    },
    Tips                        = {
        location                = { Anchor("BOTTOMLEFT", 16, 16) }
    },
    Add                         = {
        text                    = _Locale["Add"],
        location                = { Anchor("LEFT", 16, 0, "CboSippets", "RIGHT") },
    },
    Delete                      = {
        text                    = _Locale["Delete"],
        location                = { Anchor("LEFT", 16, 0, "Add", "RIGHT") },
    },
    Reset                       = {
        text                    = _Locale["Reset"],
        location                = { Anchor("LEFT", 16, 0, "Delete", "RIGHT") },
    },
    Save                        = {
        text                    = _Locale["Save"],
        location                = { Anchor("LEFT", 16, 0, "Reset", "RIGHT") },
    },
    Run                         = {
        text                    = _Locale["Run"],
        location                = { Anchor("TOP", 0, 0, "Add", "TOP"), Anchor("RIGHT", -16, 0) },
    },
}

-------------------------------------------
-- Tips
-------------------------------------------
_Tips                           = {
    _Locale["Ctrl+S can be used to save the current snippet"],
    _Locale["Ctrl+Z can be used to undo the operations"],
    _Locale["Ctrl+Y can be used to redo the operations"],
    _Locale["Ctrl+K can be used to format the code"],
    _Locale["F5 can be used to run the current snippet"],
    _Locale["Double-click can be used to select a word"],
    _Locale["Ctrl+Arrow key can be used to skip a word"],
    _Locale["Shift+Ctrl+Arrow Key can be used to select text by word"],
    _Locale["Use UP & DOWN to move in the auto complete word list"],
    _Locale["Press ENTER or TAB to select the auto complete word"],
    _Locale["Press TAB REPEATEDLY to toggle the auto complete words"],
}