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
    _PlayerName                 = GetRealmName().."-"..GetUnitName("player")

    -- Import the old save data
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
        end

        _SVDB:Reset()

        _SVDB.CodeList          = codes
    end

    _SVDB:SetDefault{ CodeList  = { { name = "snippet" } } }

    -- Loading the SavedVariables
    for i, snippet in ipairs(_SVDB.CodeList) do
        cboSippets.Items[i]     = snippet.name

        if snippet.autorun and snippet.autorun[_PlayerName] then
            if runCode(i, true) then
                Info(_Locale["[%s] is loaded"], snippet.name)
            else
                Info(_Locale["[%s] loading failed"], snippet.name)
            end
        end
    end

    if #_SVDB.CodeList > 0 then
        cboSippets.SelectedValue= 1
        cboSippets:OnSelectChanged(1)
    end
end

function OnQuit()
    saveSnippet()
end

__SlashCmd__("cube", "code", _Locale["open/close the code editor"])
__SystemEvent__()
function CUBE_CODE_EDITOR_TOGGLE()
    CodeDialog:SetShown(not CodeDialog:IsShown())
end

-------------------------------------------
-- Cube Code Editor
-------------------------------------------
CodeDialog                      = Dialog("Cube_Code_Editor")
CodeDialog:Hide()

cboSippets                      = ComboBox        ("CboSippets", CodeDialog)
codeEditor                      = CodeEditor      ("Editor",     CodeDialog)
logView                         = InputScrollFrame("LogView",    CodeDialog)
tipLine                         = UIPanelLabel    ("Tips",       CodeDialog)
chkAutoRun                      = UICheckButton   ("AutoRun",    CodeDialog)
seperator                       = Resizer         ("Separator",  CodeDialog)

btnAdd                          = UIPanelButton   ("Add",        CodeDialog)
btnDelete                       = UIPanelButton   ("Delete",     CodeDialog)
btnRun                          = UIPanelButton   ("Run",        CodeDialog)
btnClear                        = UIPanelButton   ("Clear",      CodeDialog)

-------------------------------------------
-- Cube Code Editor Event Handlers
-------------------------------------------
function cboSippets:OnSelectChanged(index)
    saveSnippet()

    CodeDialog.CurrentSnippet   = index

    local snippet               = _SVDB.CodeList[index]
    codeEditor:SetText   (snippet and snippet.code or "")
    chkAutoRun:SetChecked(snippet and snippet.autorun and snippet.autorun[_PlayerName] or false)
end

function codeEditor:OnAltKey(key)
    -- Switch to each snippet based on the number index
end

function codeEditor:OnControlKey(key)
    if key:upper() == "S" then
        saveSnippet()
    end
end

function codeEditor:OnFunctionKey(key)
    if key == "F5" then
        runCode()
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
        cboSippets:OnSelectChanged(index)
    end
end

function btnRun:OnClick()
    runCode()
end

__Async__()
function btnDelete:OnClick()
    local index                 = CodeDialog.CurrentSnippet
    if not index then return end

    if index == 1 then
        return Confirm(_Locale["The first snippet can't be deleted"])
    end

    local snippet               = _SVDB.CodeList[index]
    if not snippet then return end

    if Confirm(_Locale["Are you sure you want to delete "] .. snippet.name) then
        CodeDialog.CurrentSnippet = nil

        tremove(_SVDB.CodeList, index)

        cboSippets:ClearItems()

        for i, snippet in ipairs(_SVDB.CodeList) do
            cboSippets.Items[i] = snippet.name
        end
        cboSippets.SelectedValue= 1
        cboSippets:OnSelectChanged(1)
    end
end

function btnClear:OnClick()
    logView:SetText("")
end

function chkAutoRun:PostClick()
    local index                 = CodeDialog.CurrentSnippet
    if not index then return end

    local value                 = self:GetChecked()
    local snippet               = _SVDB.CodeList[index]
    snippet.autorun             = snippet.autorun or {}
    snippet.autorun[_PlayerName]= value or false
end

__AsyncSingle__(true)
function CodeDialog:OnShow()
    CodeDialog:OnSizeChanged()

    while self:IsShown() do
        Delay(10)

        if not tipLine:GetText() or tipLine:GetText() == "" then
            showTip(_Tips[math.random(#_Tips)])
        end
    end
end

function CodeDialog:OnHide()
    saveSnippet()
end

function CodeDialog:OnSizeChanged()
    -- ReCalc the Code Editor's Height since the resize won't work properly
    local c, s                  = codeEditor:GetTop(), seperator:GetTop()
    if c and s then codeEditor:SetHeight(c - s) end
end

__AsyncSingle__(true)
function seperator:OnStartResizing()
    while self.IsResizing do
        Next()
        CodeDialog:OnSizeChanged()
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

function saveSnippet()
    local index                 = CodeDialog.CurrentSnippet
    if not index then return end
    local snippet               = _SVDB.CodeList[index]

    snippet.code                = codeEditor:GetText()
    showTip(_Locale["The code is saved"] .. "-" .. snippet.name)
end

function runCode(index, silent)
    local text                  = not index and codeEditor:GetText()
    local index                 = index or CodeDialog.CurrentSnippet
    if not index then return end
    local snippet               = _SVDB.CodeList[index]

    local func, err, ok         = loadsnippet(text or snippet.code, snippet.name)

    if func then
        -- print --> log
        local oldprint          = getprinthandler()
        setprinthandler(log)
        ok, err                 = pcall(func)
        setprinthandler(oldprint)
    end

    if not silent and err then
        log(err)
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
Style[CodeDialog]               = {
    Header                      = { Text = _Locale["Cube"] .. " - " .. _Locale["Code Editor"] },
    Size                        = Size(800, 600),
    clampedToScreen             = true,
    minResize                   = Size(600, 400),

    CboSippets                  = {
        size                    = Size(200, 32),
        location                = { Anchor("TOPLEFT", 4, -26) },
    },
    LogView                     = {
        maxLetters              = 0,
        hideCharCount           = true,
        height                  = 100,
        location                = { Anchor("BOTTOMLEFT", 28, 48), Anchor("RIGHT", -16, 0) },
        resizable               = true,
    },
    Separator                   = {
        location                = { Anchor("BOTTOMLEFT", 0, 0, "LogView", "TOPLEFT"), Anchor("BOTTOMRIGHT", 0, 0, "LogView", "TOPRIGHT") },
        height                  = 16,
        direction               = "TOP",
        resizeTarget            = logView,

        NormalTexture           = NIL,
        PushedTexture           = NIL,
        HighlightTexture        = {
            file                = [[Interface\QuestFrame\UI-QuestTitleHighlight]],
            alphamode           = "ADD",
            setAllPoints        = true,
        }
    },
    Editor                      = {
        resizable               = true,
        location                = { Anchor("TOPLEFT", 24, -8, "CboSippets", "BOTTOMLEFT"), Anchor("RIGHT", -16, 0) },
    },
    Tips                        = {
        location                = { Anchor("BOTTOMLEFT", 16, 16) }
    },
    Delete                      = {
        text                    = _Locale["Delete"],
        location                = { Anchor("TOPRIGHT", -32, -26) },
    },
    Add                         = {
        text                    = _Locale["Add"],
        location                = { Anchor("RIGHT", -4, 0, "Delete", "LEFT") },
    },
    Run                         = {
        text                    = _Locale["Run"] .. "(F5)",
        location                = { Anchor("BOTTOMRIGHT", -32, 16) },
    },
    Clear                       = {
        text                    = _Locale["Clear"],
        location                = { Anchor("RIGHT", -4, 0, "Run", "LEFT") },
    },
    AutoRun                     = {
        label                   = { text = _Locale["AutoRun"] },
        location                = { Anchor("LEFT", 4, 0, "CboSippets", "RIGHT") },
    },
}

-------------------------------------------
-- Tips
-------------------------------------------
_Tips                           = {
    _Locale["The snippets will be auto saved"],
    _Locale["Ctrl+S can be used to save the current snippet manually"],
    _Locale["Ctrl+Z can be used to undo the operations"],
    _Locale["Ctrl+Y can be used to redo the operations"],
    _Locale["Ctrl+K can be used to format the current snippet"],
    _Locale["Ctrl+Shift+D can be used to duplicate the current line"],
    _Locale["Ctrl+Shift+K can be used to delete the current line"],
    _Locale["F5 can be used to run the current snippet"],
    _Locale["Double-click can be used to select a word"],
    _Locale["Hold ctrl with arrow key can be used to skip a word"],
    _Locale["Hold shift and ctrl with arrow key can be used to select text by word"],
    _Locale["Hold ctrl with delete or backspace can be used to delete codes by word"],
    _Locale["Use up & down to move in the auto complete word list"],
    _Locale["Press enter or tab to select word from the auto complete word"],
    _Locale["Press tab repeatedly to toggle the auto complete words"],
}