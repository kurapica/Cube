IGAS:NewAddon("Cube")

API_Data = {
    ["GetLFGRoles"] = {
        ["Desc"] = "Returns what roles you signed up as in the Dungeon Finder.",
        ["Format"] = "isLeader, isTank, isHealer, isDPS = GetLFGRoles()",
    },
    ["PickupTradeMoney"] = {
        ["Desc"] = "Picks up an amount of money from the player's trading offer, placing it on the cursor.",
        ["Format"] = "PickupTradeMoney(copper);",
    },
    ["GetTrainerServiceTypeFilter"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "status",
                ["Desc"] = "Flag - 1 if currently displaying trainer services of the specified type, nil otherwise.",
            },
        },
        ["Format"] = "status = GetTrainerServiceTypeFilter(type);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "type",
                ["Desc"] = "String - Possible values:\"available\"\"unavailable\"\"used\" (already known)",
            },
        },
        ["Desc"] = "Returns the status of a skill filter in the trainer window.",
    },
    ["InCombatLockdown"] = {
        ["Desc"] = "Determines whether in-combat lockdown restrictions are active.",
        ["Format"] = "inLockdown = InCombatLockdown()",
    },
    ["SetTrainerServiceTypeFilter"] = {
        ["Desc"] = "Sets the status of a skill filter in the trainer window.",
        ["Format"] = "SetTrainerServiceTypeFilter(type, status [, exclusive]);",
    },
    ["UnitRace"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "raceName",
                ["Desc"] = "Localized race name, suitable for use in user interfaces.",
            },
            [2] = {
                ["Name"] = "raceId",
                ["Desc"] = "Localization-independent race ID, suitable for use as table keys. The race ID will be one of the following values:",
            },
        },
        ["Format"] = "raceName, raceId = UnitRace(\"unit\");",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String (unitId) - unit to return the race of.",
            },
        },
        ["Desc"] = "Returns the race of the specified unit.",
    },
    ["UnitClass"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "classDisplayName",
                ["Desc"] = "String - Localized class name, suitable for use in user interfaces; e.g. \"Mage\", \"Warrior\", \"Guerrier\".",
            },
            [2] = {
                ["Name"] = "class",
                ["Desc"] = "String - Localization-independent class name, used as some table keys; e.g. \"MAGE\", \"WARRIOR\", \"DEATHKNIGHT\".",
            },
            [3] = {
                ["Name"] = "classID",
                ["Desc"] = "Number (classId) - Numeric localization-independent class ID. (Added in 5.0.1)",
            },
        },
        ["Format"] = "classDisplayName, class, classID = UnitClass(\"unit\");",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String (unitId) - unit to query, e.g. \"player\"",
            },
        },
        ["Desc"] = "Returns the class (Mage, Warrior, etc) of the specified unit.",
    },
    ["CancelLogout"] = {
        ["Desc"] = "Cancels the logout timer (from camping or quitting).",
        ["Format"] = "CancelLogout()",
    },
    ["CursorHasItem"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "hasItem",
                ["Desc"] = "Boolean - Whether the cursor is holding an item.",
            },
        },
        ["Format"] = "hasItem = CursorHasItem()",
        ["Arguments"] = "nil",
        ["Desc"] = "Returns 1 if the cursor currently holds an item, nil otherwise.",
    },
    ["EnableAddOn"] = {
        ["Returns"] = "nil",
        ["Format"] = "EnableAddOn(index or \"name\")",
        ["Arguments"] = "(index or \"name\")",
        ["Desc"] = "Enable an AddOn for subsequent sessions.",
    },
    ["Screenshot"] = {
        ["Desc"] = "This function will take a screenshot.",
        ["Format"] = "Screenshot()",
    },
    ["QuestIsWeekly"] = {
        ["Desc"] = "Returns whether the currently offered quest is a weekly quest.",
        ["Format"] = "isWeekly = QuestIsWeekly();",
    },
    ["GetCursorInfo"] = {
        ["Desc"] = "Returns information about what the mouse cursor is holding.",
        ["Format"] = "\"infoType\", ... = GetCursorInfo()",
    },
    ["GetSpellBonusHealing"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "bonusHeal",
                ["Desc"] = "Integer - The raw bonus healing of the player",
            },
        },
        ["Format"] = "bonusHeal = GetSpellBonusHealing();",
        ["Arguments"] = "none",
        ["Desc"] = "Returns the raw bonus healing of the player.",
    },
    ["GetRuneType"] = {
        ["Desc"] = "Gets the type of rune for a given rune ID.",
        ["Format"] = "runeType = GetRuneType(id)",
    },
    ["GetBlockChance"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["IsEquippedItem"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["GetTitleName"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "titleName",
                ["Desc"] = "String - The name of the title, e.g. \" Slayer of Stupid, Incompetent and Disappointing Minions\". Prefixed titles have a trailing space character; suffixed titles have a prefixed space character.",
            },
            [2] = {
                ["Name"] = "playerTitle",
                ["Desc"] = "Boolean - true for all existing titles; nil if titleId is invalid.",
            },
        },
        ["Format"] = "titleName, playerTitle = GetTitleName(titleId)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "titleId",
                ["Desc"] = "Number - Title ID to return the name of.",
            },
        },
        ["Desc"] = "Gets the name of the title associated with a title index.",
    },
    ["IsReferAFriendLinked"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isLinked",
                ["Desc"] = "Flag: 1 if the unit is RAF-linked to the player, nil otherwise.",
            },
        },
        ["Format"] = "isLinked = IsReferAFriendLinked(\"unit\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String (UnitId) - Unit to query information about.",
            },
        },
        ["Desc"] = "Determines whether the given unit is linked to the player via the Recruit-A-Friend feature.",
    },
    ["CollapseFactionHeader"] = {
        ["Returns"] = "nil",
        ["Format"] = "CollapseFactionHeader(rowIndex)",
        ["Arguments"] = "(rowIndex)",
        ["Desc"] = "Collapse a faction header row.",
    },
    ["SelectGossipActiveQuest"] = {
        ["Desc"] = "Selects an active quest from a gossip list.",
        ["Format"] = "SelectGossipActiveQuest(index)",
    },
    ["IsAddOnLoadOnDemand"] = {
        ["Returns"] = "loadDemand",
        ["Format"] = "loadDemand = IsAddOnLoadOnDemand(index or \"name\")",
        ["Arguments"] = "(index or \"name\")",
        ["Desc"] = "Determine if an AddOn is loaded on demand (via .toc file dependencies or LoadAddOn) rather than at startup",
    },
    ["RegisterCVar"] = {
        ["Desc"] = "Registers a cvar (temporarily)",
        ["Format"] = "RegisterCVar( \"cvar\", value );",
    },
    ["LoggingChat"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isLogging",
                ["Desc"] = "Boolean - current state of logging",
            },
        },
        ["Format"] = "isLogging = LoggingChat([newState])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "newState",
                ["Desc"] = "Boolean - toggles chat logging",
            },
        },
        ["Desc"] = "Toggles the chat logging and returns the current state.",
    },
    ["GetContainerItemCooldown"] = {
        ["Returns"] = "startTime, duration, isEnabled",
        ["Format"] = "startTime, duration, isEnabled = GetContainerItemCooldown(bagID, slot)",
        ["Arguments"] = "(bagID, slot)",
        ["Desc"] = "Returns cooldown information for an item in your inventory",
    },
    ["PickupMacro"] = {
        ["Desc"] = "Pick up a macro from the macro frame and place it on the cursor",
        ["Format"] = "PickupMacro(\"macroName\" or macroID)",
    },
    ["GetEquipmentSetItemIDs"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "itemArray",
                ["Desc"] = "Table - the array portion of this table contains item IDs of the items in the set.",
            },
            [2] = {
                ["Desc"] = "0: Ammo",
            },
            [3] = {
                ["Desc"] = "1: Head",
            },
            [4] = {
                ["Desc"] = "2: Neck",
            },
            [5] = {
                ["Desc"] = "3: Shoulder",
            },
            [6] = {
                ["Desc"] = "4: Shirt",
            },
            [7] = {
                ["Desc"] = "5: Chest",
            },
            [8] = {
                ["Desc"] = "6: Belt",
            },
            [9] = {
                ["Desc"] = "7: Legs",
            },
            [10] = {
                ["Desc"] = "8: Feet",
            },
            [11] = {
                ["Desc"] = "9: Wrist",
            },
            [12] = {
                ["Desc"] = "10: Gloves",
            },
            [13] = {
                ["Desc"] = "11: Finger 1",
            },
            [14] = {
                ["Desc"] = "12: Finger 2",
            },
            [15] = {
                ["Desc"] = "13: Trinket 1",
            },
            [16] = {
                ["Desc"] = "14: Trinket 2",
            },
            [17] = {
                ["Desc"] = "15: Back",
            },
            [18] = {
                ["Desc"] = "16: Main hand",
            },
            [19] = {
                ["Desc"] = "17: Off hand",
            },
            [20] = {
                ["Desc"] = "18: Ranged",
            },
            [21] = {
                ["Desc"] = "19: Tabard",
            },
        },
        ["Format"] = "itemArray = GetEquipmentSetItemIDs(\"name\"[, returnTable]);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "\"name\"",
                ["Desc"] = "String - equipment set name to retrieve information about.",
            },
            [2] = {
                ["Name"] = "returnTable",
                ["Desc"] = "Table, optional - if specified, the array portion of the table is populated with item IDs. If not provided, a new table is created",
            },
        },
        ["Desc"] = "Populates a table with item IDs of items in the specified equipment set.",
    },
    ["RandomRoll"] = {
        ["Desc"] = "Performs a random roll between two numbers.",
        ["Format"] = "RandomRoll([low, [high]])",
    },
    ["LFGTeleport"] = {
        ["Desc"] = "Teleports the player to or from an LFG dungeon.",
        ["Format"] = "LFGTeleport(toSafety);",
    },
    ["FollowUnit"] = {
        ["Desc"] = "Start following an allied unit",
        ["Format"] = "FollowUnit(\"unit\")",
    },
    ["CalendarEventSetType"] = {
        ["Returns"] = "nil",
        ["Format"] = "",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "type",
                ["Desc"] = "Number - One of the CALENDAR_EVENTTYPE_ definitions:",
            },
        },
        ["Desc"] = "",
    },
    ["hooksecurefunc"] = {
        ["Desc"] = "Creates a secure \"post hook\" for the specified function. Your hook will be called with the same arguments after the original call is performed.",
        ["Format"] = "hooksecurefunc([table,] \"functionName\", hookfunc)",
    },
    ["UnitIsDND"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isDND",
                ["Desc"] = "1 if unit is DND, nil otherwise.",
            },
        },
        ["Format"] = "isDND = UnitIsDND(\"unit\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "The UnitId to return DND status of.",
            },
        },
        ["Desc"] = "Checks if a unit is DND (Do Not Disturb).",
    },
    ["ClickSendMailItemButton"] = {
        ["Desc"] = "Places or picks up an item from the send mail frame. Can also clear an item rather than picking it up.",
        ["Format"] = "ClickSendMailItemButton([itemIndex, [clearItem]])",
    },
    ["UnitXPMax"] = {
        ["Returns"] = "XP",
        ["Format"] = "XP = UnitXPMax(\"unit\")",
        ["Arguments"] = "(\"unit\")",
        ["Desc"] = "Return the max XP of a \"unit\" - only seems to work with \"player\".",
    },
    ["GetCombatRatingBonus"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "bonus",
                ["Desc"] = "Number - the actual bonus in percent the combat rating confers; e.g. 5.13452",
            },
        },
        ["Format"] = "bonus = GetCombatRatingBonus(combatRatingIdentifier)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "combatRatingIdentifier",
                ["Desc"] = "Number - A combat rating identifier from PaperDollFrame.lua, one of:CR_UNUSED_1 = 1; (Formerly CR_WEAPON_SKILL. Removed in 6.0.2)CR_DEFENSE_SKILL = 2;CR_DODGE = 3;CR_PARRY = 4;CR_BLOCK = 5;CR_HIT_MELEE = 6;CR_HIT_RANGED = 7;CR_HIT_SPELL = 8;CR_CRIT_MELEE = 9;CR_CRIT_RANGED = 10;CR_CRIT_SPELL = 11;CR_MULTISTRIKE = 12; (Formerly CR_HIT_TAKEN_MELEE. Changed in 6.0.2)CR_READINESS = 13; (Formerly CR_HIT_TAKEN_RANGED. Changed in 6.0.2)CR_SPEED = 14; (Formerly CR_HIT_TAKEN_SPELL. Changed in 6.0.2)COMBAT_RATING_RESILIENCE_CRIT_TAKEN = 15;COMBAT_RATING_RESILIENCE_PLAYER_DAMAGE_TAKEN = 16;CR_LIFESTEAL = 17; (Formerly CR_CRIT_TAKEN_SPELL. Changed in 6.0.2)CR_HASTE_MELEE = 18;CR_HASTE_RANGED = 19;CR_HASTE_SPELL = 20;CR_AVOIDANCE = 21; (Formerly CR_WEAPON_SKILL_MAINHAND. Changed in 6.0.2)CR_UNUSED_2 = 22; (Formerly CR_WEAPON_SKILL_OFFHAND. Removed in 6.0.2)CR_WEAPON_SKILL_RANGED = 23;CR_EXPERTISE = 24;CR_ARMOR_PENETRATION = 25;CR_MASTERY = 26;CR_UNUSED_3 = 27; (Formerly CR_PVP_POWER. Removed in 6.0.2)CR_UNUSED_4 = 28;CR_VERSATILITY_DAMAGE_DONE = 29;CR_VERSATILITY_DAMAGE_TAKEN = 31;",
            },
        },
        ["Desc"] = "Returns the bonus, in percent (or other converted units, such as skill points), of a specific combat rating for the player.",
    },
    ["GetActionText"] = {
        ["Desc"] = "Gets the text label for an action.",
        ["Format"] = "text = GetActionText(actionSlot)",
    },
    ["CloseLoot"] = {
        ["Returns"] = "nil",
        ["Format"] = "CloseLoot({errNo})",
        ["Arguments"] = "({errNo})",
        ["Desc"] = "Close the loot window.",
    },
    ["AddTradeMoney"] = {
        ["Desc"] = "Adds money currently on the cursor to your trade offer.",
        ["Format"] = "AddTradeMoney();",
    },
    ["UnitPlayerOrPetInRaid"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isTrue",
                ["Desc"] = "1 or nil",
            },
        },
        ["Format"] = "isTrue = UnitPlayerOrPetInRaid(\"unit\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "\"unit\"",
                ["Desc"] = "String - unitId who should be checked",
            },
        },
        ["Desc"] = "Returns 1 if the unit is in your raid group, nil otherwise.",
    },
    ["GetChatWindowInfo"] = {
        ["Returns"] = "name, fontSize, r, g, b, alpha, shown, locked, docked, uninteractable",
        ["Format"] = "name, fontSize, r, g, b, alpha, shown, locked, docked, uninteractable = GetChatWindowInfo(frameIndex);",
        ["Arguments"] = "(frameIndex)",
        ["Desc"] = "Retrieves configuration information about a chat window.",
    },
    ["GetVoidTransferDepositInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "itemID",
                ["Desc"] = "Number - Item ID",
            },
            [2] = {
                ["Name"] = "textureName",
                ["Desc"] = "String - Item Icon",
            },
        },
        ["Format"] = "itemID, textureName = GetVoidTransferDepositInfo(slotIndex)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "slotIndex",
                ["Desc"] = "Number - Index ranging from 1 to 9 (VOID_DEPOSIT_MAX)",
            },
        },
        ["Desc"] = "Returns info about the item being deposited into the Void Storage [1]",
    },
    ["CalendarNewEvent"] = {
        ["Returns"] = "nil",
        ["Format"] = "",
        ["Arguments"] = "No Arguments",
        ["Desc"] = "",
    },
    ["UnitDebuff"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - The name of the spell or effect of the debuff, or nil if no debuff was found with the specified name or at the specified index. This is the name shown in yellow when you mouse over the icon.",
            },
            [2] = {
                ["Name"] = "rank",
                ["Desc"] = "String - The rank of the spell or effect that caused the debuff. Returns \"\" if there is no rank.",
            },
            [3] = {
                ["Name"] = "icon",
                ["Desc"] = "String - The identifier of (path and filename to) the indicated debuff, or nil if no debuff",
            },
            [4] = {
                ["Name"] = "count",
                ["Desc"] = "Number - The number of times the debuff has been applied to the target. Returns 0 for any debuff which doesn't stack. ( Changed in 1.11 ).",
            },
            [5] = {
                ["Name"] = "debuffType",
                ["Desc"] = "String - The type of the debuff: Magic, Disease, Poison, Curse, or nothing for those with out a type.",
            },
            [6] = {
                ["Name"] = "duration",
                ["Desc"] = "Number - The full duration of the debuff in seconds; nil if the debuff was not cast by the player.",
            },
            [7] = {
                ["Name"] = "expirationTime",
                ["Desc"] = "Number - Time at which the debuff expires (GetTime() as a reference frame).",
            },
            [8] = {
                ["Name"] = "unitCaster",
                ["Desc"] = "String - unitId reference to the unit that cast the buff/debuff.",
            },
            [9] = {
                ["Name"] = "isStealable",
                ["Desc"] = "Boolean - 1 if it is stealable otherwise nil",
            },
            [10] = {
                ["Name"] = "shouldConsolidate",
                ["Desc"] = "Boolean - 1 if the buff should be placed in a buff consolidation box (usually long-term effects).",
            },
            [11] = {
                ["Name"] = "spellId",
                ["Desc"] = "Number - spell ID of the aura.",
            },
            [12] = {
                ["Name"] = "canApplyAura",
                ["Desc"] = "Boolean - true if the player can apply the aura (not necessarily if the player did apply the aura, just if the player can apply the aura).",
            },
            [13] = {
                ["Name"] = "isBossDebuff",
                ["Desc"] = "Boolean - true if the aura was cast by a boss.",
            },
            [14] = {
                ["Name"] = "value1",
                ["Desc"] = "Number - Value of variable effect 1 of the aura. (HoTs, resource-capturing trinkets, etc.)",
            },
            [15] = {
                ["Name"] = "value2",
                ["Desc"] = "Number - Value of variable effect 2 of the aura. (HoTs, resource-capturing trinkets, etc.) - Malkorok's shield value (for all versions of the debuff), and Tortus' heroic's shield value.",
            },
            [16] = {
                ["Name"] = "value3",
                ["Desc"] = "Number - Value of variable effect 3 of the aura. (HoTs, resource-capturing trinkets, etc.) - Norushen's Corruption debuff power value for example.",
            },
        },
        ["Format"] = "name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellId, canApplyAura, isBossDebuff, value1, value2, value3 = UnitDebuff(\"unit\", index or \"name\"[, \"rank\"[, \"filter\"]])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - The unit you want debuff information for.",
            },
            [2] = {
                ["Name"] = "index",
                ["Desc"] = "Number - The index of the debuff to retrieve info for. Starts at 1, maximum 40.",
            },
            [3] = {
                ["Name"] = "filter",
                ["Desc"] = "This parameter can be any of \"PLAYER\", \"RAID\", \"CANCELABLE\", \"NOT_CANCELABLE\". You can also specify several filters separated by a | or space character to chain multiple filters together (e.g. \"NOT_CANCELABLE|RAID\" or \"NOT_CANCELABLE RAID\" == un-cancelable debuffs that you can cast on your raid).",
            },
        },
        ["Desc"] = "Retrieve info about a certain debuff on a certain unit. This is essentially an alias of UnitAura with the \"HARMFUL\" filter applied.",
    },
    ["CalendarGetMonthNames"] = {
        ["Returns"] = "an array of names",
        ["Format"] = "",
        ["Arguments"] = "No Arguments",
        ["Desc"] = "",
    },
    ["CloseItemText"] = {
        ["Returns"] = "nil",
        ["Format"] = "CloseItemText()",
        ["Arguments"] = "()",
        ["Desc"] = "Close an open item text (book, plaque, etc).",
    },
    ["SortQuestWatches"] = {
        ["Desc"] = "Sorts watched quests by proximity to the player character.",
        ["Format"] = "changed = SortQuestWatches();",
    },
    ["GetMoney"] = {
        ["Desc"] = "Returns an integer value of your held money.",
        ["Format"] = "money = GetMoney();",
    },
    ["SetGuildInfoText"] = {
        ["Returns"] = "nil",
        ["Format"] = "SetGuildInfoText(\"text\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "\"text\"",
                ["Desc"] = "String - The text to set as the guild info.",
            },
        },
        ["Desc"] = "Changes the Guild Info to selected text.",
    },
    ["GetZonePVPInfo"] = {
        ["Desc"] = "Returns PVP info for the current zone.",
        ["Format"] = "pvpType, isFFA, faction = GetZonePVPInfo();",
    },
    ["GetTradeTargetItemInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "Returns",
                ["Desc"] = "name, texture, quantity, quality, isUsable, enchant",
            },
        },
        ["Format"] = "name, texture, quantity, quality, isUsable, enchant = GetTradeTargetItemInfo(index)",
        ["Arguments"] = "(index)",
        ["Desc"] = "Returns information about items in the target's trade window.",
    },
    ["GetLootSlotInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "lootIcon",
                ["Desc"] = "String - The path of the graphical icon for the item.",
            },
            [2] = {
                ["Name"] = "lootName",
                ["Desc"] = "String - The name of the item.",
            },
            [3] = {
                ["Name"] = "lootQuantity",
                ["Desc"] = "Number - The quantity of the item in a stack. Note: Quantity for coin is always 0.",
            },
            [4] = {
                ["Name"] = "lootQuality",
                ["Desc"] = "Number - The quality code for that item.",
            },
            [5] = {
                ["Name"] = "locked",
                ["Desc"] = "Boolean - Whether you are eligible to loot this item or not. Locked items are by default shown tinted red.",
            },
            [6] = {
                ["Name"] = "isQuestItem",
                ["Desc"] = "Boolean - Self-explanatory.",
            },
            [7] = {
                ["Name"] = "questID",
                ["Desc"] = "Number - The identifying number for the quest.",
            },
            [8] = {
                ["Name"] = "isActive",
                ["Desc"] = "Boolean - True if the item starts a quest that you are not currently on.",
            },
        },
        ["Format"] = "lootIcon, lootName, lootQuantity, lootQuality, locked, isQuestItem, questID, isActive = GetLootSlotInfo(slot)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "slot",
                ["Desc"] = "Number - the index of the loot (1 is the first item, typically coin)",
            },
        },
        ["Desc"] = "Returns information about the contents of a loot slot.",
    },
    ["DisableAddOn"] = {
        ["Returns"] = "nil",
        ["Format"] = "DisableAddOn(index or \"name\")",
        ["Arguments"] = "(index or \"name\")",
        ["Desc"] = "Disable an AddOn for subsequent sessions.",
    },
    ["ForceGossip"] = {
        ["Desc"] = "Returns whether the gossip text must be displayed.",
        ["Format"] = "forced = ForceGossip();",
    },
    ["GetTotalAchievementPoints"] = {
        ["Desc"] = "Returns the total number of Achievement Points earned.",
        ["Format"] = "points = GetTotalAchievementPoints()",
    },
    ["GetNumBankSlots"] = {
        ["Desc"] = "Returns information about the number of purchased bank bag slots.",
        ["Format"] = "numSlots, full = GetNumBankSlots();",
    },
    ["GetInventoryItemLink"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "\"itemLink\"",
                ["Desc"] = "itemLink- The item link for the specified item or",
            },
            [2] = {
                ["Desc"] = "nil, if the slot is empty.",
            },
        },
        ["Format"] = "\"itemLink\" = GetInventoryItemLink(\"unit\", slotId)",
        ["Arguments"] = "(\"unit\", slotId)",
        ["Desc"] = "Get the itemLink for the specified item.",
    },
    ["BNGetNumFriendToons"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "numToons",
                ["Desc"] = "Integer - The number of toons or 0, if no data is available under the friendIndex",
            },
        },
        ["Format"] = "numToons = BNGetNumFriendToons(friendIndex)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "friendIndex",
                ["Desc"] = "Integer - The Battle.net friend's index on the friendslist",
            },
        },
        ["Desc"] = "Returns the specified Battle.net friend's number of toons.",
    },
    ["GetQuestLogRewardSpell"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["SaveView"] = {
        ["Returns"] = "nil",
        ["Format"] = "SaveView(viewIndex)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "viewIndex",
                ["Desc"] = "Number - The index (2-5) to save the camera angle to. (1 is reserved for first person view)",
            },
        },
        ["Desc"] = "Saves a camera angle for later retrieval with SetView. The last position loaded is stored in the CVar cameraView.",
    },
    ["PickupBagFromSlot"] = {
        ["Desc"] = "Picks up the bag from the specified slot, placing it in the cursor.",
        ["Format"] = "PickupBagFromSlot(slot);",
    },
    ["AbandonSkill"] = {
        ["Desc"] = "The player abandons a skill.",
        ["Format"] = "AbandonSkill(skillIndexNum);",
    },
    ["GetInstanceLockTimeRemaining"] = {
        ["Desc"] = "Returns information about the instance lock timer for the current instance.",
        ["Format"] = "lockTimeleft, isPreviousInstance, encountersTotal, encountersComplete = GetInstanceLockTimeRemaining()",
    },
    ["IsModifierKeyDown"] = {
        ["Desc"] = "There are three seperate levels of IsModifierKeyDown() type API functions but they all do the same basic function and return true if the specified key is currently pressed down.The first level is one function to tell you if any of the modifier keys are down IsModifierKeyDown()The second level is the three diferent functions one for each type of Modifier key: Shift, Alt &amp; CtrlThe third is one function for each seperate modifier key: Left Alt, Right Alt, Left Shift, Right Shift, Left Ctrl &amp; Right Ctrl.Is Any Modifier Key DownReturns whether ANY modifier key is currently pressed down.",
        ["Format"] = "anyModKeyIsDown = IsModifierKeyDown();",
    },
    ["HelpReportLag"] = {
        ["Desc"] = "Sends a Lag Report. This function is called by the HelpFrame when reporting lag using the GM window.",
        ["Format"] = "HelpReportLag",
    },
    ["MoveViewOutStop"] = {
        ["Desc"] = "Stops moving the camera out.",
        ["Format"] = "MoveViewOutStop()",
    },
    ["GuildControlSetRankFlag"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["LoadBindings"] = {
        ["Desc"] = "Loads a binding set into memory, activating those bindings.",
        ["Format"] = "LoadBindings(bindingSet);",
    },
    ["PickupInventoryItem"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["GetSpellBookItemName"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "spellName",
                ["Desc"] = "String - Name of the spell as it appears in the spell book, eg. \"Lesser Heal\"",
            },
            [2] = {
                ["Name"] = "spellSubName",
                ["Desc"] = "String - The spell rank or sub type, eg. \"Grand Master\", \"Racial Passive\". This can be an empty string. Note: for the Enchanting trade skill at rank Apprentice, the returned string contains a trailing space, ie. \"Apprentice \". This might be the case for other trade skills and ranks also.",
            },
        },
        ["Format"] = "spellName, spellSubName = GetSpellBookItemName( \"spellName\" or slotIndex, \"bookType\" )",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "spellName",
                ["Desc"] = "String - Spell book item name.",
            },
        },
        ["Desc"] = "Retrieves the spell name and spell rank for a spell in the player's spell book.",
    },
    ["UnitDamage"] = {
        ["Returns"] = "lowDmg, hiDmg, offlowDmg, offhiDmg, posBuff, negBuff, percentmod",
        ["Format"] = "lowDmg, hiDmg, offlowDmg, offhiDmg, posBuff, negBuff, percentmod = UnitDamage(\"unit\");",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - The unitId to get information for. (Likely only works for \"player\" and \"pet\". Possibly for  [Beast Lore]'d \"target\"s. -- unconfirmed)",
            },
        },
        ["Desc"] = "Unit damage returns information about your current damage stats. Doesn't seem to return usable values for mobs, NPCs, or other players. The method returns 7 values, only some of which appear to be useful.",
    },
    ["UnitInParty"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "inParty",
                ["Desc"] = "Boolean - if the unit is in your party",
            },
        },
        ["Format"] = "inParty = UnitInParty(\"unit\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - unitId who should be checked",
            },
        },
        ["Desc"] = "Returns 1 if the unit is a player in your party, nil otherwise.",
    },
    ["GetBattlefieldInstanceExpiration"] = {
        ["Desc"] = "Get shutdown timer for the battlefield instance.",
        ["Format"] = "expiration = GetBattlefieldInstanceExpiration()",
    },
    ["ChannelBan"] = {
        ["Desc"] = "Bans a player from the specified channel.",
        ["Format"] = "ChannelBan(channelName, playerName);",
    },
    ["GuildControlDelRank"] = {
        ["Returns"] = "nil",
        ["Format"] = "",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - must be between 1 and the value returned by GuildControlGetNumRanks().",
            },
        },
        ["Desc"] = "",
    },
    ["ChannelMute"] = {
        ["Desc"] = "Turns off the specified player's ability to speak in a channel.",
        ["Format"] = "ChannelMute(channelName, playerName);",
    },
    ["DelMute"] = {
        ["Desc"] = "Unmutes a player in the in-game voice chat.",
        ["Format"] = "DelMute(\"playerName\");",
    },
    ["CalendarEventGetInvite"] = {
        ["Returns"] = "name, level, className, classFilename, inviteStatus, modStatus, inviteIsMine, inviteType, arg9",
        ["Format"] = "name, level, className, classFilename, inviteStatus, modStatus, inviteIsMine, inviteType, arg9 = CalendarEventGetInvite(invitee)",
        ["Arguments"] = "(invitee)",
        ["Desc"] = "Retrieve information about the specified event.",
    },
    ["CalendarEventSetDate"] = {
        ["Returns"] = "nil",
        ["Format"] = "CalendarEventSetDate(month,day,year)",
        ["Arguments"] = "(\"month\", \"day\", \"year\")",
        ["Desc"] = "One line summary description of function.",
    },
    ["GetSendMailItemLink"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "itemLink",
                ["Desc"] = "itemLink - The item link for the specified item",
            },
        },
        ["Format"] = "itemLink = GetSendMailItemLink(attachment)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "attachment",
                ["Desc"] = "Number - The index of the attachment to query, in the range of [1,ATTACHMENTS_MAX_SEND]",
            },
        },
        ["Desc"] = "Returns the itemLink of an item attached to the mail message the player is sending.",
    },
    ["CanJoinBattlefieldAsGroup"] = {
        ["Desc"] = "Returns, whether the player can join a battlefield as group or not.",
        ["Format"] = "isTrue = CanJoinBattlefieldAsGroup()",
    },
    ["GetAchievementCriteriaInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "criteriaString",
                ["Desc"] = "String - The name of the criteria.",
            },
            [2] = {
                ["Name"] = "criteriaType",
                ["Desc"] = "Number - Criteria type; specifies the meaning of the assetID.",
            },
            [3] = {
                ["Name"] = "completed",
                ["Desc"] = "Boolean - True if you've completed this criteria; false otherwise.",
            },
            [4] = {
                ["Name"] = "quantity",
                ["Desc"] = "Number - Quantity requirement imposed by some criteriaType.",
            },
            [5] = {
                ["Name"] = "reqQuantity",
                ["Desc"] = "Number - The required quantity for the criteria. Used mostly in achievements with progress bars. Usually 0.",
            },
            [6] = {
                ["Name"] = "charName",
                ["Desc"] = "String - The name of the character that completed this achievement.",
            },
            [7] = {
                ["Name"] = "flags",
                ["Desc"] = "Number - Some flags. Currently unknown purpose.",
            },
            [8] = {
                ["Name"] = "assetID",
                ["Desc"] = "Number - Criteria data whose meaning depends on the type.",
            },
            [9] = {
                ["Name"] = "quantityString",
                ["Desc"] = "String - The string used to display the current quantity. Usually the string form of the quantity return.",
            },
            [10] = {
                ["Name"] = "criteriaID",
                ["Desc"] = "Number - Unique criteria ID.",
            },
            [11] = {
                ["Name"] = "eligible",
                ["Desc"] = "Boolean - True if the criteria is eligible to be completed; false otherwise. Used to determine whether to show the criteria line in the objectives tracker in red or not.",
            },
        },
        ["Format"] = "criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString, criteriaID, eligible = GetAchievementCriteriaInfo(achievementID, criteriaIndex)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "achievementID",
                ["Desc"] = "Number - Achievement ID the queried criteria belongs to.",
            },
            [2] = {
                ["Name"] = "criteriaIndex",
                ["Desc"] = "Number - Index of the criteria to query, ascending from 1 up to GetAchievementNumCriteria(achievementID).",
            },
        },
        ["Desc"] = "Returns information about the given Achievement's specified criteria.",
    },
    ["ListChannelByName"] = {
        ["Desc"] = "Lists members in the given channel to the chat window.",
        ["Format"] = "ListChannelByName([channelName])",
    },
    ["GetBagName"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["SelectQuestLogEntry"] = {
        ["Desc"] = "Makes a quest in the quest log the currently selected quest.",
        ["Format"] = "SelectQuestLogEntry(questIndex)",
    },
    ["BankButtonIDToInvSlotID"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "invSlot",
                ["Desc"] = "An inventory slot ID that can be used in other inventory functions",
            },
        },
        ["Format"] = "invSlot = BankButtonIDToInvSlotID(buttonID, isBag)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "buttonID",
                ["Desc"] = "Number - bank item/bag ID.",
            },
        },
        ["Desc"] = "Map a bank item button or bag to an inventory slot button for use in inventory functions.",
    },
    ["ConfirmSummon"] = {
        ["Desc"] = "Accepts a summon request (only works during the two minutes the summon is available).",
        ["Format"] = "ConfirmSummon()",
    },
    ["PlaceAuctionBid"] = {
        ["Desc"] = "Place a bid on the selected auction item.",
        ["Format"] = "PlaceAuctionBid(\"type\", index, bid);",
    },
    ["SaveEquipmentSet"] = {
        ["Desc"] = "Saves your currently equipped items into a equipment set (creates a new one or modifies an existing one) of the name specified with the icon also specified.",
        ["Format"] = "SaveEquipmentSet(\"name\"[, \"icon\"])",
    },
    ["GetPetExperience"] = {
        ["Desc"] = "Returns the pet's current XP total, and the XP total required for the next level.",
        ["Format"] = "currXP, nextXP = GetPetExperience();",
    },
    ["GetThreatStatusColor"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "r",
                ["Desc"] = "number - a value between 0 and 1 for the red content of the color",
            },
            [2] = {
                ["Name"] = "g",
                ["Desc"] = "number - a value between 0 and 1 for the green content of the color",
            },
            [3] = {
                ["Name"] = "b",
                ["Desc"] = "number - a value between 0 and 1 for the blue content of the color",
            },
        },
        ["Format"] = "r, g, b = GetThreatStatusColor(statusIndex)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "status",
                ["Desc"] = "integer - the threat status value to get colors for",
            },
        },
        ["Desc"] = "Returns RGB color values corresponding to a threat status returned by UnitThreatSituation. Added in Patch 3.0.",
    },
    ["GetTalentClearInfo"] = {
        ["Desc"] = "Returns information about the current cost of unlearning a talent.",
        ["Format"] = "name, count, icon, spellId, cost = GetTalentClearInfo()",
    },
    ["GetInboxItemLink"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "itemLink",
                ["Desc"] = "itemLink - The itemLink for the specified item",
            },
        },
        ["Format"] = "itemLink = GetInboxItemLink(message, attachment)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "message",
                ["Desc"] = "Number - The index of the message to query, in the range of [1,GetInboxNumItems()]",
            },
            [2] = {
                ["Name"] = "attachment",
                ["Desc"] = "Integer - The index of the attachment to query, in the range of [1,ATTACHMENTS_MAX_RECEIVE]",
            },
        },
        ["Desc"] = "Returns the itemLink of an item attached to a message in the player's mailbox.",
    },
    ["GetUnitSpeed"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "currentSpeed",
                ["Desc"] = "Number - current movement speed in yards per second (normal running: 7; an epic ground mount: 14)",
            },
            [2] = {
                ["Name"] = "runSpeed",
                ["Desc"] = "Number - the maximum speed on the ground, in yards per second (including talents such as Pursuit of Justice and ground mounts)",
            },
            [3] = {
                ["Name"] = "flightSpeed",
                ["Desc"] = "Number - the maximum speed while flying, in yards per second (the unit need to be on a flying mount to get the flying speed)",
            },
            [4] = {
                ["Name"] = "swimSpeed",
                ["Desc"] = "Number - the maximum speed while swimming, in yards per second (not tested but it should be as the flying mount)",
            },
        },
        ["Format"] = "currentSpeed, runSpeed, flightSpeed, swimSpeed = GetUnitSpeed(\"unit\");",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String (unitId) - Unit to query the speed of. This has not been tested with all units but does work for \"player\" units.",
            },
        },
        ["Desc"] = "Returns a value representing the moving speed of a unit. Added in Patch 3.0.1.",
    },
    ["IsOutOfBounds"] = {
        ["Desc"] = "Returns whether the player's character is currently outside of the map.",
        ["Format"] = "oob = IsOutOfBounds()",
    },
    ["BNGetFriendInfoByID"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "presenceID",
                ["Desc"] = "Number - A unique numeric identifier for the friend during this session.",
            },
            [2] = {
                ["Name"] = "presenceName",
                ["Desc"] = "String - An escape sequence (starting with |K) representing the friend's full name or BatteTag name.",
            },
            [3] = {
                ["Name"] = "battleTag",
                ["Desc"] = "String - A nickname and number that when combined, form a unique string that identifies the friend (e.g., \"Nickname#0001\").",
            },
            [4] = {
                ["Name"] = "isBattleTagPresence",
                ["Desc"] = "Boolean - Whether or not the friend is known by their BattleTag.",
            },
            [5] = {
                ["Name"] = "toonName",
                ["Desc"] = "String - The name of the logged in toon/character.",
            },
            [6] = {
                ["Name"] = "toonID",
                ["Desc"] = "Number - A unique numeric identifier for the friend's character during this session.",
            },
            [7] = {
                ["Name"] = "client",
                ["Desc"] = "String - Either \"WoW\" (BNET_CLIENT_WOW), \"S2\" (BNET_CLIENT_S2), \"D3\" (BNET_CLIENT_D3) or \"HS\" (BNET_CLIENT_WTCG) for World of Warcraft, StarCraft 2, Diablo 3 or Heartstone.",
            },
            [8] = {
                ["Name"] = "isOnline",
                ["Desc"] = "Boolean - Whether or not the friend is online.",
            },
            [9] = {
                ["Name"] = "lastOnline",
                ["Desc"] = "Number - The number of seconds elapsed since this friend was last online (from the epoch date of January 1, 1970). Returns nil if currently online.",
            },
            [10] = {
                ["Name"] = "isAFK",
                ["Desc"] = "Boolean - Whether or not the friend is flagged as Away.",
            },
            [11] = {
                ["Name"] = "isDND",
                ["Desc"] = "Boolean - Whether or not the friend is flagged as Busy.",
            },
            [12] = {
                ["Name"] = "broadcastText",
                ["Desc"] = "String - The friend's Battle.Net broadcast message.",
            },
            [13] = {
                ["Name"] = "noteText",
                ["Desc"] = "String - The contents of the player's note about this friend.",
            },
            [14] = {
                ["Name"] = "isRIDFriend",
                ["Desc"] = "Boolean - Returns true for RealID friends and false for BattleTag friends.",
            },
            [15] = {
                ["Name"] = "broadcastTime",
                ["Desc"] = "Number - The number of seconds elapsed since the current broadcast message was sent.",
            },
            [16] = {
                ["Name"] = "canSoR",
                ["Desc"] = "Boolean - Whether or not this friend can receive a Scroll of Resurrection.",
            },
        },
        ["Format"] = "presenceID, presenceName, battleTag, isBattleTagPresence, toonName, toonID, client, isOnline, lastOnline, isAFK, isDND, broadcastText, noteText, isRIDFriend, broadcastTime, canSoR = BNGetFriendInfo(friendIndex)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "presenceID",
                ["Desc"] = "number - a unique numeric identifier for this friend for the current session",
            },
        },
        ["Desc"] = "Returns information about the specified RealID friend",
    },
    ["GetQuestLogLeaderBoard"] = {
        ["Desc"] = "Returns information about a quest objective.",
        ["Format"] = "description, objectiveType, isCompleted = GetQuestLogLeaderBoard(i, [questIndex])",
    },
    ["CanSendAuctionQuery"] = {
        ["Desc"] = "Determine if a new auction house query can be sent (via QueryAuctionItems())",
        ["Format"] = "canQuery,canQueryAll = CanSendAuctionQuery()",
    },
    ["GetTrackedAchievements"] = {
        ["Desc"] = "Returns a list of (up to 10) currently tracked achievements.",
        ["Format"] = "id1, id2, ..., idn = GetTrackedAchievements()",
    },
    ["GuildSetMOTD"] = {
        ["Returns"] = "nil",
        ["Format"] = "GuildSetMOTD(\"message\")",
        ["Arguments"] = "\"message\": String - The message to set",
        ["Desc"] = "Sets the guild message of the day.",
    },
    ["ResetInstances"] = {
        ["Desc"] = "Resets all instances the currently playing character is associated with.",
        ["Format"] = "ResetInstances();",
    },
    ["GetAchievementInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "id",
                ["Desc"] = "Number - Achievement ID.",
            },
            [2] = {
                ["Name"] = "Name",
                ["Desc"] = "String - The Name of the Achievement.",
            },
            [3] = {
                ["Name"] = "Points",
                ["Desc"] = "Number - Points awarded for completing this achievement.",
            },
            [4] = {
                ["Name"] = "Completed",
                ["Desc"] = "Boolean - Returns true/false depending if you've completed this achievement on any character.",
            },
            [5] = {
                ["Name"] = "Month",
                ["Desc"] = "Number - Month this was completed. Returns nil if Completed is false.",
            },
            [6] = {
                ["Name"] = "Day",
                ["Desc"] = "Number - Day this was completed. Returns nil if Completed is false.",
            },
            [7] = {
                ["Name"] = "Year",
                ["Desc"] = "Number - Year this was completed. Returns nil if Completed is false. Returns number of years since 2000.",
            },
            [8] = {
                ["Name"] = "Description",
                ["Desc"] = "String - The Description of the Achievement.",
            },
            [9] = {
                ["Name"] = "Flags",
                ["Desc"] = {
                    [1] = {
                        ["Desc"] = "0x01 = Achievement is a statistic",
                    },
                    [2] = {
                        ["Desc"] = "0x02 = Achievement should be hidden",
                    },
                    [3] = {
                        ["Desc"] = "0x80 = Progress Bar",
                    },
                },
            },
        },
        ["Format"] = "IDNumber, Name, Points, Completed, Month, Day, Year, Description, Flags, Image, RewardText, IsGuild, WasEarnedByMe, EarnedBy = GetAchievementInfo(achievementID or categoryID, index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "achievementID",
                ["Desc"] = "Number - ID of the achievement to retrieve information for.",
            },
            [2] = {
                ["Name"] = "categoryID",
                ["Desc"] = "Number - Achievement category ID.",
            },
            [3] = {
                ["Name"] = "index",
                ["Desc"] = "Number - An offset into the achievement category, between 1 and GetCategoryNumAchievements(categoryID)",
            },
        },
        ["Desc"] = "Returns information about the given Achievement.",
    },
    ["GetHolidayBGHonorCurrencyBonuses"] = {
        ["Desc"] = "Returns additional rewards for completing a Call to Arms (holiday) battleground.",
        ["Format"] = "hasWin, winHonor, winArena, lossHonor, lossArena = GetHolidayBGHonorCurrencyBonuses()",
    },
    ["IsShiftKeyDown"] = {
        ["Desc"] = "There are three seperate levels of IsModifierKeyDown() type API functions but they all do the same basic function and return true if the specified key is currently pressed down.The first level is one function to tell you if any of the modifier keys are down IsModifierKeyDown()The second level is the three diferent functions one for each type of Modifier key: Shift, Alt &amp; CtrlThe third is one function for each seperate modifier key: Left Alt, Right Alt, Left Shift, Right Shift, Left Ctrl &amp; Right Ctrl.Is Any Modifier Key DownReturns whether ANY modifier key is currently pressed down.",
        ["Format"] = "anyModKeyIsDown = IsModifierKeyDown();",
    },
    ["UnitReaction"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "reaction",
                ["Desc"] = "Number - the level of the reaction of unit towards otherUnit - this is a number between 1 and 8.HatedHostileUnfriendlyNeutralFriendlyHonoredReveredExalted",
            },
            [2] = {
                ["Desc"] = "Values other than 2, 4 or 5 are only returned when the first unit is an NPC in a reputation faction and the second is you or your pet.",
            },
        },
        ["Format"] = "reaction = UnitReaction(\"unit\", \"otherUnit\");",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - The UnitId of the unit whose reaction is to be determined.",
            },
            [2] = {
                ["Name"] = "otherUnit",
                ["Desc"] = "String - The UnitId of the unit towards whom the reaction is to be measured.",
            },
        },
        ["Desc"] = "Determine the reaction of the specified unit to the other specified unit.",
    },
    ["CloseTrainer"] = {
        ["Returns"] = "nil",
        ["Format"] = "CloseTrainer()",
        ["Arguments"] = "none",
        ["Desc"] = "Closes the trainer window.",
    },
    ["PlaySoundFile"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "willPlay",
                ["Desc"] = "Flag - true if the sound will be played, nil otherwise (prevented by a muted sound channel, for instance).",
            },
            [2] = {
                ["Name"] = "soundHandle",
                ["Desc"] = "Number - identifier for the queued playback.",
            },
        },
        ["Format"] = "local willPlay, soundHandle = PlaySoundFile(\"path\"[, \"channel\"])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "path",
                ["Desc"] = "String – The path and name of the sound file you'd like to play, relative to the WoW directory; both ogg and mp3 formats are accepted. The file must exist prior to logging in to WoW.",
            },
            [2] = {
                ["Name"] = "channel",
                ["Desc"] = "String. Either \"Master\" (this will play the sound also with disabled sounds like before 4.0.1), \"SFX\", \"Ambience\", \"Music\".",
            },
        },
        ["Desc"] = "Plays the specified audio file once.",
    },
    ["GetPlayerFacing"] = {
        ["Desc"] = "Returns the direction the player character is currently facing.",
        ["Format"] = "facing = GetPlayerFacing()",
    },
    ["ItemTextGetCreator"] = {
        ["Returns"] = "creatorName",
        ["Format"] = "creatorName = ItemTextGetCreator()",
        ["Arguments"] = "()",
        ["Desc"] = "Get the creator of an item text.",
    },
    ["SetChannelOwner"] = {
        ["Desc"] = "Sets the channel owner.",
        ["Format"] = "SetChannelOwner(channel, newowner);",
    },
    ["GetMinimapZoneText"] = {
        ["Desc"] = "Returns the zone text, that is displayed over the minimap",
        ["Format"] = "zone = GetMinimapZoneText()",
    },
    ["GetTargetTradeMoney"] = {
        ["Desc"] = "Gets the amount of money in the trade window for the target user.",
        ["Format"] = "GetTargetTradeMoney();",
    },
    ["GetNumVoiceSessions"] = {
        ["Desc"] = "Returns the number of voice sessions the client is currently in. Ignores voice channels under the 'World' category.",
        ["Format"] = "num = GetNumVoiceSessions()",
    },
    ["CanViewOfficerNote"] = {
        ["Desc"] = "Checks if the player can view guild officer notes.",
        ["Format"] = "canView = CanViewOfficerNote()",
    },
    ["PetAbandon"] = {
        ["Desc"] = "Permanently abandons your pet.",
        ["Format"] = "PetAbandon();",
    },
    ["GetRefreshRates"] = {
        ["Desc"] = "Returns a list of available refresh rates",
        ["Format"] = "refreshrate1, refreshrate2, refreshrate3, ... = GetRefreshRates([resolution])",
    },
    ["AcceptGuild"] = {
        ["Desc"] = "Accepts a guild invitation.",
        ["Format"] = "AcceptGuild();",
    },
    ["MoveViewDownStart"] = {
        ["Returns"] = "Nothing",
        ["Format"] = "MoveViewDownStart(speed)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "speed",
                ["Desc"] = "Number - Speed at which to begin rotating.",
            },
        },
        ["Desc"] = "Begins rotating the camera Down around your Character.",
    },
    ["GetSocketItemRefundable"] = {
        ["Desc"] = "Returns whether the item currently selected for socketing can be refunded.",
        ["Format"] = "isRefundable = GetSocketItemRefundable()",
    },
    ["PickupEquipmentSet"] = {
        ["Desc"] = "Picks up an equipment set, placing it on the cursor.",
        ["Format"] = "PickupEquipmentSet(index);PickupEquipmentSetByName(\"name\");",
    },
    ["RequestBattlefieldScoreData"] = {
        ["Desc"] = "Requests the lastest battlefield score data from the server.",
        ["Format"] = "RequestBattlefieldScoreData()",
    },
    ["UnitCastingInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - The name of the spell, or nil if no spell is being cast.",
            },
            [2] = {
                ["Name"] = "nameSubtext",
                ["Desc"] = "String - The string describing additional properties of spell, used to contain rank, e.g. \"Rank 1\".",
            },
            [3] = {
                ["Name"] = "text",
                ["Desc"] = "String - The name to be displayed.",
            },
            [4] = {
                ["Name"] = "texture",
                ["Desc"] = "String - The texture path associated with the spell icon.",
            },
            [5] = {
                ["Name"] = "startTime",
                ["Desc"] = "Number - Specifies when casting has begun, in milliseconds.",
            },
            [6] = {
                ["Name"] = "endTime",
                ["Desc"] = "Number - Specifies when casting will end, in milliseconds.",
            },
            [7] = {
                ["Name"] = "isTradeSkill",
                ["Desc"] = "Boolean - Specifies if the cast is a tradeskill",
            },
            [8] = {
                ["Name"] = "castID",
                ["Desc"] = "Number - Counts the spellcast(s) since the game has loaded.(added either in or just before 3.2)",
            },
            [9] = {
                ["Name"] = "notInterruptible",
                ["Desc"] = "Boolean - if true, indicates that this cast cannot be interrupted with abilites like  [Kick] or  [Shield Bash]. In default UI those spells have shield frame around their icons on enemy cast bars.",
            },
        },
        ["Format"] = "name, nameSubtext, text, texture, startTime, endTime, isTradeSkill, castID, notInterruptible = UnitCastingInfo(\"unit\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - The unit to query (e.g. \"player\", \"party2\", \"pet\", \"target\" etc.)",
            },
        },
        ["Desc"] = "Returns information about the spell currently being cast by the specified unit.",
    },
    ["GetCoinText"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "formattedAmount",
                ["Desc"] = {
                    [1] = {
                        ["Desc"] = "String - a (presumably localized) string suitable for printing or displaying",
                    },
                },
            },
        },
        ["Format"] = "formattedAmount = GetCoinText(amount, \"separator\");",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "amount",
                ["Desc"] = {
                    [1] = {
                        ["Desc"] = "Integer - the amount of money in copper (for example, the return value from GetMoney)",
                    },
                },
            },
            [2] = {
                ["Name"] = "\"separator\"",
                ["Desc"] = {
                    [1] = {
                        ["Desc"] = "String - a string to insert between the formatted amounts of currency, if there is more than one type",
                    },
                },
            },
        },
        ["Desc"] = "Breaks down an amount of money into gold/silver/copper, inserts separator strings, and returns the resulting string.",
    },
    ["GuildRosterSetPublicNote"] = {
        ["Desc"] = "Sets the public note of a guild member.",
        ["Format"] = "GuildRosterSetPublicNote(index, \"Text\")",
    },
    ["MoveViewInStart"] = {
        ["Returns"] = "Nothing",
        ["Format"] = "MoveViewInStart(speed)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "speed",
                ["Desc"] = "Number - Speed at which to begin zooming.",
            },
        },
        ["Desc"] = "Begins zooming the camera In",
    },
    ["PutItemInBackpack"] = {
        ["Desc"] = "Places the item currently on the cursor into the player's backpack otherwise it has no effect. If there is already a partial stack of the item in the backpack, it will attempt to stack them together.",
        ["Format"] = "PutItemInBackpack();",
    },
    ["GetAddOnDependencies"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "dep1, dep2, dep3, ...",
                ["Desc"] = "String - Name of an addon the specified addon lists as a required dependency.",
            },
        },
        ["Format"] = "dep1, dep2, dep3, ... = GetAddOnDependencies(index or \"name\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - The index of the AddOn in the user's AddOn list. Note that you cannot access Blizzard-provided AddOns through this mechanism.",
            },
            [2] = {
                ["Name"] = "name",
                ["Desc"] = "String - The name of the AddOn to be queries. You can access Blizzard-provided AddOns through this mechanism.",
            },
        },
        ["Desc"] = "Get the required dependencies for an AddOn.",
    },
    ["GetQuestLogItemLink"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "itemLink",
                ["Desc"] = "String - The link to the quest item specified",
            },
            [2] = {
                ["Desc"] = "or nil, if the type and/or index is invalid, there is no active quest at the moment or if the server did not transmit the item information until the timeout (which can happen, if the item is not in the local item cache yet)",
            },
        },
        ["Format"] = "",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "type",
                ["Desc"] = "String - \"required\", \"reward\" or \"choice\"",
            },
            [2] = {
                ["Name"] = "index",
                ["Desc"] = "Table - Integer - Quest reward item index (starts with 1).",
            },
        },
        ["Desc"] = "",
    },
    ["NotWhileDeadError"] = {
        ["Desc"] = "Generates an error message saying you cannot do that while dead.",
        ["Format"] = "NotWhileDeadError()",
    },
    ["GetPVPLifetimeStats"] = {
        ["Returns"] = "(honorableKills, dishonorableKills, highestRank)",
        ["Format"] = "honorableKills, dishonorableKills, highestRank = GetPVPLifetimeStats()",
        ["Arguments"] = "none",
        ["Desc"] = "Gets the statistics about your lifetime PVP contributions.",
    },
    ["UnitHasLFGRandomCooldown"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "hasRandomCooldown",
                ["Desc"] = "Boolean - true if the unit is currently unable to queue for random dungeons due to the random cooldown, false otherwise.",
            },
        },
        ["Format"] = "hasRandomCooldown = UnitHasLFGRandomCooldown(\"unit\");",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String (UnitId) - unit you wish to query, e.g. \"player\".",
            },
        },
        ["Desc"] = "Returns whether the unit is currently under the effects of the random dungeon cooldown.",
    },
    ["CameraZoomOut"] = {
        ["Returns"] = "nil",
        ["Format"] = "CameraZoomOut(increment)",
        ["Arguments"] = "(float increment)",
        ["Desc"] = "Zooms the camera out of the viewplane",
    },
    ["GetNumAutoQuestPopUps"] = {
        ["Desc"] = "Returns the number of popup quest notifications being shown.",
        ["Format"] = "numPopups = GetNumAutoQuestPopUps()",
    },
    ["GetSelectedFriend"] = {
        ["Desc"] = "Returns the index of the currently selected friend.",
        ["Format"] = "friendIndex = GetSelectedFriend()",
    },
    ["IsLinuxClient"] = {
        ["Desc"] = "This is a boolean function which returns true if World of Warcraft is being run using the Linux client, it will return false with the Windows client under wine or OS X client run on other operating systems. Although there is no current official Linux client, the beta version of WoW had a Linux client, and the code retains a function to test for it.eg",
        ["Format"] = "if IsLinuxClient() then s = \"./myfile.xml\"else s = \"myfile.xml\"end",
    },
    ["GetProfessions"] = {
        ["Desc"] = "Returns spell tab indices of the player's current professions",
        ["Format"] = "prof1, prof2, archaeology, fishing, cooking, firstAid = GetProfessions()",
    },
    ["SetSelectedFriend"] = {
        ["Returns"] = "nil",
        ["Format"] = "SetSelectedFriend(friendIndex)",
        ["Arguments"] = "(friendIndex)",
        ["Desc"] = "Update the current selected friend",
    },
    ["DeclineLevelGrant"] = {
        ["Desc"] = "Declines a recruit-a-friend level grant proposal.",
        ["Format"] = "DeclineLevelGrant();",
    },
    ["LeaveChannelByName"] = {
        ["Desc"] = "Leaves the channel with the specified name.",
        ["Format"] = "LeaveChannelByName(channelName);",
    },
    ["GetTradeSkillNumMade"] = {
        ["Returns"] = "minMade, maxMade",
        ["Format"] = "minMade, maxMade = GetTradeSkillNumMade(skillId)",
        ["Arguments"] = "(skillId)",
        ["Desc"] = "Get the number of items made in each use of a tradeskill.",
    },
    ["UnitRangedAttack"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "base",
                ["Desc"] = "Number - The unit's base ranged attack number (0 if no ranged weapon is equipped)",
            },
            [2] = {
                ["Name"] = "modifier",
                ["Desc"] = "Number - The total effect of all modifiers (positive and negative) to ranged attack.",
            },
        },
        ["Format"] = "base, modifier = UnitRangedAttack(\"unit\");",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - The UnitId to get information from. (Likely only works for \"player\" and \"pet\")",
            },
        },
        ["Desc"] = "Returns the unit's ranged attack and modifier.",
    },
    ["GetGossipAvailableQuests"] = {
        ["Desc"] = "Returns a list of available quests from an NPC.",
        ["Format"] = "title1, level1, isLowLevel1, isDaily1, isRepeatable1, isLegendary1, ... = GetGossipAvailableQuests()",
    },
    ["GetCategoryNumAchievements"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "total",
                ["Desc"] = "Number - total number of achievements in the specified category.",
            },
            [2] = {
                ["Name"] = "completed",
                ["Desc"] = "Number - number of completed achievements in the specified category.",
            },
            [3] = {
                ["Name"] = "incompleted",
                ["Desc"] = "Number - number of incompleted achievements in the specified category.",
            },
        },
        ["Format"] = "total, completed, incompleted = GetCategoryNumAchievements(categoryId[, includeAll])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "categoryId",
                ["Desc"] = "Number - Achievement category ID, as returned by GetCategoryList.",
            },
            [2] = {
                ["Name"] = "includeAll",
                ["Desc"] = "Boolean - If true-equivalent, include all achievements, otherwise, only includes those currently visible",
            },
        },
        ["Desc"] = "Returns the total, completed and incompleted number of achievements in a specific category.",
    },
    ["HasInspectHonorData"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "hasData",
                ["Desc"] = "Boolean - Whether the currently inspected unit's honor data has been loaded.",
            },
        },
        ["Format"] = "hasData = HasInspectHonorData()",
        ["Arguments"] = "none",
        ["Desc"] = "Determine if the inspected unit's honor data has been loaded.",
    },
    ["GetItemIcon"] = {
        ["Returns"] = "\"itemIcon\"",
        ["Format"] = "itemIcon = GetItemIcon(itemID)",
        ["Arguments"] = "(itemID)",
        ["Desc"] = "Return the icon texture for the item.",
    },
    ["GetPlayerInfoByGUID"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "className",
                ["Desc"] = "String - Localized class name, suitable for use in user interfaces.",
            },
            [2] = {
                ["Name"] = "classId",
                ["Desc"] = "String - Localization-independent class ID, suitable for use as table keys.",
            },
            [3] = {
                ["Name"] = "raceName",
                ["Desc"] = "String - Localized race name, suitable for use in user interfaces.",
            },
            [4] = {
                ["Name"] = "raceId",
                ["Desc"] = "String - Localization-independent race ID, suitable for use as table keys.",
            },
            [5] = {
                ["Name"] = "gender",
                ["Desc"] = "String - Gender ID of the character, as a number. 2 for male, or 3 for female.",
            },
            [6] = {
                ["Name"] = "name",
                ["Desc"] = "String - Full name of the specified character. The realm is appended with a dash if it differs from the player's.",
            },
            [7] = {
                ["Name"] = "realm",
                ["Desc"] = "String - Realm of the character in question. The empty string \"\" is returned if the specified character is from the same realm as the player.",
            },
        },
        ["Format"] = "className, classId, raceName, raceId, gender, name, realm = GetPlayerInfoByGUID(\"guid\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "guid",
                ["Desc"] = "String (GUID) - The GUID of the player you're querying about.",
            },
        },
        ["Desc"] = "Returns basic information about another player from their GUID.",
    },
    ["RemoveFriend"] = {
        ["Returns"] = "nil",
        ["Format"] = "RemoveFriend(friendIndex or \"friendName\")",
        ["Arguments"] = "(friendIndex or \"friendName\")",
        ["Desc"] = "Remove a friend from the friends list.",
    },
    ["CanUseVoidStorage"] = {
        ["Desc"] = "Returns if the player has access to the Void Storage [1]",
        ["Format"] = "canUse = CanUseVoidStorage()",
    },
    ["CalendarEventGetNumInvites"] = {
        ["Desc"] = "Retrieves the number of invitees for the current event.",
        ["Format"] = "inviteCount, namesReady = CalendarEventGetNumInvites()",
    },
    ["GetRaidTargetIndex"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "icon",
                ["Desc"] = {
                    [1] = {
                        ["Desc"] = "nil = no icon",
                    },
                    [2] = {
                        ["Desc"] = "1 = Yellow 4-point Star",
                    },
                    [3] = {
                        ["Desc"] = "2 = Orange Circle",
                    },
                    [4] = {
                        ["Desc"] = "3 = Purple Diamond",
                    },
                    [5] = {
                        ["Desc"] = "4 = Green Triangle",
                    },
                    [6] = {
                        ["Desc"] = "5 = White Crescent Moon",
                    },
                    [7] = {
                        ["Desc"] = "6 = Blue Square",
                    },
                    [8] = {
                        ["Desc"] = "7 = Red \"X\" Cross",
                    },
                    [9] = {
                        ["Desc"] = "8 = White Skull",
                    },
                    [10] = {
                        ["Desc"] = "9 - 18 = Invisible icons",
                    },
                },
            },
        },
        ["Format"] = "icon = GetRaidTargetIndex(\"unit\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - unitId to query.",
            },
        },
        ["Desc"] = "Returns the raid target index assigned to a unit.",
    },
    ["GetNumTalents"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "numTalents",
                ["Desc"] = "Number - Maximum talent slot index for the queried unit, i.e. always 18 in Mists of Pandaria.",
            },
        },
        ["Format"] = "numTalents = GetNumTalents(inspect);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "inspect",
                ["Desc"] = "Boolean - If true, returns information for the inspected unit; otherwise, returns information for the player character.",
            },
        },
        ["Desc"] = "Returns the maximum talent slot index (optionally for an inspected player).",
    },
    ["GetQuestLogSelection"] = {
        ["Desc"] = "Returns a number associated with the QuestLogSelection index.",
        ["Format"] = "questSelected = GetQuestLogSelection()",
    },
    ["AcceptQuest"] = {
        ["Desc"] = "Accepts the currently offered quest.",
        ["Format"] = "AcceptQuest()",
    },
    ["GetSourceReforgeStats"] = {
        ["Desc"] = "Returns the reforge item's source stats, which can be used to reforge into another (dest) stat [1] [2]",
        ["Format"] = "stats = {GetSourceReforgeStats()}",
    },
    ["SetCurrencyUnused"] = {
        ["Desc"] = "Marks/unmarks a currency as unused.",
        ["Format"] = "SetCurrencyUnused(id, unused)",
    },
    ["CheckInbox"] = {
        ["Desc"] = "Populates client's inbox with messages.",
        ["Format"] = "CheckInbox();",
    },
    ["DelIgnore"] = {
        ["Desc"] = "Remove a player from your ignore list.",
        ["Format"] = "DelIgnore(playerName);",
    },
    ["GuildLeave"] = {
        ["Returns"] = "nil",
        ["Format"] = "GuildLeave()",
        ["Arguments"] = "none",
        ["Desc"] = "Removes you from your current guild.",
    },
    ["GetChatTypeIndex"] = {
        ["Returns"] = "typeIndex",
        ["Format"] = "typeIndex = GetChatTypeIndex(\"typeCode\")",
        ["Arguments"] = "(\"typeCode\")",
        ["Desc"] = "Return the numeric type index for a specific chat type.",
    },
    ["IsGlyphFlagSet"] = {
        ["Desc"] = "Returns the information about glyphs",
        ["Format"] = "flag = IsGlyphFlagSet(filter)",
    },
    ["KBSetup_GetSubCategoryCount"] = {
        ["Returns"] = "count",
        ["Format"] = "count = KBSetup_GetSubCategoryCount(category)",
        ["Arguments"] = "(category)",
        ["Desc"] = "Returns the number of subcategories in a category.",
    },
    ["PromoteToLeader"] = {
        ["Returns"] = "nil",
        ["Format"] = "PromoteToLeader(unitId or playerName)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unitId",
                ["Desc"] = "UnitId - The unit to promote.",
            },
            [2] = {
                ["Name"] = "playername",
                ["Desc"] = "PlayerName - The full name of the player to promote.",
            },
        },
        ["Desc"] = "Promotes a unit to party leader.",
    },
    ["UnitIsUnit"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isSame",
                ["Desc"] = "Boolean - 1 if the two units are the same entity, nil otherwise.",
            },
        },
        ["Format"] = "isSame = UnitIsUnit(unit1, unit2);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit1",
                ["Desc"] = "UnitId - The first unit to query (e.g. \"party1\", \"pet\", \"player\")",
            },
            [2] = {
                ["Name"] = "unit2",
                ["Desc"] = "UnitId - The second unit to compare it to (e.g. \"target\")",
            },
        },
        ["Desc"] = "Returns true if the two specified units are the same, false otherwise.",
    },
    ["SpellCanTargetUnit"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "canTarget",
                ["Desc"] = "Boolean - Whether the spell can target the given unit.",
            },
        },
        ["Format"] = "canTarget = SpellCanTargetUnit(unitId)",
        ["Arguments"] = "unitId: UnitId - The unit to check.",
        ["Desc"] = "Checks if the spell awaiting target selection can be cast on a specified unit.",
    },
    ["GetGMTicketCategories"] = {
        ["Desc"] = "Get the list of available GM ticket categories.",
        ["Format"] = "category1, category2, ... = GetGMTicketCategories()",
    },
    ["GetMouseFocus"] = {
        ["Desc"] = "Returns the frame that is currently receiving mouse events. The frame must have enableMouse=\"true\"",
        ["Format"] = "frameID = GetMouseFocus();",
    },
    ["PetRename"] = {
        ["Returns"] = "nil",
        ["Format"] = "PetRename(\"name\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - The new name of the pet",
            },
        },
        ["Desc"] = "Renames your pet.",
    },
    ["GetSpecializationInfoForClassID"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "id",
                ["Desc"] = "Number - specialization ID.",
            },
            [2] = {
                ["Name"] = "name",
                ["Desc"] = "String - specialization name, e.g. \"Balance\".",
            },
            [3] = {
                ["Name"] = "description",
                ["Desc"] = "String - description of the specialization, e.g. \"Can take on the form of a powerful Moonkin, balancing the power of Arcane and Nature magic to destroy enemies at a distance.\"",
            },
            [4] = {
                ["Name"] = "icon",
                ["Desc"] = "String - Texture path to this specialization's icon.",
            },
            [5] = {
                ["Name"] = "background",
                ["Desc"] = "String - Background texture name for this talent tree; prepend \"Interface\\TALENTFRAME\\\" to this value for a valid texture path.",
            },
            [6] = {
                ["Name"] = "role",
                ["Desc"] = "String - This specialization's intended role in a party, one of \"DAMAGER\", \"TANK\", \"HEALER\".",
            },
        },
        ["Format"] = "id, name, description, icon, background, role = GetSpecializationInfoForClassID(classID, specNum)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "classID",
                ["Desc"] = "Number - The ClassId of the class to which this specialization belongs, going from 1 to GetNumClasses().",
            },
            [2] = {
                ["Name"] = "specNum",
                ["Desc"] = "Number - The number of the specialization to query, going from 1 to GetNumSpecializationsForClassID(classID).",
            },
        },
        ["Desc"] = "Returns information about the specified specialization.",
    },
    ["GetFramesRegisteredForEvent"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "frame1, ...",
                ["Desc"] = "Widget - widget registered for the specified event.",
            },
        },
        ["Format"] = "frame1, frame2, ... = GetFramesRegisteredForEvent(\"event\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "event",
                ["Desc"] = "String - Event for which to return registered frames, e.g. \"PLAYER_LOGOUT\"",
            },
        },
        ["Desc"] = "Returns all frames registered for the specified event, in dispatch order.",
    },
    ["GetBattlefieldTeamInfo"] = {
        ["Returns"] = "teamName, oldTeamRating, newTeamRating",
        ["Format"] = "teamName, oldTeamRating, newTeamRating, teamRating = GetBattlefieldTeamInfo( index );",
        ["Arguments"] = "( index )",
        ["Desc"] = "Returns information regarding an Arena team",
    },
    ["IsTrialAccount"] = {
        ["Desc"] = "Returns whether the player is using a trial (free-to-play) account.",
        ["Format"] = "isTrial = IsTrialAccount()",
    },
    ["RemoveQuestWatch"] = {
        ["Returns"] = "None",
        ["Format"] = "RemoveQuestWatch(questIndex)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "questIndex",
                ["Desc"] = "Number - The index of the quest in the quest log.",
            },
        },
        ["Desc"] = "Removes a quest from being watched.",
    },
    ["GetTrainerServiceCost"] = {
        ["Desc"] = "Returns the cost of the selected trainer service.",
        ["Format"] = "local moneyCost, talentCost, professionCost = GetTrainerServiceCost(index);",
    },
    ["RestartGx"] = {
        ["Desc"] = "Requests the graphics engine to restart.",
        ["Format"] = "RestartGx()",
    },
    ["GetContainerNumSlots"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "numberOfSlots",
                ["Desc"] = {
                    [1] = {
                        ["Desc"] = "Integer - the number of slots in the specified bag, or 0 if there is no bag in the given slot.",
                    },
                },
            },
        },
        ["Format"] = "numberOfSlots = GetContainerNumSlots(bagID);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "bagID",
                ["Desc"] = {
                    [1] = {
                        ["Desc"] = "Integer - the slot containing the bag, e.g. 0 for backpack, etc.",
                    },
                },
            },
        },
        ["Desc"] = "Returns the total number of slots in the bag specified by the index.",
    },
    ["GetCurrentBindingSet"] = {
        ["Desc"] = "Returns whether account- or character-specific bindings are active.",
        ["Format"] = "which = GetCurrentBindingSet()",
    },
    ["GetExpertise"] = {
        ["Desc"] = "Returns the player's expertise percentage for main hand, offhand and ranged attacks.",
        ["Format"] = "expertise, offhandExpertise, rangedExpertise = GetExpertise();",
    },
    ["GuildRoster"] = {
        ["Desc"] = "Requests updated guild roster information from the server.",
        ["Format"] = "GuildRoster()",
    },
    ["GetRFDungeonInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "id",
                ["Desc"] = "Number - Dungeon Id",
            },
            [2] = {
                ["Name"] = "name",
                ["Desc"] = "String - Dungeon Name",
            },
            [3] = {
                ["Name"] = "typeID",
                ["Desc"] = "Number -?",
            },
            [4] = {
                ["Name"] = "subtypeID",
                ["Desc"] = "Number -?",
            },
            [5] = {
                ["Name"] = "minLevel",
                ["Desc"] = "Number -",
            },
            [6] = {
                ["Name"] = "maxLevel",
                ["Desc"] = "Number -",
            },
            [7] = {
                ["Name"] = "recLevel",
                ["Desc"] = "Number -",
            },
            [8] = {
                ["Name"] = "minRecLevel",
                ["Desc"] = "Number -",
            },
            [9] = {
                ["Name"] = "maxRecLevel",
                ["Desc"] = "Number -",
            },
            [10] = {
                ["Name"] = "expansionLevel",
                ["Desc"] = "Number - Expansion Level",
            },
            [11] = {
                ["Name"] = "groupID",
                ["Desc"] = "Number -?",
            },
            [12] = {
                ["Name"] = "textureFilename",
                ["Desc"] = "String - Texture name",
            },
            [13] = {
                ["Name"] = "difficulty",
                ["Desc"] = "Number -? [2]",
            },
            [14] = {
                ["Name"] = "maxPlayers",
                ["Desc"] = "Number - Max allowed players",
            },
            [15] = {
                ["Name"] = "description",
                ["Desc"] = "String - Dungeon description",
            },
            [16] = {
                ["Name"] = "isHoliday",
                ["Desc"] = "Boolean - If the dungeon is set for a holiday event",
            },
        },
        ["Format"] = "id, name, typeID, subtypeID, minLevel, maxLevel, recLevel, minRecLevel, maxRecLevel, expansionLevel, groupID, textureFilename, difficulty, maxPlayers, description, isHoliday = GetRFDungeonInfo(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - Dungeon Index",
            },
        },
        ["Desc"] = "Returns info about the Raid Finder dungeon index [1]",
    },
    ["GetQuestItemInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - Item name.",
            },
            [2] = {
                ["Name"] = "texture",
                ["Desc"] = "String - Item icon texture.",
            },
            [3] = {
                ["Name"] = "count",
                ["Desc"] = "Number - amount of the item required or awarded by the quest.",
            },
            [4] = {
                ["Name"] = "quality",
                ["Desc"] = "Number - Item quality.",
            },
            [5] = {
                ["Name"] = "isUsable",
                ["Desc"] = "Flag - 1 if the quest item is usable by the current player, nil otherwise.",
            },
        },
        ["Format"] = "name, texture, count, quality, isUsable = GetQuestItemInfo(\"type\", index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "type",
                ["Desc"] = "String - type of the item to query. One of the following values:\"required\": Items the quest requires the player to gather.\"reward\": Unconditional quest rewards.\"choice\": One of the possible quest rewards.",
            },
        },
        ["Desc"] = "Returns information about a quest's item rewards or requirements.",
    },
    ["ApplyTransmogrifications"] = {
        ["Returns"] = "none",
        ["Format"] = "ApplyTransmogrifications()",
        ["Arguments"] = "none",
        ["Desc"] = "Applies all pending transmogrifications, and pays for the cost [1]",
    },
    ["GetSocketItemInfo"] = {
        ["Desc"] = "Returns various information about the inventory item currently being socketed (i.e. socket UI is open for the item).",
        ["Format"] = "itemName, iconPathName, itemQuality = GetSocketItemInfo()",
    },
    ["GetComboPoints"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "comboPoints",
                ["Desc"] = "Number - Number of combo points unit has on target; between 0 and 5 inclusive.",
            },
        },
        ["Format"] = "comboPoints = GetComboPoints(\"unit\", \"target\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String (unitId) - Either \"player\" or \"vehicle\". (More strings/UnitIds may be possible but have not been seen in Blizzard code.)",
            },
            [2] = {
                ["Name"] = "target",
                ["Desc"] = "String (unitId) - Normally \"target\", but can be any valid UnitId.",
            },
        },
        ["Desc"] = "Retrieves the number of combo points gained by a player.",
    },
    ["UnitPlayerOrPetInParty"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "inMyParty",
                ["Desc"] = "Flag - 1 if the unit is another player or another player's pet in your party, nil otherwise.",
            },
        },
        ["Format"] = "inMyParty = UnitPlayerOrPetInParty(\"unit\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String (unitId) - Unit to check for party membership.",
            },
        },
        ["Desc"] = "Returns whether a unit is another player in your party or the pet of another player in your party.",
    },
    ["GetBattlefieldStatData"] = {
        ["Desc"] = "Get data from the custom battlefield scoreboard columns",
        ["Format"] = "GetBattlefieldStatData(playerIndex,slotIndex)",
    },
    ["GetActionInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "actionType",
                ["Desc"] = "String - Type of action button. (e.g. spell, item, macro, companion, equipmentset)",
            },
            [2] = {
                ["Name"] = "id",
                ["Desc"] = "Mixed - Appropriate identifier for the action specified by actionType -- e.g. spell IDs for spells, item IDs for items, equipment set names for equipment sets.",
            },
            [3] = {
                ["Name"] = "subType",
                ["Desc"] = "Mixed - Additional identifier for the action specified by actionType -- e.g. whether the companion ID is for a MOUNT or a CRITTER companion.",
            },
        },
        ["Format"] = "actionType, id, subType = GetActionInfo(slot)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "slot",
                ["Desc"] = "Number - Action slot to retrieve information about.",
            },
        },
        ["Desc"] = "Returns information about a specific action.",
    },
    ["GetAddOnMetadata"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "value",
                ["Desc"] = "String - The value of the field, nil if not defined.",
            },
        },
        ["Format"] = "value = GetAddOnMetadata(\"addon\", \"field\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "addon",
                ["Desc"] = "String - Addon name to look up metadata for",
            },
            [2] = {
                ["Name"] = "field",
                ["Desc"] = "String - Field name. May be Title, Notes, Author, Version, or anything starting with X-",
            },
        },
        ["Desc"] = "Returns addon metadata.",
    },
    ["CanGrantLevel"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "status",
                ["Desc"] = "Flag - true if you can grant levels to the unit; nil otherwise (unit is not RAF-linked to you, does not meet level requirements, or you are out of levels to grant).",
            },
        },
        ["Format"] = "status = CanGrantLevel(\"unit\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String (UnitId) - unit to check level grant eligibility of.",
            },
        },
        ["Desc"] = "Returns whether you can grant levels to a particular player.",
    },
    ["GetContainerItemDurability"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "current",
                ["Desc"] = "Number - current durability value.",
            },
            [2] = {
                ["Name"] = "maximum",
                ["Desc"] = "Number - maximum durability value.",
            },
        },
        ["Format"] = "current, maximum = GetContainerItemDurability(bag, slot);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "bag",
                ["Desc"] = "Number - Index of the bag slot the bag storing the item is in.",
            },
            [2] = {
                ["Name"] = "slot",
                ["Desc"] = "Number - Index of the bag slot containing the item to query durability of.",
            },
        },
        ["Desc"] = "Returns current and maximum durability of an item in the character's bags.",
    },
    ["ResetTutorials"] = {
        ["Desc"] = "Starts with the first tutorial again",
        ["Format"] = "ResetTutorials()",
    },
    ["UnitInRange"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "inRange",
                ["Desc"] = "Boolean - true if the unit is within ~40 yards of the player, false otherwise",
            },
            [2] = {
                ["Name"] = "checkedRange",
                ["Desc"] = "Boolean - true if a range check was actually performed; false if the information about distance to the queried unit is unavailable.",
            },
        },
        ["Format"] = "inRange, checkedRange = UnitInRange(\"unit\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String (unitId) - unit to query; information is only available for members of the player's group.",
            },
        },
        ["Desc"] = "Returns whether a unit is close to the player.",
    },
    ["KBSystem_GetMOTD"] = {
        ["Returns"] = "motd",
        ["Format"] = "motd = KBSystem_GetMOTD()",
        ["Arguments"] = "()",
        ["Desc"] = "Returns the server message of the day.",
    },
    ["ChannelKick"] = {
        ["Desc"] = "Kicks a player from the specified channel.",
        ["Format"] = "ChannelKick(channelName, playerName);",
    },
    ["GuildControlGetRankFlags"] = {
        ["Desc"] = "Returns information about the current selected guild rank. If no rank has been selected and the guild frame hasn't been opened the function will return nil for all flags.",
        ["Format"] = "guildchat_listen, guildchat_speak, officerchat_listen, officerchat_speak, promote, demote, invite_member, remove_member, set_motd, edit_public_note, view_officer_note, edit_officer_note, modify_guild_info, _, withdraw_repair, withdraw_gold, create_guild_event, authenticator, modify_bank_tabs, remove_guild_event = GuildControlGetRankFlags()",
    },
    ["GetSpellBonusDamage"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "spellDmg",
                ["Desc"] = "Integer - The raw spell damage bonus of the player for that spell tree",
            },
        },
        ["Format"] = "spellDmg = GetSpellBonusDamage(spellTreeID);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "spellTreeID",
                ["Desc"] = "Integer - the spell tree:1 for Physical2 for Holy3 for Fire4 for Nature5 for Frost6 for Shadow7 for Arcane",
            },
        },
        ["Desc"] = "Returns the raw spell damage bonus of the player for a given spell tree.",
    },
    ["AddFriend"] = {
        ["Desc"] = "Add a friend to your friend list.",
        ["Format"] = "AddFriend(\"playerName\")",
    },
    ["GetTradeSkillLine"] = {
        ["Desc"] = "Returns information about the current tradeskill.",
        ["Format"] = "tradeskillName, currentLevel, maxLevel, skillLineModifier = GetTradeSkillLine();",
    },
    ["KBSetup_BeginLoading"] = {
        ["Returns"] = "nil",
        ["Format"] = "KBSetup_BeginLoading(articlesPerPage, currentPage)",
        ["Arguments"] = "(articlesPerPage, currentPage)",
        ["Desc"] = "Starts the loading of articles.",
    },
    ["CloseTrade"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["KBSetup_GetLanguageData"] = {
        ["Returns"] = "id, caption",
        ["Format"] = "id, caption = KBSetup_GetLanguageData(index)",
        ["Arguments"] = "(index)",
        ["Desc"] = "Returns information about a language.",
    },
    ["IsResting"] = {
        ["Desc"] = "Checks to see if Player is resting.",
        ["Format"] = "resting = IsResting();",
    },
    ["CanShowResetInstances"] = {
        ["Desc"] = "Returns whether or not the player is allowed to reset instances at the moment.",
        ["Format"] = "canReset = CanShowResetInstances()",
    },
    ["CloseGossip"] = {
        ["Desc"] = "Dismiss the gossip dialog.",
        ["Format"] = "CloseGossip()",
    },
    ["GetNumTradeSkills"] = {
        ["Returns"] = "numSkills",
        ["Format"] = "numSkills = GetNumTradeSkills()",
        ["Arguments"] = "()",
        ["Desc"] = "Get the number of trade skill entries (including headers)",
    },
    ["SearchLFGGetPartyResults"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - Name of the player.",
            },
            [2] = {
                ["Name"] = "level",
                ["Desc"] = "Number - Player level.",
            },
            [3] = {
                ["Name"] = "areaName",
                ["Desc"] = "String - Player's area.",
            },
            [4] = {
                ["Name"] = "comment",
                ["Desc"] = "String - Player's custom comment.",
            },
            [5] = {
                ["Name"] = "bossKills",
                ["Desc"] = "Number - Sum of all boss kills on normal mode",
            },
            [6] = {
                ["Name"] = "gearRating",
                ["Desc"] = "Number - Some weird value only blizzard has clue about",
            },
        },
        ["Format"] = "local name, level, relationship, className, areaName, comment, isLeader, isTank, isHealer, isDamage, bossKills, specID, isGroupLeader, armor, spellDamage, plusHealing, CritMelee, CritRanged, critSpell, mp5, mp5Combat, attackPower, agility, maxHealth, maxMana, gearRating, avgILevel, defenseRating, dodgeRating, BlockRating, ParryRating, HasteRating, expertise = SearchLFGGetPartyResults(index, partyIndex);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - Index of the player to query, ascending from 1 to totalResults return value from SearchLFGGetNumResults.",
            },
            [2] = {
                ["Name"] = "partyIndex",
                ["Desc"] = "Number - Index of the party player to query, ascending from 1 to partyMembers return value from SearchLFGGetResults.",
            },
        },
        ["Desc"] = "Returns information about the party player listed in raid browser.",
    },
    ["GetAuctionItemClasses"] = {
        ["Desc"] = "Gets a list of the Auction House item classes.",
        ["Format"] = "class1, class2, class3, ... = GetAuctionItemClasses()",
    },
    ["GetSelectedArtifactInfo"] = {
        ["Desc"] = "Returns the information for the selected race's current artifact.",
        ["Format"] = "artifactName, artifactDescription, artifactRarity, artifactIcon, hoverDescription, keystoneCount, bgTexture, firstCompletionTime, completionCount = GetSelectedArtifactInfo();",
    },
    ["AddChatWindowMessages"] = {
        ["Desc"] = "Sets a chat frame to receive and show messages of the given message group.",
        ["Format"] = "AddChatWindowMessages(index, \"messagegroup\")",
    },
    ["GetMirrorTimerProgress"] = {
        ["Desc"] = "Returns the current value of a mirror timer (fatigue, breath, feign death etc).",
        ["Format"] = "value = GetMirrorTimerProgress(\"timer\")",
    },
    ["CalendarGetDayEvent"] = {
        ["Returns"] = "title, hour, minute, calendarType, sequenceType, eventType, texture, modStatus, inviteStatus",
        ["Format"] = "title, hour, minute, calendarType, sequenceType, eventType, texture, modStatus, inviteStatus, invitedBy, difficulty, inviteType, sequenceIndex, numSequenceDayss = CalendarGetDayEvent(monthOffset, day, eventIndex)",
        ["Arguments"] = "(monthOffset, day, eventIndex)",
        ["Desc"] = "Retrieve information about the specified event.",
    },
    ["GetTrainerServiceItemLink"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "link",
                ["Desc"] = "itemLink - The item link for the given trainer service.",
            },
        },
        ["Format"] = "local link = GetTrainerServiceItemLink(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - Index of the trainer service to a link for. Note that indices are affected by the trainer filter. (See GetTrainerServiceTypeFilter and SetTrainerServiceTypeFilter.)",
            },
        },
        ["Desc"] = "Returns an item link for a trainer service.",
    },
    ["PlaySound"] = {
        ["Format"] = "willPlay, soundHandle = PlaySound(\"SoundName\", \"channel\");",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "SoundName",
                ["Desc"] = "String - One of the below sound names (not all these actually make a sound)",
            },
        },
        ["Desc"] = "Play one of a set of built-in sounds. Other players will not hear the sound.",
    },
    ["AcceptDuel"] = {
        ["Desc"] = "Accept the challenge to a duel.",
        ["Format"] = "AcceptDuel()",
    },
    ["GetVoidTransferCost"] = {
        ["Desc"] = "Returns the total Void Transfer cost [1]",
        ["Format"] = "cost = GetVoidTransferCost()",
    },
    ["BNGetToonInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "hasFocus",
                ["Desc"] = "Boolean - Whether or not this toon is the one currently being displayed in Blizzard's FriendFrame.",
            },
            [2] = {
                ["Name"] = "toonName",
                ["Desc"] = "String - The name of the logged in toon/character.",
            },
            [3] = {
                ["Name"] = "client",
                ["Desc"] = "String - Either \"WoW\" (BNET_CLIENT_WOW), \"S2\" (BNET_CLIENT_S2), or \"D3\" (BNET_CLIENT_D3) for World of Warcraft, StarCraft 2, or Diablo 3.",
            },
            [4] = {
                ["Name"] = "realmName",
                ["Desc"] = "String - The name of the logged in realm.",
            },
            [5] = {
                ["Name"] = "realmID",
                ["Desc"] = "Number - The ID for the logged in realm.",
            },
            [6] = {
                ["Name"] = "faction",
                ["Desc"] = "String - The faction name (i.e., \"Alliance\" or \"Horde\").",
            },
            [7] = {
                ["Name"] = "race",
                ["Desc"] = "String - The localized race name (e.g., \"Blood Elf\").",
            },
            [8] = {
                ["Name"] = "class",
                ["Desc"] = "String - The localized class name (e.g., \"Death Knight\").",
            },
            [9] = {
                ["Name"] = "guild",
                ["Desc"] = "String - Seems to return \"\" even if the player is in a guild.",
            },
            [10] = {
                ["Name"] = "zoneName",
                ["Desc"] = "String - The localized zone name (e.g., \"The Undercity\").",
            },
            [11] = {
                ["Name"] = "level",
                ["Desc"] = "String - The current level (e.g., \"90\").",
            },
            [12] = {
                ["Name"] = "gameText",
                ["Desc"] = "String - For WoW, returns \"zoneName - realmName\". For StarCraft 2 and Diablo 3, returns the location or activity the player is currently engaged in.",
            },
            [13] = {
                ["Name"] = "broadcastText",
                ["Desc"] = "String - The Battle.Net broadcast message.",
            },
            [14] = {
                ["Name"] = "broadcastTime",
                ["Desc"] = "Number - The number of seconds elapsed since the current broadcast message was sent.",
            },
            [15] = {
                ["Name"] = "canSoR",
                ["Desc"] = "Boolean - Whether or not this friend can receive a Scroll of Resurrection.",
            },
            [16] = {
                ["Name"] = "toonID",
                ["Desc"] = "Number - A unique numeric identifier for the friend's character during this session.",
            },
        },
        ["Format"] = "hasFocus, toonName, client, realmName, realmID, faction, race, class, guild, zoneName, level, gameText, broadcastText, broadcastTime, canSoR, toonID = BNGetToonInfo(presenceID or toonID)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "presenceID",
                ["Desc"] = "Number - A unique numeric identifier for the friend during this session.",
            },
            [2] = {
                ["Name"] = "toonID",
                ["Desc"] = "Number - A unique numeric identifier for the friend's character during this session.",
            },
        },
        ["Desc"] = "Returns information about the specified toon of a RealID friend.",
    },
    ["IsMouselooking"] = {
        ["Desc"] = "For checking whether mouselook mode is currently active.",
        ["Format"] = "IsMouselooking()",
    },
    ["LoadAddOn"] = {
        ["Returns"] = "loaded, reason",
        ["Format"] = "loaded, reason = LoadAddOn(index or \"name\")",
        ["Arguments"] = "(index or \"name\")",
        ["Desc"] = "Request the loading of an On-Demand AddOn.",
    },
    ["GetGameTime"] = {
        ["Desc"] = "Returns the current server time in hours and minutes",
        ["Format"] = "hours,minutes = GetGameTime();",
    },
    ["DeclineGuild"] = {
        ["Desc"] = "Declines a guild invitation.",
        ["Format"] = "DeclineGuild();",
    },
    ["GetNumRFDungeons"] = {
        ["Desc"] = "Returns the number of available Raid Finder dungeons [1]",
        ["Format"] = "numRFDungeons = GetNumRFDungeons()",
    },
    ["SplitContainerItem"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["IsFalling"] = {
        ["Desc"] = "Returns whether the player's character is currently plummeting to their doom.",
        ["Format"] = "falling = IsFalling();",
    },
    ["GetQuestLogIndexByID"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "questLogIndex",
                ["Desc"] = "Number - The index of the queried quest in the quest log. Returns \"0\" if a quest with this questID does not exist in the quest log.",
            },
        },
        ["Format"] = "questLogIndex = GetQuestLogIndexByID(questID);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "questID",
                ["Desc"] = "Number - Unique identifier for each quest. Used as each quest's URL on database sites such as Wowhead.",
            },
        },
        ["Desc"] = "Returns the current quest log index of a quest by its ID.",
    },
    ["EJ_GetCurrentTier"] = {
        ["Desc"] = "Returns the currently active encounter journal tier index.",
        ["Format"] = "index = EJ_GetCurrentTier()",
    },
    ["GetInstanceLockTimeRemainingEncounter"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "bossName",
                ["Desc"] = "String - Name of the boss.",
            },
            [2] = {
                ["Name"] = "texture",
                ["Desc"] = "String -?",
            },
            [3] = {
                ["Name"] = "isKilled",
                ["Desc"] = "Boolean - true if the boss has been killed.",
            },
        },
        ["Format"] = "bossName, texture, isKilled = GetInstanceLockTimeRemainingEncounter(id);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "id",
                ["Desc"] = "Number - Index of the boss to query, ascending from 1 to encountersTotal return value from GetInstanceLockTimeRemaining.",
            },
        },
        ["Desc"] = "Returns information about bosses in the instance the player is about to be saved to.",
    },
    ["GetGuildBankTabPermissions"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "canView",
                ["Desc"] = "Boolean - 1 if the selected rank can view this guild bank tab, nil otherwise.",
            },
            [2] = {
                ["Name"] = "canDeposit",
                ["Desc"] = "Boolean - 1 if the selected rank can deposit to this guild bank tab, nil otherwise.",
            },
            [3] = {
                ["Name"] = "canEdit",
                ["Desc"] = "Boolean - 1 if the selected rank can edit the bank tab text, nil otherwise.",
            },
            [4] = {
                ["Name"] = "stacksPerDay",
                ["Desc"] = "Integer - Amount of withdrawable stacks per day or 0 if none.",
            },
        },
        ["Format"] = "",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "tab",
                ["Desc"] = "Integer - guild bank tab number",
            },
        },
        ["Desc"] = "",
    },
    ["BNGetFriendToonInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "hasFocus",
                ["Desc"] = "Boolean - Whether or not this toon is the one currently being displayed in Blizzard's FriendFrame.",
            },
            [2] = {
                ["Name"] = "toonName",
                ["Desc"] = "String - The name of the logged in toon/character.",
            },
            [3] = {
                ["Name"] = "client",
                ["Desc"] = "String - Either \"WoW\" (BNET_CLIENT_WOW), \"S2\" (BNET_CLIENT_S2), \"D3\" (BNET_CLIENT_D3) or \"HS\" (BNET_CLIENT_WTCG) for World of Warcraft, StarCraft 2, Diablo 3 or Heartstone.",
            },
            [4] = {
                ["Name"] = "realmName",
                ["Desc"] = "String - The name of the logged in realm.",
            },
            [5] = {
                ["Name"] = "realmID",
                ["Desc"] = "Number - The ID for the logged in realm.",
            },
            [6] = {
                ["Name"] = "faction",
                ["Desc"] = "String - The faction name (i.e., \"Alliance\" or \"Horde\").",
            },
            [7] = {
                ["Name"] = "race",
                ["Desc"] = "String - The localized race name (e.g., \"Blood Elf\").",
            },
            [8] = {
                ["Name"] = "class",
                ["Desc"] = "String - The localized class name (e.g., \"Death Knight\").",
            },
            [9] = {
                ["Name"] = "guild",
                ["Desc"] = "String - Seems to return \"\" even if the player is in a guild.",
            },
            [10] = {
                ["Name"] = "zoneName",
                ["Desc"] = "String - The localized zone name (e.g., \"The Undercity\").",
            },
            [11] = {
                ["Name"] = "level",
                ["Desc"] = "String - The current level (e.g., \"90\").",
            },
            [12] = {
                ["Name"] = "gameText",
                ["Desc"] = "String - For WoW, returns \"zoneName - realmName\". For StarCraft 2, Diablo 3 and Heartstone, returns the location or activity the player is currently engaged in.",
            },
            [13] = {
                ["Name"] = "broadcastText",
                ["Desc"] = "String - The Battle.Net broadcast message.",
            },
            [14] = {
                ["Name"] = "broadcastTime",
                ["Desc"] = "Number - The number of seconds elapsed since the current broadcast message was sent.",
            },
            [15] = {
                ["Name"] = "canSoR",
                ["Desc"] = "Boolean - Whether or not this friend can receive a Scroll of Resurrection.",
            },
            [16] = {
                ["Name"] = "toonID",
                ["Desc"] = "Number - A unique numeric identifier for the friend's character during this session.",
            },
        },
        ["Format"] = "hasFocus, toonName, client, realmName, realmID, faction, race, class, guild, zoneName, level, gameText, broadcastText, broadcastTime, canSoR, toonID = BNGetFriendToonInfo(friendIndex, toonIndex)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "friendIndex",
                ["Desc"] = "Number - The index on the friends list for this RealID friend.",
            },
            [2] = {
                ["Name"] = "toonIndex",
                ["Desc"] = "Number - The index of toons for this RealID friend.",
            },
        },
        ["Desc"] = "Returns information about the specified toon of a RealID friend.",
    },
    ["PickupPlayerMoney"] = {
        ["Desc"] = "Picks up an amount of money from the player's bags, placing it on the cursor.",
        ["Format"] = "PickupPlayerMoney(copper)",
    },
    ["SetGuildBankTabPermissions"] = {
        ["Desc"] = "Edits permissions for a bank tab.",
        ["Format"] = "SetGuildBankTabPermissions(tab, index, enabled);",
    },
    ["GetTrainerServiceAbilityReq"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "ability",
                ["Desc"] = "String - The name of the required ability.",
            },
            [2] = {
                ["Name"] = "hasReq",
                ["Desc"] = "(Boolean?) - Flag for if the player meets the requirement.",
            },
        },
        ["Format"] = "local ability, hasReq = GetTrainerServiceAbilityReq(trainerIndex, reqIndex)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "trainerIndex",
                ["Desc"] = "Number - Index of the trainer service to retrieve information about. Note that indices are affected by the trainer filter. (See GetTrainerServiceTypeFilter and SetTrainerServiceTypeFilter.)",
            },
            [2] = {
                ["Name"] = "reqIndex",
                ["Desc"] = "Number - Index of the requirement to retrieve information about.",
            },
        },
        ["Desc"] = "Gets the name of a requirement for training a skill and whether the player meets the requirement.",
    },
    ["GetGuildApplicantInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "Name",
                ["Desc"] = "Sting - The name of the applicant.",
            },
            [2] = {
                ["Name"] = "Level",
                ["Desc"] = "Number - The level of the applicant.",
            },
            [3] = {
                ["Name"] = "Class",
                ["Desc"] = "String - The class of the applicant.",
            },
            [4] = {
                ["Name"] = "bQuest",
                ["Desc"] = "Boolean - Whether the applicant is willing to quest.",
            },
            [5] = {
                ["Name"] = "bDungeon",
                ["Desc"] = "Boolean - Whether the applicant is willing to join dungeon groups.",
            },
            [6] = {
                ["Name"] = "bRaid",
                ["Desc"] = "Boolean - Whether the applicant is willing to raid.",
            },
            [7] = {
                ["Name"] = "bPvP",
                ["Desc"] = "Boolean - Whether the applicant is willing to PvP.",
            },
            [8] = {
                ["Name"] = "bRP",
                ["Desc"] = "Boolean - Whether the applicant is willing to role-play.",
            },
            [9] = {
                ["Name"] = "bWeekdays",
                ["Desc"] = "Boolean - Whether the applicant is available on weekdays.",
            },
            [10] = {
                ["Name"] = "bTank",
                ["Desc"] = "Boolean - Whether the applicant is willing to tank.",
            },
            [11] = {
                ["Name"] = "bHealer",
                ["Desc"] = "Boolean - Whether the applicant is willing to heal.",
            },
            [12] = {
                ["Name"] = "bDamage",
                ["Desc"] = "Boolean - Whether the applicant is willing to deal damage.",
            },
            [13] = {
                ["Name"] = "comment",
                ["Desc"] = "String - The message from the applicant to the guild.",
            },
            [14] = {
                ["Name"] = "timeSince",
                ["Desc"] = "Number - Time (in seconds) since the application was submitted.",
            },
            [15] = {
                ["Name"] = "timeLeft",
                ["Desc"] = "Number - Time (in seconds) until the application will expire.",
            },
        },
        ["Format"] = "name, level, class, bQuest, bDungeon, bRaid, bPvP, bRP, bWeekdays, bWeekends, bTank, bHealer, bDamage, comment, timeSince, timeLeft = GetGuildApplicantInfo(selectionID)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "selectionID",
                ["Desc"] = "Number - The index of the selected applicant (from 1 to GetNumGuildApplicants()).",
            },
        },
        ["Desc"] = "Returns information about the given selected guild applicant.",
    },
    ["UnitIsDeadOrGhost"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isDeadOrGhost",
                ["Desc"] = "Flag - 1 if the unit is dead or in ghost form, nil otherwise.",
            },
        },
        ["Format"] = "isDeadOrGhost = UnitIsDeadOrGhost(unit)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - the UnitId to query",
            },
        },
        ["Desc"] = "Returns a value indicating whether the specified unit is dead or in ghost form.",
    },
    ["GetGuildBankTransaction"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "type",
                ["Desc"] = "String - Transaction type. (\"deposit\", \"withdraw\" or \"move\")",
            },
            [2] = {
                ["Name"] = "name",
                ["Desc"] = "String - Name of player who made the transaction.",
            },
            [3] = {
                ["Name"] = "itemLink",
                ["Desc"] = "String - itemLink of transaction item.",
            },
            [4] = {
                ["Name"] = "count",
                ["Desc"] = "Number - Amount of items.",
            },
            [5] = {
                ["Name"] = "tab1",
                ["Desc"] = "Number - For type==\"move\", this is the origin tab.",
            },
            [6] = {
                ["Name"] = "tab2",
                ["Desc"] = "Number - For type==\"move\", this is the destination tab.",
            },
            [7] = {
                ["Name"] = "year",
                ["Desc"] = "Number - The number of years since this transaction took place.",
            },
            [8] = {
                ["Name"] = "month",
                ["Desc"] = "Number - The number of months since this transaction took place.",
            },
            [9] = {
                ["Name"] = "day",
                ["Desc"] = "Number - The number of days since this transaction took place.",
            },
            [10] = {
                ["Name"] = "hour",
                ["Desc"] = "Number - The number of hours since this transaction took place.",
            },
        },
        ["Format"] = "type, name, itemLink, count, tab1, tab2, year, month, day, hour = GetGuildBankTransaction(tab, index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "tab",
                ["Desc"] = "Number - Tab number, ascending from 1 to GetNumGuildBankTabs().",
            },
            [2] = {
                ["Name"] = "index",
                ["Desc"] = "Number - Transaction index, ascending from 1 to GetNumGuildBankTransactions(tab). Higher indices correspond to more recent entries.",
            },
        },
        ["Desc"] = "Get information for specific item transaction from Guild Bank.",
    },
    ["GetExistingLocales"] = {
        ["Desc"] = "Return a list of installed language packs.",
        ["Format"] = "lang1, lang2, ... = GetExistingLocales();",
    },
    ["GetTradeSkillRecipeLink"] = {
        ["Returns"] = "link",
        ["Format"] = "link = GetTradeSkillRecipeLink(index)",
        ["Arguments"] = "(index)",
        ["Desc"] = "Returns the EnchantLink for a trade skill.",
    },
    ["ExpandCurrencyList"] = {
        ["Desc"] = "Alters the expanded state of a currency list header.",
        ["Format"] = "ExpandCurrencyList(id, expanded)",
    },
    ["IsOutdoors"] = {
        ["Desc"] = "Returns whether the player's character is currently outdoors.",
        ["Format"] = "outdoors = IsOutdoors();",
    },
    ["GetPVPSessionStats"] = {
        ["Desc"] = "Gets the amount of honorable kills and honor points you have for the current session ( today ).",
        ["Format"] = "local hk, hp = GetPVPSessionStats();",
    },
    ["GetSendMailCOD"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["GetMerchantItemLink"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "itemLink",
                ["Desc"] = "String - returns a string that will show as a clickable link to the item",
            },
        },
        ["Format"] = "link = GetMerchantItemLink(index);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Integer - The index of the item in the merchant's inventory",
            },
        },
        ["Desc"] = "Returns a link to the indexed item in the merchant's inventory.",
    },
    ["EJ_GetInstanceByIndex"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "instanceID",
                ["Desc"] = "Number - Instance ID",
            },
            [2] = {
                ["Name"] = "name",
                ["Desc"] = "String - Instance Name",
            },
            [3] = {
                ["Name"] = "description",
                ["Desc"] = "String - Instance Description",
            },
            [4] = {
                ["Name"] = "bgImage",
                ["Desc"] = "String - Background Image",
            },
            [5] = {
                ["Name"] = "buttonImage",
                ["Desc"] = "String - Button Image",
            },
            [6] = {
                ["Name"] = "loreImage",
                ["Desc"] = "String - Lore Image",
            },
            [7] = {
                ["Name"] = "dungeonAreaMapID",
                ["Desc"] = "Number - Map ID",
            },
            [8] = {
                ["Name"] = "link",
                ["Desc"] = "String - Journal Link",
            },
        },
        ["Format"] = "instanceID, name, description, bgImage, buttonImage, loreImage, dungeonAreaMapID, link = EJ_GetInstanceByIndex(index, isRaid)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "number - Instance Index",
            },
            [2] = {
                ["Name"] = "isRaid",
                ["Desc"] = "boolean - Whether the Instance is a Raid or a normal Instance",
            },
        },
        ["Desc"] = "Returns Instance info [1]",
    },
    ["EquipmentManager_UnpackLocation"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "player",
                ["Desc"] = "boolean - Is the item currently available to the player (either equipped, or in the player's bags)",
            },
            [2] = {
                ["Name"] = "bank",
                ["Desc"] = "boolean - Is the item in the bank (only true if the item is in the bank, and the player has the bank frame open)",
            },
            [3] = {
                ["Name"] = "bags",
                ["Desc"] = "boolean - Is the item in a bag (if bank is also true, then it is in a bank bag)",
            },
            [4] = {
                ["Name"] = "voidStorage",
                ["Desc"] = "boolean - Is the item in the void storage",
            },
            [5] = {
                ["Name"] = "slot",
                ["Desc"] = "integer - Which slot number is the item in, may be an inventory slot or bag slot (see notes)",
            },
            [6] = {
                ["Name"] = "bag",
            },
            ["Desc"] = "player, bank, bags, slot, bag",
        },
        ["Format"] = "player, bank, bags, voidStorage, slot, bag = EquipmentManager_UnpackLocation(location)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "location",
                ["Desc"] = "integer - This is the integer returned for a specific slot by GetEquipmentSetLocations",
            },
        },
        ["Desc"] = "Takes an integer location value as returned by GetEquipmentSetLocations and returns unpacked location info.",
    },
    ["GetEquipmentSetInfoByName"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - Equipment set name.",
            },
            [2] = {
                ["Name"] = "icon",
                ["Desc"] = "String - Icon texture file name (relative to Interface/Icons) selected for this set.",
            },
            [3] = {
                ["Name"] = "setID",
                ["Desc"] = "Number - Unknown.",
            },
            [4] = {
                ["Name"] = "isEquipped",
                ["Desc"] = "Boolean - True if all non-ignored slots in this set are equipped.",
            },
            [5] = {
                ["Name"] = "numItems",
                ["Desc"] = "Number - Number of items included in the set.",
            },
            [6] = {
                ["Name"] = "equippedItems",
                ["Desc"] = "Number - Number of items in this set currently equipped.",
            },
            [7] = {
                ["Name"] = "availableItems",
                ["Desc"] = "Number - Number of items in this set currently in the player's bags/bank, if bank is available.",
            },
            [8] = {
                ["Name"] = "missingItems",
                ["Desc"] = "Number - Number of items in this set that are not currently available to the player.",
            },
            [9] = {
                ["Name"] = "ignoredSlots",
                ["Desc"] = "Number - Number of inventory slots ignored by this set.",
            },
        },
        ["Format"] = "name, icon, setID, isEquipped, totalItems, equippedItems, inventoryItems, missingItems, ignoredSlots = GetEquipmentSetInfo(index)icon, setID, isEquipped, numItems, equippedItems, availableItems, missingItems, ignoredSlots = GetEquipmentSetInfoByName(\"name\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "GetEquipmentSetInfo -- index",
                ["Desc"] = "Number: an ascending index going from 1 to GetNumEquipmentSets().",
            },
            [2] = {
                ["Name"] = "GetEquipmentSetInfoByName -- name",
                ["Desc"] = "String: equipment set name.",
            },
        },
        ["Desc"] = "Returns information about a saved equipment set:",
    },
    ["SetMapByID"] = {
        ["Desc"] = "Sets the world map based on the specified mapID",
        ["Format"] = "SetMapByID(mapID)",
    },
    ["UnitHasLFGDeserter"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isDeserter",
                ["Desc"] = "Boolean - true if the unit is currently an LFG deserter (and hence unable to use the dungeon finder), false otherwise.",
            },
        },
        ["Format"] = "isDeserter = UnitHasLFGDeserter(\"unit\");",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String (UnitId) - Unit you wish to query, e.g. \"player\".",
            },
        },
        ["Desc"] = "Returns whether the unit is currently unable to use the dungeon finder due to leaving a group prematurely.",
    },
    ["GetMapInfo"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["GetRangedCritChance"] = {
        ["Desc"] = "None.ReturnsThe players critical strike chance with the currently equipped range weapon as a floating point figure.NotesIf you are displaying this figure in a UI element and want it to update, hook to the UNIT_INVENTORY_CHANGED and SPELLS_CHANGED events as well as any other that effect equipment and buffs.FormattingTo retrieve the ranged crit chance as a two-decimal float (like 10.25), use the following function:",
        ["Format"] = "myRangedCrit = format(\"%.2f%%\", GetRangedCritChance());",
    },
    ["UnitStat"] = {
        ["Desc"] = "Returns info about one of the unit's stats (strength, agility, stamina, intellect, spirit).",
        ["Format"] = "stat, effectiveStat, posBuff, negBuff = UnitStat(\"unit\", statID);",
    },
    ["EJ_GetEncounterInfoByIndex"] = {
        ["Format"] = "name, description, encounterID, rootSectionID, link = EJ_GetEncounterInfoByIndex(index[, instanceID])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - Encounter Index",
            },
            [2] = {
                ["Name"] = "instanceID",
                ["Desc"] = "Number - Instance ID. If omitted, this will default to the Instance ID of the currently viewed Instance. Note that that the Blizzard_EncounterJournal addon has to be already loaded if you want to provide a custom instanceID (!)",
            },
        },
        ["Desc"] = "Returns Encounter info [1]",
    },
    ["UnitCanAttack"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "canAttack",
                ["Desc"] = "Bool - 1 if the attacker can attack the attacked, nil otherwise.",
            },
        },
        ["Format"] = "canAttack = UnitCanAttack(attacker, attacked);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "attacker",
                ["Desc"] = "UnitId - the unit that would initiate the attack (e.g., \"player\" or \"target\")",
            },
            [2] = {
                ["Name"] = "attacked",
                ["Desc"] = "UnitId - the unit that would be attacked (e.g., \"player\" or \"target\")",
            },
        },
        ["Desc"] = "Returns 1 if the first unit can attack the second, nil otherwise.",
    },
    ["GetSpecialization"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "currentSpec",
                ["Desc"] = "Number - index of the current specialization (ascending from 1), or nil if no specialization is currently learned.",
            },
        },
        ["Format"] = "currentSpec = GetSpecialization( [ isInspect [, isPet] [, specGroup] ] )",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "isInspect",
                ["Desc"] = "Boolean - if true, return information for the inspected player",
            },
            [2] = {
                ["Name"] = "isPet",
                ["Desc"] = "Boolean - if true, return information for the player's pet.",
            },
            [3] = {
                ["Name"] = "specGroup",
                ["Desc"] = "Number - The index of a given specialization/talent/glyph group (1 for primary / 2 for secondary).",
            },
        },
        ["Desc"] = "Returns the index of the player's current specialization.",
    },
    ["GetVoidItemHyperlinkString"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "itemLink",
                ["Desc"] = "String - item link of the item in the queried void storage slot; nil if the slot is empty.",
            },
        },
        ["Format"] = "itemLink = GetVoidItemHyperlinkString(voidSlot)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "voidSlot",
                ["Desc"] = "Number - index of the void storage slot to query, ascending from 1.",
            },
        },
        ["Desc"] = "Returns the item link of an item in void storage.",
    },
    ["GetItemInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "itemName",
                ["Desc"] = "String - The name of the item.",
            },
            [2] = {
                ["Name"] = "itemLink",
                ["Desc"] = "String - The item link of the item.",
            },
            [3] = {
                ["Name"] = "itemRarity",
                ["Desc"] = "Number - The quality of the item. The value is 0 to 7, which represents Poor to Heirloom.",
            },
            [4] = {
                ["Name"] = "itemLevel",
                ["Desc"] = "Number - The item level of this item, not including item levels gained from upgrades.",
            },
            [5] = {
                ["Name"] = "itemMinLevel",
                ["Desc"] = "Number - The minimum level required to use the item, 0 meaning no level requirement.",
            },
            [6] = {
                ["Name"] = "itemType",
                ["Desc"] = "String - The type of the item: Armor, Weapon, Quest, Key, etc.",
            },
            [7] = {
                ["Name"] = "itemSubType",
                ["Desc"] = "String - The sub-type of the item: Enchanting, Cloth, Sword, etc. See itemType.",
            },
            [8] = {
                ["Name"] = "itemStackCount",
                ["Desc"] = "Number - How many of the item per stack: 20 for Runecloth, 1 for weapon, 100 for Alterac Ram Hide, etc.",
            },
            [9] = {
                ["Name"] = "itemEquipLoc",
                ["Desc"] = "String - Slot token for the slot in which the item may be equipped, if it can. If not equippable, this is an empty string, \"\". The string returned is also the name of a global string variable, i.e. for \"INVTYPE_HEAD\", _G[\"INVTYPE_HEAD\"] is a localized, displayable name of the location.",
            },
            [10] = {
                ["Name"] = "itemTexture",
                ["Desc"] = "String - The name and path for the inventory icon texture for the item.",
            },
            [11] = {
                ["Name"] = "itemSellPrice",
                ["Desc"] = "Number - The price, in copper, a vendor is willing to pay for this item, 0 for items that cannot be sold.",
            },
        },
        ["Format"] = "itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount,itemEquipLoc, itemTexture, itemSellPrice = GetItemInfo(itemID or \"itemString\" or \"itemName\" or \"itemLink\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "itemId",
                ["Desc"] = "Number - Numeric ID of the item. ie. 30234 for [Nordrassil Wrath-Kilt]",
            },
            [2] = {
                ["Name"] = "itemName",
                ["Desc"] = "String - Name of an item owned by the player at some point during this play session, e.g. \"Nordrassil Wrath-Kilt\".",
            },
            [3] = {
                ["Name"] = "itemString",
                ["Desc"] = "String - A fragment of the itemString for the item, e.g. \"item:30234:0:0:0:0:0:0:0\" or \"item:30234\".",
            },
            [4] = {
                ["Name"] = "itemLink",
                ["Desc"] = "String - The full itemLink.",
            },
        },
        ["Desc"] = "Return information about a specific item.",
    },
    ["GetRealmName"] = {
        ["Desc"] = "Returns the name of the realm the player is currently on.",
        ["Format"] = "realmName = GetRealmName()",
    },
    ["GetPossessInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "texture",
                ["Desc"] = "String - The icon texture used for this slot, nil if the slot is empty",
            },
            [2] = {
                ["Name"] = "name",
                ["Desc"] = "String - The name of the action in this slot, nil if the slot is empty.",
            },
            [3] = {
                ["Name"] = "enabled",
                ["Desc"] = "Boolean - true if there is an action in this slot, nil otherwise.",
            },
        },
        ["Format"] = "texture, name, enabled = GetPossessInfo(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - The slot of the possess bar to check, ascending from 1.",
            },
        },
        ["Desc"] = "Returns information about a spell on the possession bar.",
    },
    ["debugstack"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "description",
                ["Desc"] = "String - a multi-line string showing what the current call stack looks like",
            },
        },
        ["Format"] = "description = debugstack([coroutine,] [start[, count1[, count2]]])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "coroutine",
                ["Desc"] = "Thread - The thread with the stack to examine (default - the calling thread)",
            },
            [2] = {
                ["Name"] = "start",
                ["Desc"] = "Number - the stack depth at which to start the stack trace (default 1 - the function calling debugstack, or the top of coroutine's stack)",
            },
            [3] = {
                ["Name"] = "count1",
                ["Desc"] = "Number - the number of functions to output at the top of the stack (default 12)",
            },
            [4] = {
                ["Name"] = "count2",
                ["Desc"] = "Number - the number of functions to output at the bottom of the stack (default 10)",
            },
        },
        ["Desc"] = "Output a string representation of the current calling stack, similar to the standard Lua debug.traceback() call, which is not present in WoW.",
    },
    ["AcceptSockets"] = {
        ["Desc"] = "Confirms insertion of new gems into the item currently being socketed.",
        ["Format"] = "AcceptSockets();",
    },
    ["SetWhoToUI"] = {
        ["Desc"] = "Sets how the result of a API SendWho request will be handled.",
        ["Format"] = "SetWhoToUI(state)",
    },
    ["GetItemCooldown"] = {
        ["Returns"] = "startTime, duration, enable",
        ["Format"] = "startTime, duration, enable = GetItemCooldown(itemID)",
        ["Arguments"] = "(itemID)",
        ["Desc"] = "Returns cooldown information for the item.",
    },
    ["ClickVoidTransferDepositSlot"] = {
        ["Desc"] = "Clicks the specified Void Transfer deposit slot [1]",
        ["Format"] = "ClickVoidTransferDepositSlot(slotIndex[, isRightClick])",
    },
    ["GetContainerItemID"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "itemId",
                ["Desc"] = "Number - item ID of the item held in the container slot, nil if there is no item in the container slot.",
            },
        },
        ["Format"] = "itemId = GetContainerItemID(bag, slot);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "bag",
                ["Desc"] = "Number (BagId) - Index of the bag to query.",
            },
            [2] = {
                ["Name"] = "slot",
                ["Desc"] = "Number - Index of the slot within the bag to query; ascending from 1.",
            },
        },
        ["Desc"] = "Returns the item id of the item in a particular container slot.",
    },
    ["GetScreenResolutions"] = {
        ["Desc"] = "Returns a list of available screen resolutions",
        ["Format"] = "resolution1, resolution2, resolution3, ... = GetScreenResolutions()",
    },
    ["EJ_GetSectionPath"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "sectionID",
                ["Desc"] = "Number - Section ID",
            },
            [2] = {
                ["Name"] = "parentSectionID",
                ["Desc"] = "Number - Parent Section ID. Otherwise returns nil",
            },
        },
        ["Format"] = "sectionID, parentSectionID = EJ_GetSectionPath(sectionID)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "sectionID",
                ["Desc"] = "Number - Section ID",
            },
        },
        ["Desc"] = "Returns the Parent Section ID if available [1]",
    },
    ["ContainerIDToInventoryID"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "inventoryID",
                ["Desc"] = "inventoryID - the bag's inventory ID used in functions like PutItemInBag(inventoryId) and GetInventoryItemLink(\"player\",inventoryId)",
            },
        },
        ["Format"] = "",
        ["Arguments"] = "(bagID)",
        ["Desc"] = "",
    },
    ["GetNumArtifactsByRace"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "numProjects",
                ["Desc"] = "Integer - Number of artifacts for that race.",
            },
        },
        ["Format"] = "numProjects = GetNumArtifactsByRace(raceIndex)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "raceIndex",
                ["Desc"] = "Integer - Index of the race to be selected.",
            },
        },
        ["Desc"] = "Returns the amount of artifacts the player has acquired from the provided race.",
    },
    ["GetQuestLogRewardInfo"] = {
        ["Desc"] = "Returns a pile of reward item info.",
        ["Format"] = "GetQuestLogRewardInfo(itemNum);",
    },
    ["CloseMerchant"] = {
        ["Returns"] = "nil",
        ["Format"] = "CloseMerchant()",
        ["Arguments"] = "none",
        ["Desc"] = "Closes the merchant window.",
    },
    ["GetNumTrackedAchievements"] = {
        ["Desc"] = "Returns the total number of tracked achievements.",
        ["Format"] = "numTracked = GetNumTrackedAchievements()",
    },
    ["seterrorhandler"] = {
        ["Desc"] = "Sets the function to be called when WoW encounters an error.",
        ["Format"] = "seterrorhandler(errFunction)",
    },
    ["GetMapOverlayInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "textureName",
                ["Desc"] = "String - The path of the overlay texture",
            },
            [2] = {
                ["Name"] = "texWidth",
                ["Desc"] = "Number - The width of the resulting texture in pixels.",
            },
            [3] = {
                ["Name"] = "texHeight",
                ["Desc"] = "Number - The height of the resulting texture in pixels.",
            },
            [4] = {
                ["Name"] = "ofsX",
                ["Desc"] = "Number - X direction pixel offset of the overlay texture from the map texture",
            },
            [5] = {
                ["Name"] = "ofsY",
                ["Desc"] = "Number - Y direction pixel offset of the overlay texture from the map texture",
            },
            [6] = {
                ["Name"] = "mapX",
                ["Desc"] = "Number - Unknown - always 0 and not used in UI.",
            },
            [7] = {
                ["Name"] = "mapY",
                ["Desc"] = "Number - Unknown - always 0 and not used in UI.",
            },
        },
        ["Format"] = "textureName, texWidth, texHeight, ofsX, ofsY, mapX, mapY = GetMapOverlayInfo(overlayIndex);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "overlayIndex",
                ["Desc"] = "Number - Indicates which overlay to query (from 1 to GetNumMapOverlays())",
            },
        },
        ["Desc"] = "Returns the information about an overlay on the current world map.",
    },
    ["GetNumSpecializationsForClassID"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "numSpecialization",
                ["Desc"] = "Number - number of specializations available to characters of the specified class.",
            },
        },
        ["Format"] = "numSpecializations = GetNumSpecializationsForClassID(classID)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "classID",
                ["Desc"] = "Number (classId) - class ID to return information about.",
            },
        },
        ["Desc"] = "Returns the number of specializations available to a particular class.",
    },
    ["CanInspect"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "canInspect",
                ["Desc"] = "Flag - 1 if you can inspect the specified unit, nil otherwise.",
            },
        },
        ["Format"] = "canInspect = CanInspect(\"unit\"[, showError])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String (unitId) - Unit to check inspectability of.",
            },
            [2] = {
                ["Name"] = "showError",
                ["Desc"] = "Flag - If true, the function will display an error message (\"You can't inspect that unit\") if you cannot inspect the specified unit.",
            },
        },
        ["Desc"] = "Returns whether you can inspect a particular unit.",
    },
    ["ClearSendMail"] = {
        ["Returns"] = "nil",
        ["Format"] = "ClearSendMail()",
        ["Arguments"] = "none",
        ["Desc"] = "Clears everything that has been typed into the 'Send Mail' window.",
    },
    ["GetSubZoneText"] = {
        ["Desc"] = "Returns the subzone name.",
        ["Format"] = "subzone = GetSubZoneText();",
    },
    ["GetNetStats"] = {
        ["Desc"] = "Retrieve info about network statistics.",
        ["Format"] = "bandwidthIn, bandwidthOut, latencyHome, latencyWorld = GetNetStats();",
    },
    ["GetCurrencyInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - the name of the currency, localized to the language",
            },
            [2] = {
                ["Name"] = "amount",
                ["Desc"] = "Number - Current amount of the currency at index",
            },
            [3] = {
                ["Name"] = "texture",
                ["Desc"] = "String - The file name of the currency's icon. As of 5.2.0, does include the path (\\\\Interface\\\\Icons\\\\)",
            },
            [4] = {
                ["Name"] = "earnedThisWeek",
                ["Desc"] = "Number - The amount of the currency earned this week",
            },
            [5] = {
                ["Name"] = "weeklyMax",
                ["Desc"] = "Number - Maximum amount of currency possible to be earned this week",
            },
            [6] = {
                ["Name"] = "totalMax",
                ["Desc"] = "Number - Total maximum currency possible to stockpile",
            },
            [7] = {
                ["Name"] = "isDiscovered",
                ["Desc"] = "Boolean - Whether the character has ever got some of this currency",
            },
            [8] = {
                ["Name"] = "rarity",
                ["Desc"] = "Integer - Rarity indicator for this currency",
            },
        },
        ["Format"] = "name, currentAmount, texture, earnedThisWeek, weeklyMax, totalMax, isDiscovered, rarity = GetCurrencyInfo(id or \"currencyLink\" or \"currencyString\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "id",
                ["Desc"] = "Integer - ID of the currency to retrieve",
            },
            [2] = {
                ["Name"] = "currencyLink",
                ["Desc"] = "String - The full currencyLink as found with GetCurrencyLink() or GetCurrencyListLink().",
            },
            [3] = {
                ["Name"] = "currencyString",
                ["Desc"] = "String - A fragment of the currencyLink string for the item, e.g. \"currency:396\" for Valor Points.",
            },
        },
        ["Desc"] = "Retrieve Information about a currency at index including it's amount.",
    },
    ["GetSavedInstanceInfo"] = {
        ["Desc"] = "Returns information about an instance for which the player has saved lockout data.",
        ["Format"] = "name, id, reset, difficulty, locked, extended, instanceIDMostSig, isRaid, maxPlayers, difficultyName, numEncounters, encounterProgress = GetSavedInstanceInfo(index)",
    },
    ["GetBankSlotCost"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "cost",
                ["Desc"] = "Number - Price of the next bank slot in copper.",
            },
        },
        ["Format"] = "cost = GetBankSlotCost(numSlots);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "numSlots",
                ["Desc"] = "Number - Number of slots already purchased.",
            },
        },
        ["Desc"] = "Returns the price of a particular bank slot.",
    },
    ["GetCurrentArenaSeason"] = {
        ["Desc"] = "Returns the current arena season",
        ["Format"] = "season = GetCurrentArenaSeason();",
    },
    ["GetLanguageByIndex"] = {
        ["Returns"] = "Language",
        ["Format"] = "Language = GetLanguageByIndex(index)",
        ["Arguments"] = "index",
        ["Desc"] = "Returns the language specified by the index that your character can speak.",
    },
    ["GetInboxInvoiceInfo"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["GetQuestsCompleted"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "questsCompleted",
                ["Desc"] = "Table - The list of completed quests. For each completed quest, there will be a key equal to its id (as in a questString) with the value true. Other keys will be unchanged (if the table argument was supplied) or nil.",
            },
        },
        ["Format"] = "questsCompleted = GetQuestsCompleted([table])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "table",
                ["Desc"] = "Table - If supplied, GetQuestsCompleted will add or replace keys in this table instead of creating a new table.",
            },
        },
        ["Desc"] = "Returns a list of quests the character has completed in its lifetime.",
    },
    ["GetTradeTargetItemLink"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["GetAverageItemLevel"] = {
        ["Desc"] = "Returns the average item level of the player's character and average item level equipped.",
        ["Format"] = "avgItemLevel, avgItemLevelEquipped = GetAverageItemLevel()",
    },
    ["GetPetActionCooldown"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "startTime",
                ["Desc"] = "Number - The time when the cooldown started (as returned by GetTime()) or zero if no cooldown",
            },
            [2] = {
                ["Name"] = "duration",
                ["Desc"] = "Number - The number of seconds the cooldown will last, or zero if no cooldown",
            },
            [3] = {
                ["Name"] = "enable",
                ["Desc"] = "Boolean - 0 if no cooldown, 1 if cooldown is in effect (probably)",
            },
        },
        ["Format"] = "startTime, duration, enable = GetPetActionCooldown(index);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - The index of the pet action button you want to query for cooldown info.",
            },
        },
        ["Desc"] = "Returns cooldown information for the pet action in the specified pet action bar slot.",
    },
    ["GetCoinIcon"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["GetProgressText"] = {
        ["Desc"] = "Returns quest progress text, displayed by the NPC before the player hits \"Continue\".",
        ["Format"] = "GetProgressText();",
    },
    ["DropItemOnUnit"] = {
        ["Desc"] = "Drops an item from the cursor onto the specified target. Can be used to initiate a trade session (though see Trade functions) or feeding pets.",
        ["Format"] = "DropItemOnUnit(unit);",
    },
    ["GetLFGRoleShortageRewards"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "eligible",
                ["Desc"] = "Boolean - Unknown. Possibly whether there are any shortages of this type, possibly whether the player is somehow eligible to participate",
            },
            [2] = {
                ["Name"] = "forTank",
                ["Desc"] = "Boolean - Whether this shortage type applies to the tank role",
            },
            [3] = {
                ["Name"] = "forHealer",
                ["Desc"] = "Boolean - Whether this shortage type applies to the healer role",
            },
            [4] = {
                ["Name"] = "forDamage",
                ["Desc"] = "Boolean - Whether this shortage type applies to the damage role",
            },
            [5] = {
                ["Name"] = "itemCount",
                ["Desc"] = "Number - Unknown. Related to the potential rewards",
            },
            [6] = {
                ["Name"] = "money",
                ["Desc"] = "Number - Unknown. Most likely the amount of money you get as a reward",
            },
            [7] = {
                ["Name"] = "xp",
            },
            ["Desc"] = "eligible, forTank, forHealer, forDamage, itemCount, money, xp",
        },
        ["Format"] = "eligible, forTank, forHealer, forDamage, itemCount, money, xp = GetLFGRoleShortageRewards(dungeonID, shortageSeverity)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "dungeonID",
                ["Desc"] = "Number - The type of the dungeons to queue for. See table below.",
            },
            [2] = {
                ["Name"] = "shortageSeverity",
                ["Desc"] = "Number - A number from 1 to LFG_ROLE_NUM_SHORTAGE_TYPES. See below for specific shortage types.",
            },
        },
        ["Desc"] = "Return information concerning the LFG Call to Arms rewards.",
    },
    ["GetItemFamily"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "bagType",
                ["Desc"] = "Bitfield - What type of bags an item can go into or if the item is a container what it can contain",
            },
        },
        ["Format"] = "bagType = GetItemFamily(itemId or \"itemName\" or \"itemLink\")",
        ["Arguments"] = "(itemId or \"itemName\" or \"itemLink\")",
        ["Desc"] = "Gets the bitfield of what types of bags an item can go into or contain.",
    },
    ["GetActionBarToggles"] = {
        ["Desc"] = "Gets the toggle states of the extra action bars.",
        ["Format"] = "bottomLeftState, bottomRightState, sideRightState, sideRight2State = GetActionBarToggles()",
    },
    ["ShowFriends"] = {
        ["Desc"] = "Request updated friends information from server.",
        ["Format"] = "ShowFriends()",
    },
    ["PlayMusic"] = {
        ["Desc"] = "Plays the given mp3 file.",
        ["Format"] = "/script PlayMusic(soundFile);",
    },
    ["GetSpellTexture"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "texture",
                ["Desc"] = "String - Path of the texture used for displaying the spell in the spellbook.",
            },
        },
        ["Format"] = "texture = GetSpellTexture(spellName | spellID, bookType)",
        ["Arguments"] = "(spellName | spellID, bookType)",
        ["Desc"] = "Returns the texture path of the specified spellbook spell",
    },
    ["FlipCameraYaw"] = {
        ["Returns"] = "nil",
        ["Format"] = "FlipCameraYaw(angle)",
        ["Arguments"] = "(float angle)",
        ["Desc"] = "Rotates the camera about the Z-axis",
    },
    ["EJ_GetTierInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - The (localized) tier name.",
            },
            [2] = {
                ["Name"] = "link",
                ["Desc"] = "String - The (localized) tier link.",
            },
        },
        ["Format"] = "name, link = EJ_GetTierInfo(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - The tier index (1-5, see below).",
            },
        },
        ["Desc"] = "Get some information about the encounter journal tier for index.",
    },
    ["GetQuestLogQuestText"] = {
        ["Desc"] = "Returns the description and objectives required for the selected (the one highlighted in the quest log) quest.",
        ["Format"] = "questDescription, questObjectives = GetQuestLogQuestText();",
    },
    ["GetBuildInfo"] = {
        ["Desc"] = "Returns information about current client build.",
        ["Format"] = "version, build, date, tocversion = GetBuildInfo()",
    },
    ["RequestRaidInfo"] = {
        ["Desc"] = "Sends a request to the server to send back information about the instance.",
        ["Format"] = "RequestRaidInfo()",
    },
    ["InitiateTrade"] = {
        ["Desc"] = "Opens the Trade window with selected target.",
        ["Format"] = "InitiateTrade(UnitId);",
    },
    ["UnitName"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - The name of the specified unit, \"nil\" if not applicable (e.g., if the specified unit is \"target\" but the player has no target selected).",
            },
            [2] = {
                ["Name"] = "realm",
                ["Desc"] = "String - The realm the specified unit is from, e.g. \"ChamberofAspects\", if different from the player's own realm. If the unit and the player stem from the same realm, this value is nil.",
            },
        },
        ["Format"] = "name, realm = UnitName(\"unit\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - The UnitId to query (e.g. \"player\", \"party2\", \"pet\", \"target\" etc.)",
            },
        },
        ["Desc"] = "Returns the name and realm of the specified unit.",
    },
    ["GetItemCount"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "count",
                ["Desc"] = "Number - The number of items in your possesion, or charges if includeCharges is true and the item has charges.",
            },
        },
        ["Format"] = "count = GetItemCount(itemID or \"itemName\" or \"itemLink\"[, includeBank][, includeCharges])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "itemID / \"itemName\" / \"itemLink\"",
                ["Desc"] = "Number/String/String - Numeric ID of the item, name of the item, or itemLink of the item to query.",
            },
            [2] = {
                ["Desc"] = "(itemId or \"itemName\" or \"itemLink\", includeBank, includeCharges)",
            },
            [3] = {
                ["Name"] = "includeBank",
                ["Desc"] = "Boolean - true: count includes bank items",
            },
            [4] = {
                ["Name"] = "includeCharges",
                ["Desc"] = "Boolean - true: count is charges if any, otherwise number of items",
            },
        },
        ["Desc"] = "Returns count information for the item.",
    },
    ["GetFirstTradeSkill"] = {
        ["Returns"] = "skillId",
        ["Format"] = "skillId = GetFirstTradeSkill()",
        ["Arguments"] = "()",
        ["Desc"] = "Returns the index of the first non-header trade skill entry.",
    },
    ["DoEmote"] = {
        ["Returns"] = "nil",
        ["Format"] = "",
        ["Arguments"] = "(\"token\" [, \"target\"])",
        ["Desc"] = "",
    },
    ["ShiftQuestWatches"] = {
        ["Desc"] = "Exchanges the order of two watched quests.",
        ["Format"] = "ShiftQuestWatches(id1, id2)",
    },
    ["GetNumWhoResults"] = {
        ["Returns"] = "totalCount, numWhos",
        ["Format"] = "numWhos, totalCount = GetNumWhoResults();",
        ["Arguments"] = "None",
        ["Desc"] = "Get the number of entries resulting from your most recent /who query.",
    },
    ["GetRealZoneText"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "ZoneName",
                ["Desc"] = "String - The real name of an instance or the zone name",
            },
        },
        ["Format"] = "",
        ["Arguments"] = "none",
        ["Desc"] = "",
    },
    ["GetSpellAutocast"] = {
        ["Returns"] = "autocastable, autostate",
        ["Format"] = "autocastable, autostate = GetSpellAutocast(\"spellName\" | spellId, bookType)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "spellName",
                ["Desc"] = "String - the name of the spell.",
            },
            [2] = {
                ["Name"] = "spellId",
                ["Desc"] = "Numeric - the offset (position) of spell in spellbook. SpellId can change when you learn new spells.",
            },
            [3] = {
                ["Name"] = "bookType",
                ["Desc"] = "String - Either BOOKTYPE_SPELL (\"spell\") or BOOKTYPE_PET (\"pet\").",
            },
        },
        ["Desc"] = "Get information about a spell's Autocast.",
    },
    ["RemoveItemFromArtifact"] = {
        ["Desc"] = "Remove a Keystone from the selected artifact.",
        ["Format"] = "keystoneRemoved = RemoveItemFromArtifact()",
    },
    ["PickupItem"] = {
        ["Desc"] = "Place the item on the cursor.",
        ["Format"] = "PickupItem(itemID or \"itemString\" or \"itemName\" or \"itemLink\")",
    },
    ["GetNumGuildApplicants"] = {
        ["Desc"] = "Returns the total number of applicants to your guild received trough the Guild Finder.",
        ["Format"] = "numApplicants = GetNumGuildApplicants()",
    },
    ["GetGossipActiveQuests"] = {
        ["Desc"] = "Get the list of active quests from an NPC.",
        ["Format"] = "title1, level1, isLowLevel1, isComplete1, isLegendary1, title2, level2, isLowLevel2, isComplete2, isLegendary2 = GetGossipActiveQuests()",
    },
    ["QuestGetAutoAccept"] = {
        ["Desc"] = "Returns whether the last-offered quest was automatically accepted.",
        ["Format"] = "isAutoAccepted = QuestGetAutoAccept();",
    },
    ["GetNumBindings"] = {
        ["Desc"] = "Returns the total number of key bindings listed in the key bindings window. This includes not only actions that can be bound, but also the category headers in the window. This would generally be used in conjunction with GetBinding to loop through and set/get all of the key bindings available.",
        ["Format"] = "numKeyBindings = GetNumBindings()",
    },
    ["UnitPowerMax"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "maxpower",
                ["Desc"] = "Number - the unit's maximum amount of the queried resource.",
            },
        },
        ["Format"] = "maxpower = UnitPowerMax(\"unit\"[, powerType]);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String (UnitId) - Unit whose maximum resource value should be returned",
            },
            [2] = {
                ["Name"] = "powerType",
                ["Desc"] = "String (powerType) - Type of resource (mana/rage/energy/etc) to query",
            },
        },
        ["Desc"] = "Returns the maximum power of the specified unit.",
    },
    ["GetSendMailPrice"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "sendPrice",
                ["Desc"] = "Number - The price to send mail in copper.",
            },
        },
        ["Format"] = "local sendPrice = GetSendMailPrice()",
        ["Arguments"] = "None",
        ["Desc"] = "Gets the cost for sending mail.",
    },
    ["GetNumLanguages"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "NumLanguages",
                ["Desc"] = "Numeric - Returns the number of languages your character can speak.",
            },
        },
        ["Format"] = "NumLanguages = GetNumLanguages()",
        ["Arguments"] = "none",
        ["Desc"] = "Returns the number of languages your character can speak.",
    },
    ["CanMerchantRepair"] = {
        ["Desc"] = "Can the merchant repair items or not.",
        ["Format"] = "canRepair = CanMerchantRepair();",
    },
    ["GetShieldBlock"] = {
        ["Desc"] = "Returns the percentage of damage blocked by your shield.",
        ["Format"] = "damageReduction = GetShieldBlock()",
    },
    ["DropCursorMoney"] = {
        ["Returns"] = "nil",
        ["Format"] = "DropCursorMoney()",
        ["Arguments"] = "none",
        ["Desc"] = "Drops the money currently attached to your cursor back into your bag.",
    },
    ["FactionToggleAtWar"] = {
        ["Returns"] = "nil",
        ["Format"] = "FactionToggleAtWar(rowIndex)",
        ["Arguments"] = "(rowIndex)",
        ["Desc"] = "Toggle the At War status of a faction row.",
    },
    ["UnitIsGroupLeader"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isLeader",
                ["Desc"] = "Boolean - Is the player the leader of the group?",
            },
        },
        ["Format"] = "isLeader = UnitIsGroupLeader(\"unit\" or \"player name\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String (unitId) - The unit ID to check.",
            },
        },
        ["Desc"] = "Returns true if the unit is the leader of a party or raid, false otherwise.",
    },
    ["AddOrDelIgnore"] = {
        ["Returns"] = "nil",
        ["Format"] = "AddOrDelIgnore(\"playerName\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "playerName",
                ["Desc"] = "String - The name of the player to add or remove",
            },
        },
        ["Desc"] = "Adds or removes a player to/from the ignore list.",
    },
    ["ExpandTradeSkillSubClass"] = {
        ["Desc"] = "Expands a header within a tradeskill window.",
        ["Format"] = "nil = ExpandTradeSkillSubClass(index)",
    },
    ["EnumerateServerChannels"] = {
        ["Desc"] = "Retrieves all available server channels (zone dependent).",
        ["Format"] = "channel1, channel2, ... = EnumerateServerChannels();",
    },
    ["GetParryChance"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["GetLatestThreeSenders"] = {
        ["Desc"] = "Returns up to three names of senders of unread mail in the character's inbox.",
        ["Format"] = "sender1, sender2, sender3 = GetLatestThreeSenders();",
    },
    ["GetNumArchaeologyRaces"] = {
        ["Desc"] = "Returns the amount of Archaeology races in the game.",
        ["Format"] = "numRaces= GetNumArchaeologyRaces()",
    },
    ["EquipPendingItem"] = {
        ["Desc"] = "Equips the currently pending Bind-on-Equip or Bind-on-Pickup item from the specified inventory slot.",
        ["Format"] = "EquipPendingItem(invSlot)",
    },
    ["IsUnitOnQuest"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["DeleteInboxItem"] = {
        ["Format"] = "DeleteInboxItem(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - the index of the message (1 is the first message)",
            },
        },
        ["Desc"] = "Remove a message from the mailbox.",
    },
    ["GetSheathState"] = {
        ["Desc"] = "Returns which type of weapon the player currently has unsheathed, if any.",
        ["Format"] = "sheathState = GetSheathState()",
    },
    ["GetMapNameByID"] = {
        ["Desc"] = "Returns the full localized name of the zone specified by the mapID",
        ["Format"] = "mapName = GetMapNameByID(mapID)",
    },
    ["GetLFGDungeonInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "dungeonName",
                ["Desc"] = "The name of the dungeon/event (string)",
            },
            [2] = {
                ["Name"] = "typeId",
                ["Desc"] = "1=instance or LFR, 2=raid instance, 4=outdoor area, 6=random instance (integer)",
            },
            [3] = {
                ["Name"] = "subtypeID",
                ["Desc"] = "0=Unknown, 1=instance, 3=Unknown, 5=flex raid",
            },
            [4] = {
                ["Name"] = "minLvl",
                ["Desc"] = "Earliest level you can enter this dungeon (using the portal, not LFD) (integer)",
            },
            [5] = {
                ["Name"] = "maxLvl",
                ["Desc"] = "Highest level you can enter this dungeon (using the portal, not LFD) (integer)",
            },
            [6] = {
                ["Name"] = "recLvl",
                ["Desc"] = "Recommended level to queue up for this dungeon (integer)",
            },
            [7] = {
                ["Name"] = "minRecLvl",
                ["Desc"] = "Earliest level you can queue up for the dungeon (integer)",
            },
            [8] = {
                ["Name"] = "maxRecLvl",
                ["Desc"] = "Highest level you can queue up for the dungeon (integer)",
            },
            [9] = {
                ["Name"] = "expansionId",
                ["Desc"] = "Referring to GetAccountExpansionLevel() values (integer)",
            },
            [10] = {
                ["Name"] = "groupId",
                ["Desc"] = "Unknown (integer)",
            },
            [11] = {
                ["Name"] = "textureName",
                ["Desc"] = "For example \"Interface\\LFDFRAME\\LFGIcon-%s.blp\" where%s is the textureName value (string)",
            },
            [12] = {
                ["Name"] = "difficulty",
                ["Desc"] = "0 for Normal and 1 for Heroic (integer)",
            },
            [13] = {
                ["Name"] = "maxPlayers",
                ["Desc"] = "Number of players required (integer)",
            },
            [14] = {
                ["Name"] = "dungeonDesc",
                ["Desc"] = "Description, usually empty for most dungeons but events contain descriptions of the event, like Love is in the Air daily or Brewfest, e.g. (string)",
            },
            [15] = {
                ["Name"] = "isHoliday",
                ["Desc"] = "If true then this is indeed a holiday event (boolean)",
            },
            [16] = {
                ["Name"] = "repAmount",
                ["Desc"] = "Unknown (integer)",
            },
            [17] = {
                ["Name"] = "forceHide",
                ["Desc"] = "Unknown (bolean)",
            },
        },
        ["Format"] = "dungeonName, typeId, subtypeID, minLvl, maxLvl, recLvl, minRecLvl, maxRecLvl, expansionId, groupId, textureName, difficulty, maxPlayers, dungeonDesc, isHoliday, repAmount, forceHide = GetLFGDungeonInfo(id)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "id",
                ["Desc"] = "Dungeon id, this refers to a integer found in LFGDungeons.dbc. At the moment in build 16500 the id range is 1-634 (integer)",
            },
        },
        ["Desc"] = "Retrieves specific dungeon information, not limited by player level and all dungeons can be looked up.",
    },
    ["GetNumWatchedTokens"] = {
        ["Desc"] = "Returns the number of currencies currently watched on the player's backpack.",
        ["Format"] = "numWatched = GetNumWatchedTokens();",
    },
    ["ClickVoidStorageSlot"] = {
        ["Desc"] = "Clicks the specified Void Storage slot [1]",
        ["Format"] = "ClickVoidStorageSlot(slotIndex[, isRightClick])",
    },
    ["GetGuildRosterInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - The name and realm name of one member of the guild. (e.g. \"Arthas-Silvermoon\")",
            },
            [2] = {
                ["Name"] = "rank",
                ["Desc"] = "String - The member's rank in the guild ( Guild Master, Member ...).",
            },
            [3] = {
                ["Name"] = "rankIndex",
                ["Desc"] = "Number - The number corresponding to the guild's rank. The Rank Index starts at 0, add 1 to correspond with the index used in GuildControlGetRankName(index).",
            },
            [4] = {
                ["Name"] = "level",
                ["Desc"] = "Number - The level of the player.",
            },
            [5] = {
                ["Name"] = "class",
                ["Desc"] = "String - The class (Mage, Warrior, etc) of the player.",
            },
            [6] = {
                ["Name"] = "zone",
                ["Desc"] = "String - The position of the player ( or the last if he is off line ).",
            },
            [7] = {
                ["Name"] = "note",
                ["Desc"] = "String - Returns the character's public note if one exists, returns \"\" if there is no note or the current player does not have access to the public notes.",
            },
            [8] = {
                ["Name"] = "officernote",
                ["Desc"] = "String - Returns the character's officer note if one exists, returns \"\" if there is no note or the current player does not have access to the officer notes.",
            },
            [9] = {
                ["Name"] = "online",
                ["Desc"] = "Number - Return 1 if the player is online, else it's nil.",
            },
            [10] = {
                ["Name"] = "status",
                ["Desc"] = "Number - The availability of the player. 0 is no status, 1 means AFK, and 2 means Busy (Do Not Disturb) (changed in 4.3.2).",
            },
            [11] = {
                ["Name"] = "classFileName",
                ["Desc"] = "String - Upper-case English classname, localisation independant.",
            },
            [12] = {
                ["Name"] = "achievementPoints",
                ["Desc"] = "Number - The guild achievement points of the member.",
            },
            [13] = {
                ["Name"] = "achievementRank",
                ["Desc"] = "Number - The guild achievement rank of the member.",
            },
            [14] = {
                ["Name"] = "isMobile",
                ["Desc"] = "Boolean - Returns true if member is logged on using the mobile armory application, false otherwise.",
            },
            [15] = {
                ["Name"] = "canSoR",
                ["Desc"] = "Boolean - Returns true if you can use a Scroll of Resurrection on this member, false otherwise.",
            },
            [16] = {
                ["Name"] = "repStanding",
                ["Desc"] = "Number - Returns a Standing ID for the guild reputation of the member.",
            },
        },
        ["Format"] = "name, rank, rankIndex, level, class, zone, note, officernote, online, status, classFileName, achievementPoints, achievementRank, isMobile, canSoR, repStanding = GetGuildRosterInfo(index);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Integer - It's a number corresponding to one player in the Guild",
            },
        },
        ["Desc"] = "Returns information about the player in the guild roster.",
    },
    ["GetLootRollItemInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "texture",
                ["Desc"] = "String - The path of the texture of the item icon.",
            },
            [2] = {
                ["Name"] = "name",
                ["Desc"] = "String - The name of the item.",
            },
            [3] = {
                ["Name"] = "count",
                ["Desc"] = "Number - The quantity of the item.",
            },
            [4] = {
                ["Name"] = "quality",
                ["Desc"] = "Number - The quality of the item. Starting with 1 for common, going up to 5 for legendary.",
            },
            [5] = {
                ["Name"] = "bindOnPickUp",
                ["Desc"] = "Flag - Returns 1 when the item is bind on pickup, nil otherwise.",
            },
            [6] = {
                ["Name"] = "canNeed",
                ["Desc"] = "Flag - Returns 1 when you can roll need on the item, nil otherwise.",
            },
            [7] = {
                ["Name"] = "canGreed",
                ["Desc"] = "Flag - Returns 1 when you can roll greed on the item, nil otherwise.",
            },
            [8] = {
                ["Name"] = "canDisenchant",
                ["Desc"] = "Flag - Returns 1 when you can  [Disenchant] the item, nil otherwise.",
            },
            [9] = {
                ["Name"] = "reasonNeed",
                ["Desc"] = "Number - See details.",
            },
            [10] = {
                ["Name"] = "reasonGreed",
                ["Desc"] = "Number - See details.",
            },
            [11] = {
                ["Name"] = "reasonDisenchant",
                ["Desc"] = "Number - See details.",
            },
            [12] = {
                ["Name"] = "deSkillRequired",
                ["Desc"] = "Number - Required skill in enchanting to disenchant the item.",
            },
        },
        ["Format"] = "texture, name, count, quality, bindOnPickUp, canNeed, canGreed, canDisenchant, reasonNeed, reasonGreed, reasonDisenchant, deSkillRequired = GetLootRollItemInfo(rollID)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "rollID",
                ["Desc"] = "Number - The number increments by 1 for each new roll. The count is not reset by reloading the UI.",
            },
        },
        ["Desc"] = "Returns information about the loot event with rollID.",
    },
    ["GetBattlefieldStatInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - Name of the column (eg: Flags Captured)",
            },
            [2] = {
                ["Name"] = "icon",
                ["Desc"] = "String - Icon displayed when on the scoreboard rows (eg: Horde flag icon next to the flag captures of an Alliance player)",
            },
            [3] = {
                ["Name"] = "tooltip",
                ["Desc"] = "String - Tooltip displayed when hovering over a column's name",
            },
        },
        ["Format"] = "GetBattlefieldStatInfo(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Integer - Column to get data for",
            },
        },
        ["Desc"] = "Get list of battleground specific columns on the scoreboard",
    },
    ["GetFriendInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - Friend's name, or nil (if index is invalid)",
            },
            [2] = {
                ["Name"] = "level",
                ["Desc"] = "Integer - Friend's level, or 0 (if offline/invalid).",
            },
            [3] = {
                ["Name"] = "class",
                ["Desc"] = "String - Friend's class, or \"Unknown\" (if offline/invalid).",
            },
            [4] = {
                ["Name"] = "area",
                ["Desc"] = "String - Friend's current location, or \"Unknown\" (if offline/invalid).",
            },
            [5] = {
                ["Name"] = "connected",
                ["Desc"] = "Boolean - 1 if friend is online, nil otherwise.",
            },
            [6] = {
                ["Name"] = "status",
                ["Desc"] = "String - Friend's current status flags (AFK or DND).",
            },
            [7] = {
                ["Name"] = "note",
                ["Desc"] = "String - Friends note.",
            },
        },
        ["Format"] = "name, level, class, area, connected, status, note = GetFriendInfo(friendIndex);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "friendIndex",
                ["Desc"] = "Integer - Index of friend in the friend list (Note that status changes can re-order the friend list, indexes are not guaranteed to remain stable across events) (Also note that index should not be greater than 50 [see Notes]).",
            },
        },
        ["Desc"] = "Retrieves information about a person on your friends list.",
    },
    ["GetBillingTimeRested"] = {
        ["Desc"] = "Returns the time spent logged in in current billing unit. This function is to limit players from playing the game for too long.",
        ["Format"] = "secondsRemaining = GetBillingTimeRested()",
    },
    ["TaxiGetDestX"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "dX",
                ["Desc"] = "Number - The horizontal position of the destination node for the route.",
            },
        },
        ["Format"] = "local dX = TaxiGetDestX(destinationIndex, routeIndex)",
        ["Arguments"] = "(destinationIndex, routeIndex)",
        ["Desc"] = "Returns the horizontal position of the destination node of a given route to the destination.",
    },
    ["GetTrainerSelectionIndex"] = {
        ["Desc"] = "Returns the index of the selected trainer service.",
        ["Format"] = "GetTrainerSelectionIndex();",
    },
    ["GetCompanionInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "creatureID",
                ["Desc"] = "Number - The NPC ID of the companion.",
            },
            [2] = {
                ["Name"] = "creatureName",
                ["Desc"] = "String - The name of the companion.",
            },
            [3] = {
                ["Name"] = "creatureSpellID",
                ["Desc"] = "Number - The spell ID to cast the companion. This is not passed to CallCompanion, but can be used with, e.g., GetSpellInfo.",
            },
            [4] = {
                ["Name"] = "icon",
                ["Desc"] = "String - The texture of the icon for the companion.",
            },
            [5] = {
                ["Name"] = "issummoned",
                ["Desc"] = "Flag - 1 if the companion is summoned, nil if it's not.",
            },
            [6] = {
                ["Name"] = "mountType",
                ["Desc"] = {
                    [1] = {
                        ["Desc"] = "0x1: Ground",
                    },
                    [2] = {
                        ["Desc"] = "0x2: Can fly",
                    },
                    [3] = {
                        ["Desc"] = "0x4:? (set for most mounts)",
                    },
                    [4] = {
                        ["Desc"] = "0x8: Underwater",
                    },
                    [5] = {
                        ["Desc"] = "0x10: Can jump (turtles cannot)",
                    },
                },
            },
        },
        ["Format"] = "creatureID, creatureName, creatureSpellID, icon, issummoned, mountType = GetCompanionInfo(\"type\", id)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "type",
                ["Desc"] = "String - Companion type to query: \"CRITTER\" or \"MOUNT\".",
            },
            [2] = {
                ["Name"] = "id",
                ["Desc"] = "Number - Index of the slot to query. Starting at 1 and going up to GetNumCompanions(\"type\").",
            },
        },
        ["Desc"] = "Returns information about the companions you have.",
    },
    ["UnitInVehicle"] = {
        ["Format"] = "",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "the Unit to check",
            },
        },
        ["Desc"] = "",
    },
    ["GetNumGuildMembers"] = {
        ["Desc"] = "Returns the number of guild members.",
        ["Format"] = "numTotalGuildMembers, numOnlineGuildMembers, numOnlineAndMobileMembers = GetNumGuildMembers();",
    },
    ["RequestBattlegroundInstanceInfo"] = {
        ["Desc"] = "Requests information about the available instances of a particular battleground.",
        ["Format"] = "RequestBattlegroundInstanceInfo(index);",
    },
    ["GetAchievementComparisonInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "completed",
                ["Desc"] = "Boolean - Returns true/false depending on whether the unit has completed the achievement or not.",
            },
            [2] = {
                ["Name"] = "month",
                ["Desc"] = "Number - Month in which the unit has completed the achievement. Returns nil if completed is false.",
            },
            [3] = {
                ["Name"] = "day",
                ["Desc"] = "Number - Day of the month in which the unit has completed the achievement. Returns nil if completed is false.",
            },
            [4] = {
                ["Name"] = "year",
                ["Desc"] = "Number - Year (two digits, 21st century is assumed) in which the unit has completed the achievement. Returns nil if completed is false.",
            },
        },
        ["Format"] = "completed, month, day, year = GetAchievementComparisonInfo(achievementID)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "achievementID",
                ["Desc"] = "Number - ID of the achievement to retrieve information for.",
            },
        },
        ["Desc"] = "Returns information about the comparison unit's achievements.",
    },
    ["InRepairMode"] = {
        ["Desc"] = "InRepairMode()Lets you know if your cursor is in repair mode. When your cursor is in repair mode, you can click on equipped items as well as items in your inventory to repair them.",
        ["Format"] = "repairMode = InRepairMode();",
    },
    ["IsVoiceChatAllowed"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["TogglePVP"] = {
        ["Returns"] = "nil",
        ["Format"] = "TogglePVP();",
        ["Arguments"] = "none",
        ["Desc"] = "Toggles PvP setting on or off.",
    },
    ["UnitCanAssist"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "canAssist",
                ["Desc"] = "Bool - 1 if the unitToAssist can assist the unitToBeAssisted, nil otherwise.",
            },
        },
        ["Format"] = "canAssist = UnitCanAssist(unitToAssist, unitToBeAssisted);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unitToAssist",
                ["Desc"] = "UnitId - the unit that would assist (e.g., \"player\" or \"target\")",
            },
            [2] = {
                ["Name"] = "unitToBeAssisted",
                ["Desc"] = "UnitId - the unit that would be assisted (e.g., \"player\" or \"target\")",
            },
        },
        ["Desc"] = "Indicates whether the first unit can assist the second unit.",
    },
    ["ShowInspectCursor"] = {
        ["Returns"] = "nil",
        ["Format"] = "ShowInspectCursor()",
        ["Arguments"] = "none",
        ["Desc"] = "Change the cursor to the magnifying glass inventory inspection cursor.",
    },
    ["GetTalentInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - Talent name.",
            },
            [2] = {
                ["Name"] = "texture",
                ["Desc"] = "String - Texture path to the talent's icon.",
            },
            [3] = {
                ["Name"] = "tier",
                ["Desc"] = "Number - Talent tier, ascending from 1.",
            },
            [4] = {
                ["Name"] = "column",
                ["Desc"] = "Number - Talent column, ascending from 1.",
            },
            [5] = {
                ["Name"] = "selected",
                ["Desc"] = "Boolean - true if the talent is chosen, false otherwise.",
            },
            [6] = {
                ["Name"] = "available",
                ["Desc"] = "Boolean - true if the talent tier is chosen, or if it is level-appropriate for the player and the player has no talents selected in that tier, false otherwise.",
            },
        },
        ["Format"] = "name, texture, tier, column, selected, available = GetTalentInfo(talentIndex [, isInspect, talentGroup, inspectedUnit, classId])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "talentIndex",
                ["Desc"] = "Number - Index of the talent to query, ascending from 1.",
            },
            [2] = {
                ["Name"] = "isInspect",
                ["Desc"] = "Optional Flag - If non-nil, returns information based on inspectedUnit/classId.",
            },
            [3] = {
                ["Name"] = "talentGroup",
                ["Desc"] = "Optional Number - Index of the specialization group to return information about; if nil, defaults to the currently active specialization group.",
            },
            [4] = {
                ["Name"] = "inspectedUnit",
                ["Desc"] = "Optional String (unitId) - Inspected unit ID; if nil, the selected/available return values will always be false.",
            },
            [5] = {
                ["Name"] = "classId",
                ["Desc"] = "Optional Number (classId) - Class ID to return talent information about; required if isInspect is set.",
            },
        },
        ["Desc"] = "Returns information about a talent.",
    },
    ["BarberShopReset"] = {
        ["Desc"] = "Resets all customization categories to original styles.",
        ["Format"] = "BarberShopReset();",
    },
    ["IsLeftControlKeyDown"] = {
        ["Desc"] = "There are three seperate levels of IsModifierKeyDown() type API functions but they all do the same basic function and return true if the specified key is currently pressed down.The first level is one function to tell you if any of the modifier keys are down IsModifierKeyDown()The second level is the three diferent functions one for each type of Modifier key: Shift, Alt &amp; CtrlThe third is one function for each seperate modifier key: Left Alt, Right Alt, Left Shift, Right Shift, Left Ctrl &amp; Right Ctrl.Is Any Modifier Key DownReturns whether ANY modifier key is currently pressed down.",
        ["Format"] = "anyModKeyIsDown = IsModifierKeyDown();",
    },
    ["GetMaxTalentTier"] = {
        ["Desc"] = "Returns the number of available talent tiers.",
        ["Format"] = "tiers = GetMaxTalentTier()",
    },
    ["GetPetitionInfo"] = {
        ["Desc"] = "Gets the information for a petition being viewed.",
        ["Format"] = "petitionType, title, bodyText, maxSigs, originator, isOriginator, minSigs = GetPetitionInfo()",
    },
    ["IsLeftShiftKeyDown"] = {
        ["Desc"] = "There are three seperate levels of IsModifierKeyDown() type API functions but they all do the same basic function and return true if the specified key is currently pressed down.The first level is one function to tell you if any of the modifier keys are down IsModifierKeyDown()The second level is the three diferent functions one for each type of Modifier key: Shift, Alt &amp; CtrlThe third is one function for each seperate modifier key: Left Alt, Right Alt, Left Shift, Right Shift, Left Ctrl &amp; Right Ctrl.Is Any Modifier Key DownReturns whether ANY modifier key is currently pressed down.",
        ["Format"] = "anyModKeyIsDown = IsModifierKeyDown();",
    },
    ["GetCategoryList"] = {
        ["Desc"] = "Returns the list of Achievement categories.",
        ["Format"] = "idTable = GetCategoryList()",
    },
    ["GetHairCustomization"] = {
        ["Desc"] = "Returns the type of haircut customization available to the character.",
        ["Format"] = "cType = GetHairCustomization();",
    },
    ["SetTradeMoney"] = {
        ["Desc"] = "Sets the amount of money offered as part of the player's trade offer.",
        ["Format"] = "SetTradeMoney(copper);",
    },
    ["ChannelUnban"] = {
        ["Desc"] = "Unbans a player from the specified channel.",
        ["Format"] = "ChannelUnban(channelName, playerName);",
    },
    ["DisplayChannelOwner"] = {
        ["Desc"] = "Displays the name of the owner of the specified channel in the Default Chat Frame. Same as typing \"/owner &lt;channel&gt;\" in chat.",
        ["Format"] = "DisplayChannelOwner(channelName);",
    },
    ["GetNumTitles"] = {
        ["Returns"] = {
            [1] = {
                ["Desc"] = "Number - The last number in the TitleId index.",
            },
        },
        ["Format"] = "",
        ["Arguments"] = "none",
        ["Desc"] = "",
    },
    ["GetSpecializationMasterySpells"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "masterySpell",
                ["Desc"] = "Number - The Mastery spellID corresponding to one of the current player's specializations",
            },
            [2] = {
                ["Name"] = "masterySpell2",
                ["Desc"] = "Number - The Mastery spellID corresponding to one of the current player's specializations",
            },
        },
        ["Format"] = "spellID = GetSpecializationMasterySpells(specIndex[, isInspect[, isPet]]);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "specIndex",
                ["Desc"] = "Integer - The index of the specialization to query (1, 2, 3, 4) (Druids have four specializations)",
            },
            [2] = {
                ["Name"] = "isInspect",
                ["Desc"] = "Boolean - (Optional) Reserved. Must be nil",
            },
            [3] = {
                ["Name"] = "isPet",
                ["Desc"] = "Boolean - (Optional) Reserved. Must be nil",
            },
        },
        ["Desc"] = "Returns the mastery spellID of the current player's specializiation.",
    },
    ["Quit"] = {
        ["Desc"] = "Quits the game.",
        ["Format"] = "Quit()",
    },
    ["CalendarGetEventInfo"] = {
        ["Desc"] = "API CalendarGetEventInfo retrieves the details of an event.",
        ["Format"] = "title, description, creator, eventType, repeatOption, maxSize, textureIndex, weekday, month, day, year, hour, minute, lockoutWeekday, lockoutMonth, lockoutDay, lockoutYear, lockoutHour, lockoutMinute, locked, autoApprove, pendingInvite, inviteStatus, inviteType, calendarType = CalendarGetEventInfo( );",
    },
    ["GetNumQuestLogChoices"] = {
        ["Desc"] = "Returns the number of options someone has when getting a quest item.",
        ["Format"] = "GetNumQuestLogChoices();",
    },
    ["AddAutoQuestPopUp"] = {
        ["Desc"] = "Adds a popup notification to the objectives tracker, showing that a quest is available or completed.",
        ["Format"] = "AddAutoQuestPopUp(questID, type)",
    },
    ["SetDungeonDifficultyID"] = {
        ["Desc"] = "Changes the player's current dungeon difficulty.",
        ["Format"] = "SetDungeonDifficultyID(difficultyIndex)",
    },
    ["GetGuildTradeSkillInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "skillID",
                ["Desc"] = "Number - The ID for the tradeskill",
            },
            [2] = {
                ["Name"] = "isCollapsed",
                ["Desc"] = "Boolean? - If the tradeskill is a header, whether or not it is expanded in the guild UI",
            },
            [3] = {
                ["Name"] = "iconTexture",
                ["Desc"] = "String - The icon for the tradeskill",
            },
            [4] = {
                ["Name"] = "headerName",
                ["Desc"] = "String - If the tradeskill is a header, this is the text (\"Alchemy\", \"Jewelcrafting\", etc)",
            },
            [5] = {
                ["Name"] = "numOnline",
                ["Desc"] = "Number - If the tradeskill is not a header, this is the number of characters in the guild who have this tradeskill and are online",
            },
            [6] = {
                ["Name"] = "numPlayers",
                ["Desc"] = "Number - If the tradeskill is not a header, this is the number of characters in the guild who have this tradeskill",
            },
            [7] = {
                ["Name"] = "playerName",
                ["Desc"] = "String - If the tradeskill is not a header, this is the name of the character who has this tradeskill",
            },
            [8] = {
                ["Name"] = "playerNameWithRealm",
                ["Desc"] = "String - Same as playerName but includes realm, as \"name-realm\" (with embedded spaces removed)",
            },
            [9] = {
                ["Name"] = "class",
                ["Desc"] = "String - If the tradeskill is not a header, this is the (localized?) class of the character who has the tradeskill",
            },
            [10] = {
                ["Name"] = "online",
                ["Desc"] = "Boolean - If the tradeskill is not a header, this is whether or not the character who has the tradeskill is online",
            },
            [11] = {
                ["Name"] = "zone",
                ["Desc"] = "String - If the tradeskill is not a header, this is the zone the character who has the tradeskill is currently in",
            },
            [12] = {
                ["Name"] = "skill",
                ["Desc"] = "String - The name of the tradeskill",
            },
            [13] = {
                ["Name"] = "classFileName",
                ["Desc"] = "String - If the tradeskill is not a header, this is the class of the character who has the tradeskill",
            },
            [14] = {
                ["Name"] = "isMobile",
                ["Desc"] = "?",
            },
        },
        ["Format"] = "skillID, isCollapsed, iconTexture, headerName, numOnline, numPlayers, playerName, playerNameWithRealm, class, online, zone, skill, classFileName, isMobile = GetGuildTradeSkillInfo(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - The index of the tradeskill from GetNumGuildTradeSkill().",
            },
        },
        ["Desc"] = "Returns information about a guild tradeskill",
    },
    ["GetInstanceInfo"] = {
        ["Desc"] = "Returns information about the instance the player is currently in.",
        ["Format"] = "name, instanceType, difficultyID, difficultyName, maxPlayers, dynamicDifficulty, isDynamic, instanceMapID, instanceGroupSize = GetInstanceInfo()",
    },
    ["GetLocale"] = {
        ["Desc"] = "Returns information about the client locale.",
        ["Format"] = "locale = GetLocale();",
    },
    ["SignPetition"] = {
        ["Returns"] = "nil",
        ["Format"] = "SignPetition()",
        ["Arguments"] = "None",
        ["Desc"] = "Adds the player's signature to the currently viewed petition.",
    },
    ["ConsoleExec"] = {
        ["Desc"] = "Execute a console command.",
        ["Format"] = "ConsoleExec( \"command\" );",
    },
    ["GetAttackPowerForStat"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "ap",
                ["Desc"] = "Number - Amount of attack power granted by the specified amount of the specified stat.",
            },
        },
        ["Format"] = "ap = GetAttackPowerForStat(statId, amount)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "statId",
                ["Desc"] = "Number - Index of the stat (Strength, Agility, ...) to check the bonus AP of.",
            },
            [2] = {
                ["Name"] = "amount",
                ["Desc"] = "Number - Amount of the stat to check the AP value of.",
            },
        },
        ["Desc"] = "Returns attack power granted by particular amount of a particular stat.",
    },
    ["GetLFGRoleUpdateSlot"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["DeleteCursorItem"] = {
        ["Desc"] = "Destroys the item currently held by the cursor.",
        ["Format"] = "DeleteCursorItem();",
    },
    ["UnitHealth"] = {
        ["Desc"] = "Returns the current health of the specified unit.",
        ["Format"] = "local health = UnitHealth(unit);",
    },
    ["GetPVPYesterdayStats"] = {
        ["Returns"] = "hk, dk, contribution",
        ["Format"] = "hk, dk, contribution = GetPVPYesterdayStats()",
        ["Arguments"] = "none",
        ["Desc"] = "Gets the player's PVP contribution statistics for the previous day.",
    },
    ["ItemTextGetPage"] = {
        ["Returns"] = "pageNum",
        ["Format"] = "pageNum = ItemTextGetPage()",
        ["Arguments"] = "()",
        ["Desc"] = "Get the number of the current item text page.",
    },
    ["GetLFGQueueStats"] = {
        ["Desc"] = "Returns the current state and wait times for being in queue.",
        ["Format"] = "hasData, leaderNeeds, tankNeeds, healerNeeds, dpsNeeds, totalTanks, totalHealers, totalDPS, instanceType, instanceSubType, instanceName, averageWait, tankWait, healerWait, dpsWait, myWait, queuedTime, activeID = GetLFGQueueStats(category[, activeID])",
    },
    ["AcceptLevelGrant"] = {
        ["Desc"] = "Accepts a recruit-a-friend level grant proposal.",
        ["Format"] = "AcceptLevelGrant();",
    },
    ["GetCombatRating"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "rating",
                ["Desc"] = "Number - the actual rating for the combat rating; e.g. 63",
            },
        },
        ["Format"] = "rating = GetCombatRating(combatRatingIdentifier)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "combatRatingIdentifier",
                ["Desc"] = "Number - A combat rating identifier from PaperDollFrame.lua, one of:CR_UNUSED_1 = 1; (Formerly CR_WEAPON_SKILL. Removed in 6.0.2)CR_DEFENSE_SKILL = 2;CR_DODGE = 3;CR_PARRY = 4;CR_BLOCK = 5;CR_HIT_MELEE = 6;CR_HIT_RANGED = 7;CR_HIT_SPELL = 8;CR_CRIT_MELEE = 9;CR_CRIT_RANGED = 10;CR_CRIT_SPELL = 11;CR_MULTISTRIKE = 12; (Formerly CR_HIT_TAKEN_MELEE. Changed in 6.0.2)CR_READINESS = 13; (Formerly CR_HIT_TAKEN_RANGED. Changed in 6.0.2)CR_SPEED = 14; (Formerly CR_HIT_TAKEN_SPELL. Changed in 6.0.2)COMBAT_RATING_RESILIENCE_CRIT_TAKEN = 15;COMBAT_RATING_RESILIENCE_PLAYER_DAMAGE_TAKEN = 16;CR_LIFESTEAL = 17; (Formerly CR_CRIT_TAKEN_SPELL. Changed in 6.0.2)CR_HASTE_MELEE = 18;CR_HASTE_RANGED = 19;CR_HASTE_SPELL = 20;CR_AVOIDANCE = 21; (Formerly CR_WEAPON_SKILL_MAINHAND. Changed in 6.0.2)CR_UNUSED_2 = 22; (Formerly CR_WEAPON_SKILL_OFFHAND. Removed in 6.0.2)CR_WEAPON_SKILL_RANGED = 23;CR_EXPERTISE = 24;CR_ARMOR_PENETRATION = 25;CR_MASTERY = 26;CR_UNUSED_3 = 27; (Formerly CR_PVP_POWER. Removed in 6.0.2)CR_UNUSED_4 = 28;CR_VERSATILITY_DAMAGE_DONE = 29;CR_VERSATILITY_DAMAGE_TAKEN = 31;",
            },
        },
        ["Desc"] = "Returns the number of points of a specific combat rating the player has.",
    },
    ["HasFullControl"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "hasControl",
                ["Desc"] = "Boolean - Whether the player has full control",
            },
        },
        ["Format"] = "hasControl = HasFullControl()",
        ["Arguments"] = "none",
        ["Desc"] = "Checks whether you have full control over your character (i.e. you are not feared, etc).",
    },
    ["MoveViewRightStop"] = {
        ["Returns"] = "Nothing",
        ["Format"] = "MoveViewRightStop()",
        ["Arguments"] = "None",
        ["Desc"] = "Stops rotating the camera to the Right.",
    },
    ["ExpandFactionHeader"] = {
        ["Returns"] = "nil",
        ["Format"] = "ExpandFactionHeader(rowIndex)",
        ["Arguments"] = "(rowIndex)",
        ["Desc"] = "Expand a faction header row.",
    },
    ["SetTaxiMap"] = {
        ["Returns"] = "nil",
        ["Format"] = "SetTaxiMap(texture)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "texture",
                ["Desc"] = "String - The path to the texture to use for the taxi map.",
            },
        },
        ["Desc"] = "Sets the texture to use for the taxi map.",
    },
    ["GetTalentRowSelectionInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isFree",
                ["Desc"] = "Boolean - true if the player has not yet made a selection in the queried tier; false otherwise. (Experience has shown that isFree can be returned true when in fact a talent has been selected; this could occur if the default for isFree is true and Blizzard has not set or updated the isFree flag before the API call is made. Making the call again after isFree is returned true usually produces the correct outcome, unless the call is made immediately.)",
            },
            [2] = {
                ["Name"] = "talent",
                ["Desc"] = "Number - the selected talent's index if a selection has been made; nil otherwise. The index is relative to the start of the table of talent data. That is, each tier has three talents: index = 1 is the first talent of the first tier; index = 4 is the first talent of the second tier; ... index = 16 is the first talent of the sixth tier.",
            },
        },
        ["Format"] = "isFree, talent = GetTalentRowSelectionInfo(tier)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "tier",
                ["Desc"] = "Number - Index of the talent tier to query, ascending from 1.",
            },
        },
        ["Desc"] = "Returns information about the player's talent selection in the specified talent tier.",
    },
    ["SetRaidSubgroup"] = {
        ["Desc"] = "Move a raid member from his current subgroup into a different (non-full) subgroup.",
        ["Format"] = "SetRaidSubgroup(index, subgroup);",
    },
    ["CalendarOpenEvent"] = {
        ["Desc"] = "Establishes an event for future calendar calls",
        ["Format"] = "CalendarOpenEvent(monthOffset, day, eventIndex)",
    },
    ["GetCorpseMapPosition"] = {
        ["Desc"] = "Returns the postion of the player's corpse on the current map",
        ["Format"] = "posX, posY = GetCorpseMapPosition();",
    },
    ["GetAccountExpansionLevel"] = {
        ["Desc"] = "Returns the highest expansion id the current account has been flagged for.",
        ["Format"] = "expansionLevel = GetAccountExpansionLevel()",
    },
    ["BuyGuildCharter"] = {
        ["Desc"] = "Purchase a Guild Charter.",
        ["Format"] = "BuyGuildCharter(\"guildName\")",
    },
    ["GetBattlegroundInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - Localized battleground name.",
            },
            [2] = {
                ["Name"] = "canEnter",
                ["Desc"] = "Flag - 1 if the player can queue for this battleground, nil otherwise.",
            },
            [3] = {
                ["Name"] = "isHoliday",
                ["Desc"] = "Flag - 1 if this battleground is currently granting bonus honor due to a battleground holiday, nil otherwise.",
            },
            [4] = {
                ["Name"] = "isRandom",
                ["Desc"] = "Flag - 1 if this battleground is the random",
            },
            [5] = {
                ["Name"] = "battleGroundID",
                ["Desc"] = "Number - the ID associated with the Battleground ( 1 for Alterac Valley, 2 for Warsong Gulch, 3 for Arathi Basin, 7 for Eye of the Storm, 9 for Strand of the Ancients, 30 for Isle of Conquest, 32 for the random, 108 for Twin Peaks and 120 for The Battle for Gilneas)",
            },
            [6] = {
                ["Name"] = "info",
                ["Desc"] = "String - Localized information about the battleground (for the random battleground it returns the string of Alterac).",
            },
        },
        ["Format"] = "name, canEnter, isHoliday, isRandom, battleGroundID, info = GetBattlegroundInfo(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number: battleground type index, 1 to GetNumBattlegroundTypes().",
            },
        },
        ["Desc"] = "Returns information about a battleground type.",
    },
    ["EJ_GetCreatureInfo"] = {
        ["Format"] = "id, name, description, displayInfo, iconImage = EJ_GetCreatureInfo(index[, encounterID])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - Creature Index (1 - 6). Encounters mostly have a single \"Creature\", but can support up to 6 Creatures",
            },
            [2] = {
                ["Name"] = "encounterID",
                ["Desc"] = "Number - Encounter ID. If omitted, this will default to the Encounter ID of the currently viewed Encounter",
            },
        },
        ["Desc"] = "Returns Boss / Creature info [1]",
    },
    ["forceinsecure"] = {
        ["Desc"] = "Taints the current execution path.",
        ["Format"] = "forceinsecure()",
    },
    ["GetGuildBankMoney"] = {
        ["Desc"] = "Returns the amount of money in the guild bank in copper.",
        ["Format"] = "retVal1 = GetGuildBankMoney()",
    },
    ["GetFactionInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - Name of the faction",
            },
            [2] = {
                ["Name"] = "description",
                ["Desc"] = "String - Description of the faction, as shown in the detail pane that appears when you click on the faction row",
            },
            [3] = {
                ["Name"] = "standingID",
                ["Desc"] = "Number (StandingId) - Index of the player's current standing (eg. 4 for Neutral, 5 for Friendly, etc.) with the faction",
            },
            [4] = {
                ["Name"] = "barMin",
                ["Desc"] = "Number - Minimum reputation required to reach the current standing (0 for Neutral, 3000 for Friendly, etc.)",
            },
            [5] = {
                ["Name"] = "barMax",
                ["Desc"] = "Number - Maximum reputation that can be earned with the faction before graduating to the next standing (3000 for Neutral, 6000 for Friendly, etc.)",
            },
            [6] = {
                ["Name"] = "barValue",
                ["Desc"] = "Number - Total reputation the player has earned with the faction (starting from 0 at the beginning of Neutral, so a player who is 1500/6000 Friendly would have 3000 for Neutral + 1500 into Friendly for a total reputation of 4500)",
            },
            [7] = {
                ["Name"] = "atWarWith",
                ["Desc"] = "Flag - 1 if the player is at war with the faction, nil otherwise",
            },
            [8] = {
                ["Name"] = "canToggleAtWar",
                ["Desc"] = "Flag - 1 if the player can toggle the \"At War\" checkbox for the faction, nil otherwise",
            },
            [9] = {
                ["Name"] = "isHeader",
                ["Desc"] = "Flag - 1 if the faction is a header (collapsible group title, eg. Cataclysm, Horde Forces, or Valiance Expedition), nil otherwise",
            },
            [10] = {
                ["Name"] = "isCollapsed",
                ["Desc"] = "Flag - 1 if the faction is a header and is currently collapsed, nil otherwise",
            },
            [11] = {
                ["Name"] = "hasRep",
                ["Desc"] = "Flag - 1 if the faction is a header and has its own reputation (eg. The Tillers), nil otherwise",
            },
            [12] = {
                ["Name"] = "isWatched",
                ["Desc"] = "Flag - 1 if the \"Show as Experience Bar\" checkbox for the faction is currently checked, nil otherwise",
            },
            [13] = {
                ["Name"] = "isChild",
                ["Desc"] = "Flag - 1 if the faction is a second-level header (eg. Sholazar Basin) or is the child of a second-level header (eg. The Oracles), nil otherwise",
            },
            [14] = {
                ["Name"] = "factionID (New in 5.0)",
                ["Desc"] = "Number (FactionID) - Unique numeric identifier for the faction",
            },
            [15] = {
                ["Name"] = "hasBonusRepGain (New in 5.2)",
                ["Desc"] = "Flag - 1 if the player has purchased a Grand Commendation to unlock bonus reputation gains with this faction, nil otherwise",
            },
            [16] = {
                ["Name"] = "canBeLFGBonus (New in 5.2)",
                ["Desc"] = "Flag - 1 if the player can select the faction for earning bonus reputation through the LFG system, nil otherwise",
            },
        },
        ["Format"] = "name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain, canBeLFGBonus = GetFactionInfo(factionIndex)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "factionIndex",
                ["Desc"] = "Number - Index of the faction to query. Indices correspond to the rows currently displayed in the player's reptuation pane, and include headers, but do not include factions that are not currently displayed because their parent header is collapsed.",
            },
        },
        ["Desc"] = "Returns information about the specified faction or faction header in the player's reputation pane.",
    },
    ["GetCursorPosition"] = {
        ["Desc"] = "Returns the cursor's position on the screen.",
        ["Format"] = "x, y = GetCursorPosition()",
    },
    ["GetGuildTabardFileNames"] = {
        ["Desc"] = "Returns file names of tabard textures used in guild bank logo.",
        ["Format"] = "local tabardBackgroundUpper, tabardBackgroundLower, tabardEmblemUpper, tabardEmblemLower, tabardBorderUpper, tabardBorderLower = GetGuildTabardFileNames();",
    },
    ["IsGuildLeader"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "guildleader",
                ["Desc"] = "1 if the player is a guild master, otherwise false.",
            },
        },
        ["Format"] = "",
        ["Arguments"] = "none",
        ["Desc"] = "",
    },
    ["GetNumPetitionNames"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "numNames",
                ["Desc"] = "Number - The number of names that have signed the petition",
            },
        },
        ["Format"] = "local numNames = GetNumPetitionNames()",
        ["Arguments"] = "None",
        ["Desc"] = "Gets the number of names that have signed the open petition.",
    },
    ["GetDungeonDifficultyID"] = {
        ["Desc"] = "Returns the player's currently selected dungeon difficulty.",
        ["Format"] = "difficultyID = GetDungeonDifficultyID()",
    },
    ["GetBindingKey"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "key1-N",
                ["Desc"] = "(string) The string representation of the key bound to this command (e.g. W, UP). Even though the default key binding GUI window only displays 2 possible keys bound to each command, it appears there is no limit to the number of keys that can be bound to a single command. This function will return as many keys as have been set with SetBinding(\"key\"{,\"command\"}). If no keys are bound to the action, it will return nil.",
            },
        },
        ["Format"] = "key1, key2 = GetBindingKey(command)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "command",
                ["Desc"] = "The name of the command to get key bindings for (e.g. MOVEFORWARD, TOGGLEFRIENDSTAB)",
            },
        },
        ["Desc"] = "Returns all keys currently bound to the command specified by command. This function is almost identical to GetBinding(index) except it takes the command name as an argument instead of the index and doesn't return the command name along with the key bindings.",
    },
    ["GetAutoQuestPopUp"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "questID",
                ["Desc"] = "Integer - the quest id",
            },
            [2] = {
                ["Name"] = "type",
                ["Desc"] = "String - Notification type. One of \"OFFER\" (new quest added) or \"COMPLETE\" (quest finished).",
            },
        },
        ["Format"] = "questID, type = GetAutoQuestPopUp(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Integer - which popup to get information about, between 1 and GetNumAutoQuestPopUps()",
            },
        },
        ["Desc"] = "Returns information about a popup quest notification.",
    },
    ["GetFramerate"] = {
        ["Desc"] = "Retrieve the current framerate (frames / second).",
        ["Format"] = "local framerate = GetFramerate();",
    },
    ["PickupMerchantItem"] = {
        ["Desc"] = "Places the specified merchant item on the cursor.",
        ["Format"] = "PickupMerchantItem(index);",
    },
    ["GetMaxBattlefieldID"] = {
        ["Desc"] = "Returns the max number of battlefields you can queue for [1]",
        ["Format"] = "maxBattlefieldID = GetMaxBattlefieldID()",
    },
    ["IsSpellKnown"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isKnown",
                ["Desc"] = "boolean - whether the player (or pet) knows the given spell",
            },
        },
        ["Format"] = "",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "spellID",
                ["Desc"] = "integer - the spell ID number",
            },
            [2] = {
                ["Name"] = "isPetSpell",
                ["Desc"] = "boolean (optional) - if true, will check if the currently active pet knows the spell; if false or omitted, will check if the player knows the spell",
            },
        },
        ["Desc"] = "",
    },
    ["EJ_GetLootInfoByIndex"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - Item name, including quality color escape sequence.",
            },
            [2] = {
                ["Name"] = "icon",
                ["Desc"] = "String - Item icon texture path.",
            },
            [3] = {
                ["Name"] = "slot",
                ["Desc"] = "String - Equipment slot (e.g. \"Two-Hand\"), or an empty string if item cannot be equipped.",
            },
            [4] = {
                ["Name"] = "armorType",
                ["Desc"] = "String - Armor / Weapon Type (e.g. \"Staff\"), or an empty string if the item cannot be equipped.",
            },
            [5] = {
                ["Name"] = "itemID",
                ["Desc"] = "Number - Item ID.",
            },
            [6] = {
                ["Name"] = "link",
                ["Desc"] = "String - Item Link",
            },
            [7] = {
                ["Name"] = "encounterID",
                ["Desc"] = "Number - encounter ID this item can be acquired from.",
            },
        },
        ["Format"] = "name, icon, slot, armorType, itemID, link, encounterID = EJ_GetLootInfoByIndex(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - drop index, ascending from 1 to EJ_GetNumLoot",
            },
        },
        ["Desc"] = "Returns information about a drop from the current encounter.",
    },
    ["EJ_GetCurrentInstance"] = {
        ["Desc"] = "Returns the Instance ID of your character's current location [1]",
        ["Format"] = "instanceID = EJ_GetCurrentInstance()",
    },
    ["GetBackpackCurrencyInfo"] = {
        ["Desc"] = "Returns information about a currency item currently being shown as part of the backpack.",
        ["Format"] = "name, count, icon, currencyID = GetBackpackCurrencyInfo(index)",
    },
    ["GetTradeSkillItemLink"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "link",
                ["Desc"] = "String - An item link string (color coded with href) which can be included in chat messages to represent the item which the trade skill creates.",
            },
        },
        ["Format"] = "link = GetTradeSkillItemLink(skillId)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "skillId",
                ["Desc"] = "Integer - The Id specifying which trade skill's link to get. Trade Skill window must be open for this to work. Indexes start at 1 which is the general category of the tradeskill, if you have selected a sub-group of trade skills then 1 will be the name of that sub-group.",
            },
        },
        ["Desc"] = "Gets the link string for a trade skill item.",
    },
    ["GetInboxItem"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - The localized name of the item",
            },
            [2] = {
                ["Name"] = "texture",
                ["Desc"] = "String - The path to the icon texture for the item",
            },
            [3] = {
                ["Name"] = "count",
                ["Desc"] = "Integer - The number of items in the stack",
            },
            [4] = {
                ["Name"] = "quality",
                ["Desc"] = "Integer - The quality index of the item",
            },
            [5] = {
                ["Name"] = "canUse",
                ["Desc"] = "Flag - 1 if the player can use the item, or nil otherwise",
            },
        },
        ["Format"] = "name, texture, count, quality, canUse = GetInboxItem(index, itemIndex)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Integer - The index of the message to query, in the range [1,GetInboxNumItems()]",
            },
            [2] = {
                ["Name"] = "itemIndex",
                ["Desc"] = "Integer - The index of the item to query, in the range [1,ATTACHMENTS_MAX_RECEIVE]",
            },
        },
        ["Desc"] = "Provides information about an item attached to a message in the player's mailbox.",
    },
    ["UnitIsVisible"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["SortGuildRoster"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["GetXPExhaustion"] = {
        ["Desc"] = "Returns the number of XP gained from killing mobs until \"player\" goes from rest state to normal state.",
        ["Format"] = "retVal = GetXPExhaustion()",
    },
    ["UnitDefense"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["IsMacClient"] = {
        ["Desc"] = "Checks to see if client is running on a Macintosh.",
        ["Format"] = "isMac = IsMacClient();",
    },
    ["GetQuestReward"] = {
        ["Desc"] = "Completes the quest with the specified quest reward.Warning: Since making a choice here is irrevocable, use with caution.",
        ["Format"] = "GetQuestReward(itemChoice);",
    },
    ["GetAuctionItemInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "a string containing the name of the item",
            },
            [2] = {
                ["Name"] = "texture",
                ["Desc"] = "a string containing the name of the texture of the item",
            },
            [3] = {
                ["Name"] = "count",
                ["Desc"] = "a number containing the number of items in the auction item, zero if item is \"sold\" in the \"owner\" auctions",
            },
            [4] = {
                ["Name"] = "quality",
                ["Desc"] = "an index into the ITEM_QUALITY_COLORS array",
            },
            [5] = {
                ["Name"] = "canUse",
                ["Desc"] = "a boolean, true if the user can use the item, false if not",
            },
            [6] = {
                ["Name"] = "level",
                ["Desc"] = "a number referring to the level required to use the item",
            },
            [7] = {
                ["Name"] = "levelColHeader",
                ["Desc"] = "the text of the level column header that appears in the browse tag (?)",
            },
            [8] = {
                ["Name"] = "minBid",
                ["Desc"] = "the starting bid price",
            },
            [9] = {
                ["Name"] = "minIncrement",
                ["Desc"] = "the minimum amount of item at which to put the next bid",
            },
            [10] = {
                ["Name"] = "buyoutPrice",
                ["Desc"] = "zero if no buy out, otherwise it contains the buyout price of the auction item",
            },
            [11] = {
                ["Name"] = "bidAmount",
                ["Desc"] = "the current highest bid, zero if no one has bid yet",
            },
            [12] = {
                ["Name"] = "highBidder",
                ["Desc"] = "a boolean that is true if the current player is the highest bidder, otherwise nil",
            },
            [13] = {
                ["Name"] = "bidderFullName",
                ["Desc"] = "String - returns bidders full name if from virtual realm, nil otherwise",
            },
            [14] = {
                ["Name"] = "owner",
                ["Desc"] = "the player that is selling the item",
            },
            [15] = {
                ["Name"] = "ownerFullName",
                ["Desc"] = "String - returns owners full name if from virtual realm, nil otherwise",
            },
            [16] = {
                ["Name"] = "saleStatus",
                ["Desc"] = "1 for sold 0 for unsold",
            },
            [17] = {
                ["Name"] = "itemId",
                ["Desc"] = "item id",
            },
            [18] = {
                ["Name"] = "hasAllInfo",
                ["Desc"] = "?everything was returned?",
            },
        },
        ["Format"] = "name, texture, count, quality, canUse, level, levelColHeader, minBid, minIncrement, buyoutPrice, bidAmount, highBidder, bidderFullName, owner, ownerFullName, saleStatus, itemId, hasAllInfo = GetAuctionItemInfo(\"type\",index);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "type",
                ["Desc"] = {
                    [1] = {
                        ["Desc"] = "\"list\" - An item up for auction, the \"Browse\" tab in the dialog.\"bidder\" - An item the player has bid on, the \"Bids\" tab in the dialog.\"owner\" - An item the player has up for auction, the \"Auctions\" tab in the dialog.",
                    },
                },
            },
            [2] = {
                ["Name"] = "index",
                ["Desc"] = "Integer - The index of the item in the list to retrieve info from (normally 1-50, inclusive)",
            },
        },
        ["Desc"] = "Retrieves info about one item in the current retrieved list of items from the Auction House.",
    },
    ["GetInventoryItemTexture"] = {
        ["Returns"] = "texture",
        ["Format"] = "texture = GetInventoryItemTexture(\"unit\", slotId)",
        ["Arguments"] = "(\"unit\", slotId)",
        ["Desc"] = "Return the texture for an inventory item.",
    },
    ["QuestIsDaily"] = {
        ["Desc"] = "Returns whether the currently offered quest is a daily quest.",
        ["Format"] = "isDaily = QuestIsDaily();",
    },
    ["FillLocalizedClassList"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "classTable",
                ["Desc"] = "Table - The table you parsed as argument (now filled with class names).",
            },
        },
        ["Format"] = "FillLocalizedClassList(classTable[, isFemale])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "classTable",
                ["Desc"] = "Table - The table you want to be filled with the data (does not have to be an empty table).",
            },
            [2] = {
                ["Name"] = "isFemale",
                ["Desc"] = "Boolean - If true the table will be filled with female class names.",
            },
        },
        ["Desc"] = "Fills a table with localized class names, callable with localization-independent class IDs.",
    },
    ["IsFishingLoot"] = {
        ["Desc"] = "This function is only for determining if the loot window is related to fishing.ReturnsisTrueBoolean - is it trueExampleThis will identify that the loot window should display the fish graphic, then play the sound and update the image.",
        ["Format"] = "if( IsFishingLoot() ) then PlaySound(\"FISHING REEL IN\"); LootFramePortraitOverlay:SetTexture(\"Interface\\\\LootFrame\\\\FishingLoot-Icon\");end",
    },
    ["GetBuybackItemInfo"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["GetReforgeItemInfo"] = {
        ["Desc"] = "Returns info about the reforge item [1]",
        ["Format"] = "currentReforge, icon, name, quality, bound, cost = GetReforgeItemInfo()",
    },
    ["GetQuestLogTimeLeft"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "questTimer",
                ["Desc"] = "Number - The seconds remaining to finish the timed quest.",
            },
        },
        ["Format"] = "local questTimer = GetQuestLogTimeLeft()",
        ["Arguments"] = "None",
        ["Desc"] = "Gets the seconds left for the current quest that is being timed.",
    },
    ["AutoEquipCursorItem"] = {
        ["Desc"] = "Automatically equips the item currently held on the cursor.",
        ["Format"] = "AutoEquipCursorItem();",
    },
    ["GetTrainerServiceLevelReq"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "reqLevel",
                ["Desc"] = "Number - The required level (for pet or player) to learn the skill.",
            },
        },
        ["Format"] = "local reqLevel = GetTrainerServiceLevelReq(id)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "id",
                ["Desc"] = "Number - Index of the trainer service to retrieve information about. Note that indices are affected by the trainer filter. (See GetTrainerServiceTypeFilter and SetTrainerServiceTypeFilter.)",
            },
        },
        ["Desc"] = "Gets the required level to learn a skill from the trainer.",
    },
    ["RenamePetition"] = {
        ["Returns"] = "nil",
        ["Format"] = "RenamePetition(\"name\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - The new name of the group being created by the petition",
            },
        },
        ["Desc"] = "Renames the group being created by the current petition.",
    },
    ["CreateFont"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "fontObject",
                ["Desc"] = "Widget - the created Font object.",
            },
        },
        ["Format"] = "fontObject = CreateFont(\"name\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - name of the new font object.",
            },
        },
        ["Desc"] = "Creates a font object.",
    },
    ["PartialPlayTime"] = {
        ["Desc"] = "Returns whether the current billing unit is considered \"tired\" or not. This function is to limit players from playing the game for too long.",
        ["Format"] = "isTired = NoPlayTime()",
    },
    ["IsPetAttackActive"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["GetSpecializationRoleByID"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "roleToken",
                ["Desc"] = "String - One of \"DAMAGER\", \"TANK\", \"HEALER\"; nil if specID is invalid.",
            },
        },
        ["Format"] = "roleToken = GetSpecializationRoleByID(specID)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "specID",
                ["Desc"] = "Number - Specialization ID, as returned by GetSpecializationInfo or GetInspectSpecialization.",
            },
        },
        ["Desc"] = "Returns the role a specialization is intended to perform.",
    },
    ["Logout"] = {
        ["Desc"] = "Logs you out of the game.",
        ["Format"] = "Logout()",
    },
    ["GetStatistic"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "value",
                ["Desc"] = "String - The value of the requested Statistic.",
            },
        },
        ["Format"] = "value = GetStatistic(achievementID)",
        ["Arguments"] = "(achievementID)",
        ["Desc"] = "Return the value of the requested Statistic.",
    },
    ["ShowHelm"] = {
        ["Desc"] = "Enables or disables display of your helm.",
        ["Format"] = "ShowHelm(flag);",
    },
    ["securecall"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "...",
                ["Desc"] = "Any - the function's return values.",
            },
        },
        ["Format"] = "... = securecall(func or \"functionName\", ...)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "func / functionName",
                ["Desc"] = "Function / String - function to call, either a direct reference or a string used as a key into _G.",
            },
            [2] = {
                ["Name"] = "...",
                ["Desc"] = "Any - any number of arguments to pass the function.",
            },
        },
        ["Desc"] = "Calls the specified function without propagating taint to the caller.",
    },
    ["UnitAura"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - name of the aura",
            },
            [2] = {
                ["Name"] = "rank",
                ["Desc"] = "String - rank of the spell or effect that caused the aura, or an empty string if there is no rank",
            },
            [3] = {
                ["Name"] = "icon",
                ["Desc"] = "String - path to the texture file used for the aura's icon",
            },
            [4] = {
                ["Name"] = "count",
                ["Desc"] = "Number - number of times the aura has been applied to the target, or 0 for auras that do not stack",
            },
            [5] = {
                ["Name"] = "debuffType",
                ["Desc"] = "String - type of the aura (\"Magic\", \"Disease\", \"Poison\", \"Curse\", or an empty string for Enrage effects), or nil for auras that do not have a type",
            },
            [6] = {
                ["Name"] = "duration",
                ["Desc"] = "Number - full duration of the aura in seconds",
            },
            [7] = {
                ["Name"] = "expirationTime",
                ["Desc"] = "Number - time in seconds (comparable to GetTime()) when the aura will expire",
            },
            [8] = {
                ["Name"] = "unitCaster",
                ["Desc"] = "String (unitId) - unit that applied the aura, or nil if no valid unit token currently represents the caster",
            },
            [9] = {
                ["Name"] = "canStealOrPurge",
                ["Desc"] = "Flag - 1 for buffs that can be stolen by mages with  [Spellsteal], or nil for debuffs and for buffs that cannot be stolen, or for debuffs",
            },
            [10] = {
                ["Name"] = "shouldConsolidate",
                ["Desc"] = "Flag - 1 for buffs that default Blizzard UI will display in the buff consolidation box, or nil for debuffs and for buffs that the default UI will not consolidate",
            },
            [11] = {
                ["Name"] = "spellId",
                ["Desc"] = "Number - spell ID of the spell or effect that applied the aura",
            },
            [12] = {
                ["Name"] = "canApplyAura",
                ["Desc"] = "Boolean - true for auras the player can apply (not necessarily if the player did apply the aura, just if the player can apply the aura)",
            },
            [13] = {
                ["Name"] = "isBossDebuff",
                ["Desc"] = "Boolean - true for auras applied by a boss",
            },
            [14] = {
                ["Name"] = "isCastByPlayer",
                ["Desc"] = "Boolean - true for auras applied by players",
            },
            [15] = {
                ["Name"] = "...",
                ["Desc"] = "Additional values pertinent to specific aura (HoTs, traps, amounts etc. For example, the first value for  [Vengeance] is its attack power bonus.)",
            },
        },
        ["Format"] = "name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, canStealOrPurge, shouldConsolidate, spellId, canApplyAura, isBossDebuff, isCastByPlayer, ... = UnitAura(\"unit\", index[, \"filter\"])or UnitAura(\"unit\", \"name\", \"rank\"[, \"filter\"])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String (unitId) - unit whose auras to query.",
            },
            [2] = {
                ["Name"] = "index or name",
                ["Desc"] = "Number or String - index (from 1 to 40) or name of the aura to query.",
            },
            [3] = {
                ["Name"] = "rank",
                ["Desc"] = "String (optional) - rank of the aura to query; only available in combination with name.",
            },
            [4] = {
                ["Name"] = "filter",
                ["Desc"] = {
                    [1] = {
                        ["Desc"] = "HELPFUL - buffs.",
                    },
                    [2] = {
                        ["Desc"] = "HARMFUL - debuffs.",
                    },
                    [3] = {
                        ["Desc"] = "PLAYER - auras that were applied by the player.",
                    },
                    [4] = {
                        ["Desc"] = "RAID - auras that can be applied (if HELPFUL) or dispelled (if HARMFUL) by the player.",
                    },
                    [5] = {
                        ["Desc"] = "CANCELABLE - buffs that can be removed (such as by right-clicking or using the /cancelaura command)",
                    },
                    [6] = {
                        ["Desc"] = "NOT_CANCELABLE - buffs that cannot be removed",
                    },
                },
            },
        },
        ["Desc"] = "Returns information about a buff or debuff on the specified unit.",
    },
    ["GetTrainerServiceIcon"] = {
        ["Desc"] = "Returns the icon texture for a particular trainer service.",
        ["Format"] = "icon = GetTrainerServiceIcon(id);",
    },
    ["GetAuctionItemLink"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "\"itemLink\"",
                ["Desc"] = "itemLink - The itemLink for the specified item or",
            },
            [2] = {
                ["Desc"] = "nil, if type and/or index is invalid.",
            },
        },
        ["Format"] = "\"itemLink\" = GetAuctionItemLink(\"type\", index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "\"type\"",
                ["Desc"] = {
                    [1] = {
                        ["Desc"] = {
                            [1] = {
                                ["Name"] = "\"list\"",
                                ["Desc"] = "An item up for auction, the \"Browse\" tab in the dialog.",
                            },
                            [2] = {
                                ["Name"] = "\"bidder\"",
                                ["Desc"] = "An item the player has bid on, the \"Bids\" tab in the dialog.",
                            },
                            [3] = {
                                ["Name"] = "\"owner\"",
                                ["Desc"] = "An item the player has up for auction, the \"Auctions\" tab in the dialog.",
                            },
                        },
                    },
                },
            },
        },
        ["Desc"] = "Retrieves the itemLink of one item in the current retrieved list of items from the Auction House.",
    },
    ["BNCreateConversation"] = {
        ["Desc"] = "Creates a Battle.net conversation with 2 friends.",
        ["Format"] = "BNCreateConversation(presenceId1, presenceId2)",
    },
    ["GetRestState"] = {
        ["Desc"] = "Returns whether the player is in a rested (earning double XP for kills) or normal state.",
        ["Format"] = "id, name, mult = GetRestState()",
    },
    ["EJ_HandleLinkPath"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "instanceID",
                ["Desc"] = "Number - Instance ID",
            },
            [2] = {
                ["Name"] = "encounterID",
                ["Desc"] = "Number - Encounter ID. Otherwise returns nil",
            },
            [3] = {
                ["Name"] = "sectionID",
                ["Desc"] = "Number - Section ID. Otherwise returns nil",
            },
        },
        ["Format"] = "instanceID, encounterID, sectionID = EJ_HandleLinkPath(jtype, id)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "jtype",
                ["Desc"] = "Number - Journal Type. Determines the type of the Journal ID",
            },
            [2] = {
                ["Name"] = "id",
                ["Desc"] = "Number - Journal ID",
            },
        },
        ["Desc"] = "Processes the Journal Link for use in UI EncounterJournal_OpenJournal [1]",
    },
    ["EJ_GetInstanceInfo"] = {
        ["Format"] = "name, description, bgImage, buttonImage, loreImage, dungeonAreaMapID, link = EJ_GetInstanceInfo([instanceID])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "instanceID",
                ["Desc"] = "Number - Instance ID. If omitted, this will default to the Instance ID of the currently viewed Instance",
            },
        },
        ["Desc"] = "Returns Instance info [1]",
    },
    ["GetLFGDungeonRewardCapBarInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "currencyID",
                ["Desc"] = "Number - ID for the currency",
            },
            [2] = {
                ["Name"] = "DungeonID",
                ["Desc"] = "Number - ID for the dungeon type",
            },
            [3] = {
                ["Name"] = "Quantity",
                ["Desc"] = "Number - Quantity gained from basic dungeons",
            },
            [4] = {
                ["Name"] = "Limit",
                ["Desc"] = "Number - Limit gained from basic dungeons",
            },
            [5] = {
                ["Name"] = "overallQuantity",
                ["Desc"] = "Number - Quantity gained from high end dungeons (Zandalari)",
            },
            [6] = {
                ["Name"] = "overallLimit",
                ["Desc"] = "Number - Limit gained from high end dungeons (Zandalari)",
            },
            [7] = {
                ["Name"] = "periodPurseQuantity",
                ["Desc"] = "Number - Quantity gained from all sources (raids)",
            },
            [8] = {
                ["Name"] = "periodPurseLimit",
                ["Desc"] = "Number - Limit gained from all sources (raids)",
            },
            [9] = {
                ["Name"] = "purseQuantity",
                ["Desc"] = "Number - Currently possessed amount",
            },
            [10] = {
                ["Name"] = "purseLimit",
                ["Desc"] = "Number - Limit for possessed amount",
            },
        },
        ["Format"] = "VALOR_TIER1_LFG_ID = 301currencyID, DungeonID, Quantity, Limit, overallQuantity, overallLimit, periodPurseQuantity, periodPurseLimit, purseQuantity, purseLimit = GetLFGDungeonRewardCapBarInfo(VALOR_TIER1_LFG_ID);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "VALOR_TIER1_LFG_ID",
                ["Desc"] = "Number: id of the dungeon type for which information is being sought (currently 301)",
            },
        },
        ["Desc"] = "Retrieves information on the weekly limits for currency rewards from the dungeon system (i.e. Valor Point Cap)",
    },
    ["HasAction"] = {
        ["Desc"] = "Tests if an action slot is occupied.",
        ["Format"] = "hasAction = HasAction(actionSlot)",
    },
    ["GetStationeryInfo"] = {
        ["Returns"] = "name, texture, cost",
        ["Format"] = "local name, texture, cost = GetStationeryInfo(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - The index of the stationery from 1 to GetNumStationeries().",
            },
        },
        ["Desc"] = "Gets the name, texture path, and cost for stationery.",
    },
    ["KBSetup_GetLanguageCount"] = {
        ["Returns"] = "count",
        ["Format"] = "count = KBSetup_GetLanguageCount()",
        ["Arguments"] = "()",
        ["Desc"] = "Returns the number of languages in the knowledge base.",
    },
    ["KBSystem_GetServerNotice"] = {
        ["Returns"] = "notice",
        ["Format"] = "notice = KBSystem_GetServerNotice()",
        ["Arguments"] = "()",
        ["Desc"] = "Returns the current server notice.",
    },
    ["GetRepairAllCost"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["GetTradeSkillTools"] = {
        ["Desc"] = "Returns the required tools for a specific trade skill.",
        ["Format"] = "GetTradeSkillTools(skillIndex);",
    },
    ["GetBattlefieldEstimatedWaitTime"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["GetInboxText"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["IsSpellInRange"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "inRange",
                ["Desc"] = "Flag - 1 if the target is in range of the spell, 0 if the target is not in range of the spell, nil if the provided arguments were invalid or inapplicable.",
            },
        },
        ["Format"] = "inRange = IsSpellInRange(\"spellName\", \"target\")inRange = IsSpellInRange(index, \"bookType\", \"target\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - spell book slot index, ascending from 1.",
            },
            [2] = {
                ["Name"] = "bookType",
                ["Desc"] = "String - one of BOOKTYPE_SPELL (\"spell\") or BOOKTYPE_PET (\"pet\") specifying which spellbook to index.",
            },
            [3] = {
                ["Name"] = "spellName",
                ["Desc"] = "String - spell name to check the range of. The player must know the spell.",
            },
            [4] = {
                ["Name"] = "target",
                ["Desc"] = "String - unit to use as a target for the spell.",
            },
        },
        ["Desc"] = "Returns whether a given spell is in range.",
    },
    ["GetDestinationReforgeStats"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - Stat Name",
            },
            [2] = {
                ["Name"] = "statID",
                ["Desc"] = "Number - Dest Stat ID",
            },
            [3] = {
                ["Name"] = "statValue",
                ["Desc"] = "Number - Dest Stat Value",
            },
            [4] = {
                ["Name"] = "reforgeID",
                ["Desc"] = "Number - Reforge ID. It behaves more like an index though",
            },
        },
        ["Format"] = "stats = {GetDestinationReforgeStats(stat, value)}",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "stat",
                ["Desc"] = "Number - Source Stat ID",
            },
            [2] = {
                ["Name"] = "value",
                ["Desc"] = "Number - Source Stat Value",
            },
        },
        ["Desc"] = "Returns the reforge item's dest stats [1] [2]",
    },
    ["StartAuction"] = {
        ["Desc"] = "Starts the auction you have created in the Create Auction panel.",
        ["Format"] = "StartAuction(minBid, buyoutPrice, runTime, stackSize, numStacks)",
    },
    ["GetCritChance"] = {
        ["Desc"] = "Returns the player's critical hit chance.",
        ["Format"] = "critChance = GetCritChance()",
    },
    ["ApplyBarberShopStyle"] = {
        ["Desc"] = "Purchases currently selected customizations from the barber shop.",
        ["Format"] = "ApplyBarberShopStyle();",
    },
    ["SetActiveVoiceChannelBySessionID"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "success",
                ["Desc"] = "Boolean - returns true/1 if channel was changed successfully.",
            },
        },
        ["Format"] = "successful = SetActiveVoiceChannelBySessionID(id)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "id",
                ["Desc"] = "Number - Channel id.",
            },
        },
        ["Desc"] = "Set the active voice channel by providing an ID.",
    },
    ["GetNumQuestLogEntries"] = {
        ["Desc"] = "Returns the number of entries in the quest log.",
        ["Format"] = "numEntries, numQuests = GetNumQuestLogEntries();",
    },
    ["GetCursorMoney"] = {
        ["Desc"] = "Returns the amount of copper held on the cursor.",
        ["Format"] = "copper = GetCursorMoney();",
    },
    ["GetMacroBody"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "body",
                ["Desc"] = "String - The macro body or nothing if the macro doesn't exsist.",
            },
        },
        ["Format"] = "body = GetMacroBody(macroIndex or \"name\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "macroID",
                ["Desc"] = "number or String - Macro index or name.",
            },
        },
        ["Desc"] = "Returns the body (macro text) of a macro.",
    },
    ["CancelBarberShop"] = {
        ["Desc"] = "Exits the barber shop without applying selected customizations.",
        ["Format"] = "CancelBarberShop();",
    },
    ["RunScript"] = {
        ["Returns"] = "nil",
        ["Format"] = "RunScript(\"script\")",
        ["Arguments"] = "(\"script\")",
        ["Desc"] = "Execute a string as LUA code.",
    },
    ["GetWhoInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - Name of the character.",
            },
            [2] = {
                ["Name"] = "guild",
                ["Desc"] = "String - Guild name of the character.",
            },
            [3] = {
                ["Name"] = "level",
                ["Desc"] = "Number - Level of the character",
            },
            [4] = {
                ["Name"] = "race",
                ["Desc"] = "String - Race of the character.",
            },
            [5] = {
                ["Name"] = "class",
                ["Desc"] = "String - Class of the character.",
            },
            [6] = {
                ["Name"] = "zone",
                ["Desc"] = "String - Zone the character was in at query time.",
            },
            [7] = {
                ["Name"] = "classFileName",
                ["Desc"] = "String - Uppercase english classname of the character.",
            },
            [8] = {
                ["Name"] = "sex",
                ["Desc"] = "Number - Sex of the character. 2 for male, 3 for female.",
            },
        },
        ["Format"] = "name, guild, level, race, class, zone, classFileName, sex = GetWhoInfo(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - /who result index, ascending from 1.",
            },
        },
        ["Desc"] = "Retrieve info about a character on your current /who list.",
    },
    ["UnitPowerType"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "powerType",
                ["Desc"] = "Integer - the power type.",
            },
        },
        ["Format"] = "powerType, powerToken, altR, altG, altB = UnitPowerType(UnitId);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "UnitId",
                ["Desc"] = "String - The unit whose power type to query.",
            },
        },
        ["Desc"] = "Returns a number corresponding to the power type (e.g., mana, rage or energy) of the specified unit.",
    },
    ["CursorCanGoInSlot"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "fitsInSlot",
                ["Desc"] = "Flag - 1 if the thing currently on the cursor can go into the specified slot, nil otherwise.",
            },
        },
        ["Format"] = "fitsInSlot = CursorCanGoInSlot(invSlot)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "invSlot",
                ["Desc"] = "Number (inventorySlotId) - Inventory slot to query",
            },
        },
        ["Desc"] = "Determines if the item in the cursor can be equipped in the specified inventory slot. Always returns 1 for bank bag slots.",
    },
    ["SecureCmdOptionParse"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "result",
                ["Desc"] = "The chosen clause text, or no return (nil) if none of the clauses apply.",
            },
            [2] = {
                ["Name"] = "target",
                ["Desc"] = "The [target=(unit)] argument of the chosen clause, if such an argument exist.",
            },
        },
        ["Format"] = "result, target = SecureCmdOptionParse(\"macroText\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "macroText",
                ["Desc"] = "a string containing the macro conditions to be parsed.",
            },
        },
        ["Desc"] = "Evaluates macro options in the string and returns the appropriate sub-string or nil",
    },
    ["UnitSpellHaste"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "spellHastePercent",
                ["Desc"] = "Number - The spell haste percent for the queried unit (e.g. 37.650131225586). Will return 0 if no valid unitId is provided.",
            },
        },
        ["Format"] = "spellHastePercent = UnitSpellHaste(\"unit\" or \"name\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String (unitId) - unit to query, e.g. \"player\", \"target\".",
            },
            [2] = {
                ["Name"] = "name",
                ["Desc"] = "String - Name of unit to query.",
            },
        },
        ["Desc"] = "Returns the current spell haste percentage for a unit.",
    },
    ["GetQuestIndexForWatch"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "questIndex",
                ["Desc"] = "Number - The quest log's index of the watched quest.",
            },
        },
        ["Format"] = "questIndex = GetQuestIndexForWatch(watchIndex)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "watchIndex",
                ["Desc"] = "Number - The index of a quest watch; an integer between 1 and GetNumQuestWatches().",
            },
        },
        ["Desc"] = "Gets the quest log index of a watched quest.",
    },
    ["SetView"] = {
        ["Returns"] = "nil",
        ["Format"] = "SetView(viewIndex)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "viewIndex",
                ["Desc"] = "Number - The view index (1-5) to return to (1 is always first person, and cannot be saved with SaveView)",
            },
        },
        ["Desc"] = "Sets a camera perspective from one previously saved with SaveView. The last position loaded is stored in the CVar cameraView.",
    },
    ["GetTrainerGreetingText"] = {
        ["Desc"] = "Returns the trainer greeting text.",
        ["Format"] = "GetTrainerGreetingText();",
    },
    ["GuildDemote"] = {
        ["Returns"] = "nil",
        ["Format"] = "GuildDemote(\"playername\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "\"playername\"",
                ["Desc"] = "String - The name of the player to demote",
            },
        },
        ["Desc"] = "Demotes a specified player if you have that privilege.",
    },
    ["GuildRosterSetOfficerNote"] = {
        ["Desc"] = "Sets the public note of a guild member.",
        ["Format"] = "GuildRosterSetOfficerNote(index, \"Text\")",
    },
    ["GetRandomBGHonorCurrencyBonuses"] = {
        ["Desc"] = "Returns additional rewards for completing a random battleground.",
        ["Format"] = "hasWin, winHonor, winArena, lossHonor, lossArena = GetRandomBGCurrencyBonuses();",
    },
    ["UnitRangedDamage"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "speed",
                ["Desc"] = "Number - The unit's ranged weapon speed (0 if no ranged weapon equipped).",
            },
            [2] = {
                ["Name"] = "lowDmg",
                ["Desc"] = "Number - The unit's minimum ranged damage.",
            },
            [3] = {
                ["Name"] = "hiDmg",
                ["Desc"] = "Number - The unit's maximum ranged damage.",
            },
            [4] = {
                ["Name"] = "posBuff",
                ["Desc"] = "Number - The unit's positive Bonus on ranged attacks (includes Spelldamage increases)",
            },
            [5] = {
                ["Name"] = "negBuff",
                ["Desc"] = "Number - The unit's negative Bonus on ranged attacks",
            },
            [6] = {
                ["Name"] = "percent",
                ["Desc"] = "Number - percentage modifier (usually 1)",
            },
        },
        ["Format"] = "speed, lowDmg, hiDmg, posBuff, negBuff, percent = UnitRangedDamage(\"player\");",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "UnitId - The unit to get information from. (Likely only works for \"player\" and \"pet\" -- unconfirmed)",
            },
        },
        ["Desc"] = "Returns the unit's ranged damage and speed.",
    },
    ["GetTrainerServiceSkillLine"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "skillLine",
                ["Desc"] = "String - The name of the skill on the specified line.",
            },
        },
        ["Format"] = "local skillLine = GetTrainerServiceSkillLine(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - Index of the trainer service to get the name of. Note that indices are affected by the trainer filter. (See GetTrainerServiceTypeFilter and SetTrainerServiceTypeFilter.)",
            },
        },
        ["Desc"] = "Gets the name of the skill at the specified line from the current trainer.",
    },
    ["IsActiveBattlefieldArena"] = {
        ["Desc"] = "Used for checking if the player is inside an arena or if it's a rated match",
        ["Format"] = "isArena, isRegistered = IsActiveBattlefieldArena();",
    },
    ["SortWho"] = {
        ["Desc"] = "Sorts the last /who reply received by the client.",
        ["Format"] = "SortWho(\"sortType\")",
    },
    ["GetShapeshiftFormInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "icon",
                ["Desc"] = "String - Path to icon texture",
            },
            [2] = {
                ["Name"] = "name",
                ["Desc"] = "String - Name of this ability",
            },
            [3] = {
                ["Name"] = "active",
                ["Desc"] = "Flag - 1 if this shapeshift is currently active, nil otherwise.",
            },
            [4] = {
                ["Name"] = "castable",
                ["Desc"] = "Flag - 1 if this shapeshift form may be entered, nil otherwise.",
            },
        },
        ["Format"] = "icon, name, active, castable = GetShapeshiftFormInfo(index);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - index, ascending from 1 to GetNumShapeshiftForms()",
            },
        },
        ["Desc"] = "Retrieves information about an available shapeshift form or similar ability.",
    },
    ["RemoveTrackedAchievement"] = {
        ["Desc"] = "Un-marks an achievement for tracking in the WatchFrame.",
        ["Format"] = "RemoveTrackedAchievement(achievementId)",
    },
    ["GetMouseButtonClicked"] = {
        ["Desc"] = "Returns the name of the button responsible causing the OnClick handler to fire.",
        ["Format"] = "buttonName = GetMouseButtonClicked();",
    },
    ["GetWatchedFactionInfo"] = {
        ["Desc"] = "Returns information about the faction that is currently being watched.",
        ["Format"] = "name, standing, min, max, value, factionID = GetWatchedFactionInfo()",
    },
    ["GetTradeSkillSelectionIndex"] = {
        ["Desc"] = "Returns the index of the currently selected trade skill.",
        ["Format"] = "local tradeSkillIndex = GetTradeSkillSelectionIndex();",
    },
    ["GetNumFriends"] = {
        ["Desc"] = "Returns how many friends you have.",
        ["Format"] = "numberOfFriends, onlineFriends = GetNumFriends()",
    },
    ["SetBattlefieldScoreFaction"] = {
        ["Desc"] = "Set the faction to show on the battlefield scoreboard",
        ["Format"] = "SetBattlefieldScoreFaction([faction]);",
    },
    ["TaxiNodeName"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - name of the specified flight point, or \"INVALID\" if the index is out of bounds.",
            },
        },
        ["Format"] = "name = TaxiNodeName(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - Index of the taxi map node, ascending from 1 to NumTaxiNodes()",
            },
        },
        ["Desc"] = "Returns the name of a node on the taxi map.",
    },
    ["GetBindLocation"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["GetNumSubgroupMembers"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "numSubgroupMembers",
                ["Desc"] = "Number - number of players in the player's sub-group, excluding the player.",
            },
        },
        ["Format"] = "numSubgroupMembers = GetNumSubgroupMembers( [groupType] )",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "groupType",
                ["Desc"] = "Optional - One of the following:LE_PARTY_CATEGORY_HOME - to query information about the player's manually-created group.LE_PARTY_CATEGORY_INSTANCE - to query information about the player's instance-specific temporary group (e.g. PvP battleground group, Dungeon Finder group).",
            },
            [2] = {
                ["Desc"] = "If omitted, defaults to _INSTANCE if such a group exists, _HOME otherwise.",
            },
        },
        ["Desc"] = "Returns the number of other players in the player's party (5-man sub-group).",
    },
    ["GetGuildBankItemInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "texturePath",
                ["Desc"] = "String - The name of the texture to use for the item. Returns nil if there is no item.",
            },
            [2] = {
                ["Name"] = "itemCount",
                ["Desc"] = "Integer - The size of the item stack at the chosen slot. Returns 0 if there is no item.",
            },
            [3] = {
                ["Name"] = "locked",
                ["Desc"] = "Boolean - Whether or not the slot is locked. Returns nil if it's not locked or the item doesn't exist, 1 otherwise.",
            },
            [4] = {
                ["Name"] = "isFiltered",
                ["Desc"] = "Boolean - Returns true if the slot should be hidden because of the users filter, false otherwise.",
            },
        },
        ["Format"] = "texturePath, itemCount, locked, isFiltered = GetGuildBankItemInfo(tab,slot)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "tab",
                ["Desc"] = "Integer - The index of the tab in the guild bank",
            },
            [2] = {
                ["Name"] = "slot",
                ["Desc"] = "Integer - The index of the slot in the chosen tab.",
            },
        },
        ["Desc"] = "Gets information about an item slot from the guild bank.",
    },
    ["CalendarEventInvite"] = {
        ["Returns"] = "nil",
        ["Format"] = "",
        ["Arguments"] = "(\"player\")",
        ["Desc"] = "",
    },
    ["GetMerchantItemCostItem"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "itemTexture",
                ["Desc"] = "String - The texture that represents the item's icon",
            },
            [2] = {
                ["Name"] = "itemValue",
                ["Desc"] = "Number - The number of that item required",
            },
            [3] = {
                ["Name"] = "itemLink",
                ["Desc"] = "String - An itemLink for the cost item, nil if a currency.",
            },
            [4] = {
                ["Name"] = "currencyName",
                ["Desc"] = "String - Name of the currency required, nil if an item.",
            },
        },
        ["Format"] = "itemTexture, itemValue, itemLink, currencyName = GetMerchantItemCostItem(index, itemIndex)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - Slot in the merchant's inventory to query.",
            },
            [2] = {
                ["Name"] = "itemIndex",
                ["Desc"] = "Number - The index for the required item cost type, ascending from 1 to itemCount returned by GetMerchantItemCostInfo.",
            },
        },
        ["Desc"] = "Returns information about an item's token/currency cost.",
    },
    ["CalendarGetNumDayEvents"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "numEvents",
                ["Desc"] = "Number - The number of events on the day in question",
            },
        },
        ["Format"] = "numEvents = CalendarGetNumDayEvents(monthOffset, day)",
        ["Arguments"] = "(monthOffset, day)",
        ["Desc"] = "Get the number of events for a given day/month offset.",
    },
    ["GetInboxNumItems"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["GetContainerNumFreeSlots"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "numberOfFreeSlots",
                ["Desc"] = {
                    [1] = {
                        ["Desc"] = "Integer - the number of free slots in the specified bag.",
                    },
                },
            },
        },
        ["Format"] = "numberOfFreeSlots, BagType = GetContainerNumFreeSlots(bagID);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "bagID",
                ["Desc"] = {
                    [1] = {
                        ["Desc"] = "Integer - the slot containing the bag, e.g. 0 for backpack, etc.",
                    },
                },
            },
        },
        ["Desc"] = "Returns the total number of free slots in the bag an the type of items that can go into it specified by the index.",
    },
    ["GetTradeSkillNumReagents"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "reagentCount",
                ["Desc"] = "Integer - The number of distinct reagents required to create the item.",
            },
        },
        ["Format"] = "numReagents = GetTradeSkillNumReagents(tradeSkillRecipeId);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "tradeSkillRecipeId",
                ["Desc"] = "Integer - The id of the trade skill recipe.",
            },
        },
        ["Desc"] = "Returns the number of distinct reagents required by the specified recipe.",
    },
    ["ItemTextNextPage"] = {
        ["Returns"] = "nil",
        ["Format"] = "ItemTextNextPage()",
        ["Arguments"] = "()",
        ["Desc"] = "Request the next page of an Item Text",
    },
    ["UnitThreatSituation"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "status",
                ["Desc"] = "integer - returns the threat status for the unit:",
            },
        },
        ["Format"] = "status = UnitThreatSituation(\"unit\"[, \"otherunit\"])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "string - the unit token of the unit whose threat to query (e.g. \"player\", \"party2\", \"pet\", etc.)",
            },
            [2] = {
                ["Name"] = "otherunit",
                ["Desc"] = "string (optional) - the unit token of the unit whose threat table to query (e.g. \"target\", \"pettarget\" etc.)",
            },
        },
        ["Desc"] = "Returns brief information about a unit's standing in another unit's threat table. Added in Patch 3.0.",
    },
    ["GetCurrentMapDungeonLevel"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["ChannelUnmute"] = {
        ["Desc"] = "Unmutes the specified user on the channel.",
        ["Format"] = "ChannelUnmute(channelName, playerName);",
    },
    ["IsFlyableArea"] = {
        ["Desc"] = "Checks whether the player's current location is classified as being a flyable area.",
        ["Format"] = "canFly = IsFlyableArea()",
    },
    ["InviteUnit"] = {
        ["Desc"] = "Invite a player to join your party.",
        ["Format"] = "InviteUnit(\"playerName\")",
    },
    ["ItemTextGetText"] = {
        ["Returns"] = "pageBody",
        ["Format"] = "pageBody = ItemTextGetText()",
        ["Arguments"] = "()",
        ["Desc"] = "Get the page contents of the current item text.",
    },
    ["SetAchievementComparisonUnit"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "success",
                ["Desc"] = "Boolean - Returns true/false depending on whether the unit is valid.",
            },
        },
        ["Format"] = "success = SetAchievementComparisonInfo(\"unit\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String (unitId) - unit to query, e.g. \"target\"",
            },
        },
        ["Desc"] = "Sets the unit to be compared to.",
    },
    ["GiveMasterLoot"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["HasPetUI"] = {
        ["Desc"] = "Returns 1 if the player has a pet User Interface.",
        ["Format"] = "hasUI, isHunterPet = HasPetUI();",
    },
    ["GetNumCompletedAchievements"] = {
        ["Returns"] = "total, completed",
        ["Format"] = "total, completed = GetNumCompletedAchievements()",
        ["Arguments"] = "NONE",
        ["Desc"] = "Return the total number of Achievements, and number completed.",
    },
    ["StopMusic"] = {
        ["Desc"] = "Stops the currently played music file.",
        ["Format"] = "StopMusic();",
    },
    ["SetRaidTargetIcon"] = {
        ["Desc"] = "Sets or clears a Raidicon on top of a unit.",
        ["Format"] = "SetRaidTargetIcon(\"unit\", index)",
    },
    ["RequestTimePlayed"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["GetChannelDisplayInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "(for channels) channel name(for headers) name of the header",
            },
            [2] = {
                ["Name"] = "header",
                ["Desc"] = "true if this item is a header (e.g. for category \"CHANNEL_CATEGORY_WORLD\")",
            },
            [3] = {
                ["Name"] = "collapsed",
                ["Desc"] = "(for headers) true if subchannels are hidden (header is collapsed)",
            },
            [4] = {
                ["Name"] = "channelNumber",
                ["Desc"] = "(for channels) channel number",
            },
            [5] = {
                ["Name"] = "count",
                ["Desc"] = "(for channels) number of players in this channel(for headers) number of subchannels beneath this header",
            },
            [6] = {
                ["Name"] = "active",
                ["Desc"] = "(for channels) true if channel is active (if you leave a city where you were in Trade Channel the channel will remain as inactive)",
            },
            [7] = {
                ["Name"] = "category",
                ["Desc"] = "(for channels) \"CHANNEL_CATEGORY_WORLD\", \"CHANNEL_CATEGORY_GROUP\" or \"CHANNEL_CATEGORY_CUSTOM\"",
            },
            [8] = {
                ["Name"] = "voiceEnabled",
                ["Desc"] = "true if voice is enabled for this channel",
            },
            [9] = {
                ["Name"] = "voiceActive",
                ["Desc"] = "true if voice is currently active (someone is speaking)",
            },
        },
        ["Format"] = "name, header, collapsed, channelNumber, count, active, category, voiceEnabled, voiceActive = GetChannelDisplayInfo(i);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "id",
                ["Desc"] = "item id (ChannelFrame can display a combined maximum of 20 channels and headers; see MAX_CHANNEL_BUTTONS and use API GetNumDisplayChannels)",
            },
        },
        ["Desc"] = "Retrieves channels (and category headers) that would be displayed in Blizzards ChannelFrame.",
    },
    ["IsUsableAction"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isUsable",
                ["Desc"] = "Flag - Returns 1 if the action is valid for use at present (Does NOT include cooldown or range tests), nil otherwise.",
            },
            [2] = {
                ["Name"] = "notEnoughMana",
                ["Desc"] = "Flag - Returns 1 if the reason for the action not being usable is because there is not enough mana/rage/energy, nil otherwise.",
            },
        },
        ["Format"] = "isUsable, notEnoughMana = IsUsableAction(slot)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "slot",
                ["Desc"] = "Integer - The action slot to retrieve data for.",
            },
        },
        ["Desc"] = "Determine if an action can be used (you have sufficient mana, reagents and the action is not on cooldown).",
    },
    ["GetInventorySlotInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "slotId",
                ["Desc"] = "Number - The slot ID to use to refer to that slot in the other GetInventory functions.",
            },
            [2] = {
                ["Name"] = "textureName",
                ["Desc"] = "String - The texture to use for the empty slot on the paper doll display.",
            },
        },
        ["Format"] = "slotId, textureName = GetInventorySlotInfo(\"slotName\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "slotName",
                ["Desc"] = "String - InventorySlotName to query (e.g. \"HEADSLOT\").",
            },
        },
        ["Desc"] = "Return information about a specific inventory slot",
    },
    ["CancelSell"] = {
        ["Desc"] = "Stops the process of listing multiple stacks of an item on the auction house.",
        ["Format"] = "CancelSell();",
    },
    ["IsStealthed"] = {
        ["Desc"] = "Checks to see if Player is stealthed.",
        ["Format"] = "stealthed = IsStealthed();",
    },
    ["KBSetup_GetCategoryData"] = {
        ["Returns"] = "id, caption",
        ["Format"] = "id, caption = KBSetup_GetCategoryData(index)",
        ["Arguments"] = "(index)",
        ["Desc"] = "Returns information about a category.",
    },
    ["GetNumGlyphSockets"] = {
        ["Desc"] = "Returns the number of glyph sockets the player will have access to at max level.",
        ["Format"] = "numGlyphSockets = GetNumGlyphSockets();",
    },
    ["GetGuildRosterMOTD"] = {
        ["Desc"] = "Retrieves the guild's Message of the Day.",
        ["Format"] = "motd = GetGuildRosterMOTD()",
    },
    ["GetNumEquipmentSets"] = {
        ["Desc"] = "Returns the number of saved equipment sets.",
        ["Format"] = "count = GetNumEquipmentSets();",
    },
    ["TakeInboxMoney"] = {
        ["Returns"] = "nil",
        ["Format"] = "TakeInboxMoney(index)",
        ["Arguments"] = "(index)",
        ["Desc"] = "Take all money attached in a given letter in your inbox",
    },
    ["GetShapeshiftFormID"] = {
        ["Desc"] = "Returns the ID of the form or stance the player is currently in.",
        ["Format"] = "index = GetShapeshiftFormID()",
    },
    ["GetMapZones"] = {
        ["Desc"] = "Returns the zone names of a continent",
        ["Format"] = "zone_1, zone_2, ..., zone_N = GetMapZones(continentIndex);",
    },
    ["GetZoneText"] = {
        ["Desc"] = "Returns the localized name of the zone the player is in.",
        ["Format"] = "zoneName = GetZoneText();",
    },
    ["AcceptAreaSpiritHeal"] = {
        ["Desc"] = "Acccept the area Spirit Healer's resurrection in battlegrounds.",
        ["Format"] = "AcceptAreaSpiritHeal()",
    },
    ["EnumerateFrames"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "nextFrame",
                ["Desc"] = "Table (Frame) - the frame following currentFrame or nil if no more frames",
            },
        },
        ["Format"] = "nextFrame = EnumerateFrames([currentFrame])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "currentFrame",
                ["Desc"] = "Table (Frame) - current frame or nil to get first frame.",
            },
        },
        ["Desc"] = "Returns frame which follows current frame, or first frame if argument is nil. The order of iteration follows the order that the frames were created in.",
    },
    ["UnitOnTaxi"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "onTaxi",
                ["Desc"] = "Boolean - Whether the unit is on a taxi.",
            },
        },
        ["Format"] = "onTaxi = UnitOnTaxi(\"unit\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - the Unit ID to check.",
            },
        },
        ["Desc"] = "Returns 1 if unit is on a taxi, nil otherwise.",
    },
    ["EJ_GetLootInfo"] = {
        ["Format"] = "name, icon, slot, armorType, itemID, link, encounterID = EJ_GetLootInfo(lootID)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "lootID",
                ["Desc"] = "Number - The Loot ID returned by EJ_GetSearchResult",
            },
        },
        ["Desc"] = "Returns Loot info [1]",
    },
    ["GetBattlefieldStatus"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "status",
                ["Desc"] = "String - Battlefield status, one of:queued - Waiting for a battlefield to become ready, you're in the queueconfirm - Ready to join a battlefieldactive - Inside an active battlefieldnone - Not queued for anything in this indexerror - This should never happen",
            },
        },
        ["Format"] = "status, mapName, teamSize, registeredMatch, suspendedQueue, queueType, gameType, role = GetBattlefieldStatus(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - Index of the battlefield you wish to view, in the range of 1 to GetMaxBattlefieldID()",
            },
        },
        ["Desc"] = "Get the status of the arena, battleground, or wargame that the player is either queued for or inside.",
    },
    ["GetLFGDeserterExpiration"] = {
        ["Desc"] = "Returns the time at which you may once again use the dungeon finder after prematurely leaving a group.",
        ["Format"] = "expiryTime = GetLFGDeserterExpiration();",
    },
    ["GetItemQualityColor"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "r",
                ["Desc"] = "Number - The Red component of the color (0 to 1, inclusive).",
            },
            [2] = {
                ["Name"] = "g",
                ["Desc"] = "Number - The Green component of the color (0 to 1, inclusive).",
            },
            [3] = {
                ["Name"] = "b",
                ["Desc"] = "Number - The Blue component of the color (0 to 1, inclusive).",
            },
            [4] = {
                ["Name"] = "hex",
                ["Desc"] = "String - The UI escape sequence for this color, without the leading \"|c\".",
            },
        },
        ["Format"] = "r, g, b, hex = GetItemQualityColor(quality)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "quality",
                ["Desc"] = "Number - The numeric ID of the quality from 0 (Poor) to 7 (Heirloom).",
            },
        },
        ["Desc"] = "Returns RGB color codes for an item quality.",
    },
    ["GetTime"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "seconds",
                ["Desc"] = "Floating Point Number - The current system uptime in seconds.",
            },
        },
        ["Format"] = "seconds = GetTime();",
        ["Arguments"] = "None",
        ["Desc"] = "Returns the system uptime of your computer in seconds, with millisecond precision.",
    },
    ["GetQuestResetTime"] = {
        ["Desc"] = "Returns the number of seconds until daily quests reset.",
        ["Format"] = "nextReset = GetQuestResetTime()",
    },
    ["PetCanBeAbandoned"] = {
        ["Desc"] = "Retuns true if the pet is abandonable.",
        ["Format"] = "canAbandon = PetCanBeAbandoned();",
    },
    ["DismissCompanion"] = {
        ["Desc"] = "Dismisses a currently-summoned mount or non-combat pet.",
        ["Format"] = "DismissCompanion(\"type\")",
    },
    ["GetNumMapOverlays"] = {
        ["Desc"] = "Returns the number of overlays on the current world map (Overlays are the areas that fill in as they're discovered)",
        ["Format"] = "numOverlays = GetNumMapOverlays();",
    },
    ["IsActionInRange"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "inRange",
                ["Desc"] = "Flag - nil if the slot has no action, or if the action cannot be used on the current target; 0 if the action is out of range, and 1 otherwise.",
            },
        },
        ["Format"] = "inRange = IsActionInRange(actionSlot)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "actionSlot",
                ["Desc"] = "Number - The action slot to test.",
            },
        },
        ["Desc"] = "Returns whether an action is in range for use.",
    },
    ["GetNumMacros"] = {
        ["Desc"] = "Return the number of macros the player has.",
        ["Format"] = "global, perChar = GetNumMacros()",
    },
    ["UnitPower"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "power",
                ["Desc"] = "Number - the unit's current power level.",
            },
        },
        ["Format"] = "power = UnitPower(\"unit\" [, powerType])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - The unitId of the unit whose power should be returned",
            },
            [2] = {
                ["Name"] = "powerType",
                ["Desc"] = "Number (optional) - The type of power to return for the specified unit. If omitted, or invalid, returns the current primary power.",
            },
        },
        ["Desc"] = "Returns the amount of a specific resource (power) the specified unit currently has.",
    },
    ["CanComplainChat"] = {
        ["Desc"] = "Finds out if one can complain about a specific chat message to the Game Masters.",
        ["Format"] = "CanComplainChat(lineID)CanComplainChat(author, [message])",
    },
    ["GetInspectHonorData"] = {
        ["Desc"] = "Get the honor information about the inspected unit.",
        ["Format"] = "todayHK, todayHonor, yesterdayHK, yesterdayHonor, lifetimeHK, lifetimeRank = GetInspectHonorData()",
    },
    ["GetLFGRandomCooldownExpiration"] = {
        ["Desc"] = "Returns the time at which you may once again queue for a random dungeon.",
        ["Format"] = "expiryTime = GetLFGRandomCooldownExpiration();",
    },
    ["GetVoiceSessionInfo"] = {
        ["Returns"] = "sessionName, success",
        ["Format"] = "sessionName, success = GetVoiceSessionInfo(id)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "id",
                ["Desc"] = "Number - id of the voice session.",
            },
        },
        ["Desc"] = "Returns name of the voice session of the given id.",
    },
    ["ConfirmAcceptQuest"] = {
        ["Desc"] = "Accept an escort quest being started by a player nearby.",
        ["Format"] = "ConfirmAcceptQuest()",
    },
    ["GetBarberShopStyleInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - Name of the currently selected option.",
            },
            [2] = {
                ["Name"] = "unknown",
            },
            [3] = {
                ["Name"] = "unknown",
            },
            [4] = {
                ["Name"] = "isCurrent",
                ["Desc"] = "Flag - 1 if the current selection is the player's current appearance.",
            },
        },
        ["Format"] = "name, unknown, unknown, isCurrent = GetBarberShopStyleInfo(catId);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "catId",
                ["Desc"] = "Number - Ascending index of the customization category to retrieve information for.",
            },
        },
        ["Desc"] = "Returns information about the current selection for a barber shop customization.",
    },
    ["UnitXP"] = {
        ["Returns"] = "XP",
        ["Format"] = "XP = UnitXP(\"unit\")",
        ["Arguments"] = "(\"unit\")",
        ["Desc"] = "Return the current XP of a \"unit\" - only seems to work with \"player\".",
    },
    ["IsUsableSpell"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "usable",
                ["Desc"] = "Boolean: 1 (true) if the spell is usable, nil otherwise. A spell is not usable if any of the following conditions apply:The player hasn't learned the spellThe player lacks required mana or reagents.Reactive conditions haven't been met.",
            },
        },
        ["Format"] = "usable, nomana = IsUsableSpell(\"spellName\" or spellID or spellIndex[, \"bookType\"]);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "spellName",
                ["Desc"] = "String: name of the spell to check.",
            },
            [2] = {
                ["Name"] = "spellIndex",
                ["Desc"] = "Number: index of a spell in the player's (or pet's) spellbook.",
            },
            [3] = {
                ["Name"] = "spellID",
                ["Desc"] = "Number: SpellID of a spell to check.",
            },
            [4] = {
                ["Name"] = "bookType",
                ["Desc"] = "String: does the spellIndex refer to the player's spellbook (BOOKTYPE_SPELL constant, default), or the pet's spellbook (BOOKTYPE_PET constant).",
            },
        },
        ["Desc"] = "Determines whether a spell can be used by the player character.",
    },
    ["EJ_GetMapEncounter"] = {
        ["Format"] = "x, y, instanceID, name, description, encounterID, rootSectionID, link = EJ_GetMapEncounter(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - Map Button Index of the currently viewed Map",
            },
        },
        ["Desc"] = "Returns Map Button info [1]",
    },
    ["GuildControlGetRankName"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "rankName",
                ["Desc"] = "String - the name of the rank at index.",
            },
        },
        ["Format"] = "",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - the rank index",
            },
        },
        ["Desc"] = "",
    },
    ["GetInventoryItemID"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "itemId",
                ["Desc"] = "Number - item id of the item in the inventory slot; nil if there is no item.",
            },
        },
        ["Format"] = "itemId = GetInventoryItemID(\"unit\", invSlot);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - The UnitId of the unit whose inventory is to be queried.",
            },
            [2] = {
                ["Name"] = "invSlot",
                ["Desc"] = "Number (InventorySlotId) - index of the inventory slot to query.",
            },
        },
        ["Desc"] = "Returns the item id of the item in the specified inventory slot",
    },
    ["GetDodgeChance"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["IsTradeSkillLinked"] = {
        ["Desc"] = "Returns true if the tradeskill being viewed is from a link along with the player's name, nil otherwise.",
        ["Format"] = "isLink, playerName = IsTradeSkillLinked()",
    },
    ["CloseTaxiMap"] = {
        ["Desc"] = "Closes your Flightpath Map.",
        ["Format"] = "CloseTaxiMap();",
    },
    ["IsItemInRange"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "result",
                ["Desc"] = "Flag - If the item is not in range, 0; if the item is in range, 1; if the query is invalid, nil.",
            },
        },
        ["Format"] = "result = IsItemInRange(\"itemName\" or \"itemLink\"[, \"unit\"])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "item",
                ["Desc"] = "Mixed - which item to query, either by ID (number), name (string), or link (string).",
            },
            [2] = {
                ["Name"] = "unit",
                ["Desc"] = "String - which unit the range should be checked to",
            },
        },
        ["Desc"] = "Returns if you are in range of the specified unit to use the specified item.",
    },
    ["UnitResistance"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "base",
                ["Desc"] = "Number - The base resistance",
            },
            [2] = {
                ["Name"] = "total",
                ["Desc"] = "Number - The current total value after all modifiers",
            },
            [3] = {
                ["Name"] = "bonus",
                ["Desc"] = "Number - The bonus resistance modifier total from gear and buffs",
            },
            [4] = {
                ["Name"] = "minus",
                ["Desc"] = "Number - The negative resistance modifier total from gear and buffs",
            },
        },
        ["Format"] = "base, total, bonus, minus = UnitResistance(unitId [, resistanceIndex])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unitId",
                ["Desc"] = "UnitId - The unit to check",
            },
            [2] = {
                ["Name"] = "resistanceIndex",
                ["Desc"] = "Number - The index of the resistance type to check",
            },
        },
        ["Desc"] = "Gets information about a unit's resistance.",
    },
    ["IsInGuild"] = {
        ["Desc"] = "Lets you know whether you are in a guild.",
        ["Format"] = "isGuildMember = IsInGuild();",
    },
    ["EquipItemByName"] = {
        ["Desc"] = "Equips an item, optionally into a specified slot.",
        ["Format"] = "EquipItemByName(itemId or \"itemName\" or \"itemLink\"[, slot])",
    },
    ["GetNumIgnores"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "numPlayersIgnored",
                ["Desc"] = "Number - The number of players on your ignore list",
            },
        },
        ["Format"] = "numPlayersIgnored = GetNumIgnores()",
        ["Arguments"] = "none",
        ["Desc"] = "Returns the number of entries on your ignore list.",
    },
    ["TakeTaxiNode"] = {
        ["Desc"] = "Begins travelling to the specified taxi map node, if possible.",
        ["Format"] = "TakeTaxiNode(index)",
    },
    ["OpenCalendar"] = {
        ["Desc"] = "Requests calendar information from the server. Does not open the calendar frame.",
        ["Format"] = "OpenCalendar()",
    },
    ["GetScreenHeight"] = {
        ["Desc"] = "Returns the height of the window in pixels.",
        ["Format"] = "GetScreenHeight();",
    },
    ["GetSummonConfirmSummoner"] = {
        ["Desc"] = "Get the name of the unit which initiated the players summon.",
        ["Format"] = "playerName = GetSummonConfirmSummoner()",
    },
    ["GetNumUnspentTalents"] = {
        ["Desc"] = "Returns the number of unspent talents.",
        ["Format"] = "numUnspentTalents = GetNumUnspentTalents()",
    },
    ["GetNumWorldStateUI"] = {
        ["Desc"] = "Returns the number of world state UI elements. These are displayed in the WorldStateFrame at the top center of the screen.",
        ["Format"] = "numUI = GetNumWorldStateUI()",
    },
    ["KBArticle_IsLoaded"] = {
        ["Returns"] = "loaded",
        ["Format"] = "loaded = KBArticle_IsLoaded()",
        ["Arguments"] = "()",
        ["Desc"] = "Determine if the article is loaded.",
    },
    ["GetQuestLink"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "QuestLink",
                ["Desc"] = "String - The link to the quest specified",
            },
            [2] = {
                ["Desc"] = "or nil, if the type and/or id is invalid or there is no active quest at the moment.",
            },
        },
        ["Format"] = "",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "questindex",
                ["Desc"] = "Table - Integer - index of a quest in the quest log (between 1 and GetNumQuestLogEntries()). Note that this index includes group headers (zone, seasonal, profession)",
            },
        },
        ["Desc"] = "",
    },
    ["IsConsumableAction"] = {
        ["Desc"] = "Tests if the action is linked to a consumable item.",
        ["Format"] = "isTrue = IsConsumableAction(slotID)",
    },
    ["PickupSpell"] = {
        ["Desc"] = "Puts the specified spell onto the mouse cursor.",
        ["Format"] = "PickupSpell(spellID)",
    },
    ["KBSetup_GetArticleHeaderData"] = {
        ["Returns"] = "id, title, isHot, isNew",
        ["Format"] = "id, title, isHot, isNew = KBSetup_GetArticleHeaderData(index)",
        ["Arguments"] = "(index)",
        ["Desc"] = "Returns header information about an article.",
    },
    ["MoveViewUpStart"] = {
        ["Returns"] = "Nothing",
        ["Format"] = "MoveViewUpStart(speed)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "speed",
                ["Desc"] = "Number - Speed at which to begin rotating.",
            },
        },
        ["Desc"] = "Begins rotating the camera Up around your Character.",
    },
    ["ItemTextPrevPage"] = {
        ["Returns"] = "nil",
        ["Format"] = "ItemTextPrevPage()",
        ["Arguments"] = "()",
        ["Desc"] = "Request the previous page of an Item Text.",
    },
    ["GetTradeSkillReagentInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "reagentName",
                ["Desc"] = "String - The name of the reagent.",
            },
            [2] = {
                ["Name"] = "reagentTexture",
                ["Desc"] = "String - The texture for the reagent's icon.",
            },
            [3] = {
                ["Name"] = "reagentCount",
                ["Desc"] = "Integer - The quantity of this reagent required to make one of these items.",
            },
            [4] = {
                ["Name"] = "playerReagentCount",
                ["Desc"] = "Integer - The quantity of this reagent in the player's inventory.",
            },
        },
        ["Format"] = "reagentName, reagentTexture, reagentCount, playerReagentCount = GetTradeSkillReagentInfo(tradeSkillRecipeId, reagentId);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "tradeSkillRecipeId",
                ["Desc"] = "The Id of the tradeskill recipe",
            },
            [2] = {
                ["Name"] = "reagentId",
                ["Desc"] = "The Id of the reagent (from 1 to x, where x is the result of calling GetTradeSkillNumReagents)",
            },
        },
        ["Desc"] = "Returns information on reagents for the specified trade skill.",
    },
    ["GetFacialHairCustomization"] = {
        ["Desc"] = "Returns the type of facial hair customization available to the character.",
        ["Format"] = "cType = GetFacialHairCustomization();",
    },
    ["UnitDetailedThreatSituation"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isTanking",
                ["Desc"] = "Integer - returns 1 if the unit is primary threat target of the mob (is tanking), or nil otherwise.",
            },
            [2] = {
                ["Name"] = "status",
                ["Desc"] = "Integer - returns the threat status for the unit on the mob, or nil if unit is not on mob's threat table. (3 = securely tanking, 2 = insecurely tanking, 1 = not tanking but higher threat than tank, 0 = not tanking and lower threat than tank)",
            },
            [3] = {
                ["Name"] = "threatpct",
                ["Desc"] = "Number - returns the unit's threat on the mob as a percentage of the amount required to pull aggro, scaled according to the unit's range from the mob. At 100 the unit will pull aggro. Returns 100 if the unit is tanking and nil if the unit is not on the mob's threat list.",
            },
            [4] = {
                ["Name"] = "rawthreatpct",
                ["Desc"] = "Number - returns the unit's threat as a percentage of the tank's current threat. Returns nil if the unit is not on the mob's threat list.",
            },
            [5] = {
                ["Name"] = "threatvalue",
                ["Desc"] = "Number - returns the unit's total threat on the mob.",
            },
        },
        ["Format"] = "isTanking, status, threatpct, rawthreatpct, threatvalue = UnitDetailedThreatSituation(\"unit\", \"mob\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - The UnitId whose threat to query (e.g. \"player\", \"party2\", \"pet\", etc.)",
            },
        },
        ["Desc"] = "Returns detailed information about a unit's standing in another unit's threat table.",
    },
    ["GetQuestBackgroundMaterial"] = {
        ["Desc"] = "Returns the material string associated with the particular quest. The material string is non-nil if this quest uses a custom texture other than the default \"Parchment\" texture.",
        ["Format"] = "GetQuestBackgroundMaterial();",
    },
    ["GetNumMapLandmarks"] = {
        ["Desc"] = "Returns the number of landmarks on the currently-shown map.",
        ["Format"] = "numLandmarks = GetNumMapLandmarks()",
    },
    ["PickupStablePet"] = {
        ["Desc"] = "Attaches a pet in your stable to your cursor. 1 for the pet in the slot on the left, and 2 for the pet in the slot on the right.",
        ["Format"] = "PickupStablePet(1 or 2);",
    },
    ["GetRaidRosterInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - raid member's name. In cross-realm battlegrounds, returns \"Name-Server\" for cross-realm players.",
            },
            [2] = {
                ["Name"] = "rank",
                ["Desc"] = "Integer - Returns 2 if the raid member is the leader of the raid, 1 if the raid member is promoted to assistant, and 0 otherwise.",
            },
            [3] = {
                ["Name"] = "subgroup",
                ["Desc"] = "Integer - The raid party this character is currently a member of. Raid subgroups are numbered as on the standard raid window.",
            },
            [4] = {
                ["Name"] = "level",
                ["Desc"] = "Number - The level of the character. If this character is offline, the level will show as 0 (not nil).",
            },
            [5] = {
                ["Name"] = "class",
                ["Desc"] = "String - The character's class (localized), with the first letter capitalized (e.g. \"Priest\"). This function works as normal for offline characters.",
            },
            [6] = {
                ["Name"] = "fileName",
                ["Desc"] = "String - The system representation of the character's class; always in english, always fully capitalized.",
            },
            [7] = {
                ["Name"] = "zone",
                ["Desc"] = "String - The name of the zone this character is currently in. This is the value returned by GetRealZoneText. It is the same value you see if you mouseover their portrait (if in group). If the character is offline, this value will be the string \"Offline\".",
            },
            [8] = {
                ["Desc"] = "BUG (as of 2/26/2005): It seems that the person calling this function will have their Zone value returned as nil if they have not changed locations since last reloading their UI. Once you change locations (get the name to popup on screen), it seems to return as normal. This only seems to affect when you look at the zone value of yourself from the raid. Could a call to SetMapToCurrentZone() cure this?",
            },
            [9] = {
                ["Desc"] = "You should use functions categorised under Location Functions for getting your own location text --Salanex",
            },
            [10] = {
                ["Desc"] = "Possible values: nil, \"Offline\", any valid location",
            },
            [11] = {
                ["Name"] = "online",
                ["Desc"] = "Boolean - Returns 1 if raid member is online, nil otherwise.",
            },
            [12] = {
                ["Name"] = "isDead",
                ["Desc"] = "Boolean - Returns 1 if raid member is dead (hunters Feigning Death are considered alive), nil otherwise.",
            },
            [13] = {
                ["Name"] = "role",
                ["Desc"] = "String - The player's role within the raid (\"maintank\" or \"mainassist\").",
            },
            [14] = {
                ["Name"] = "isML",
                ["Desc"] = "Boolean - Returns 1 if the raid member is master looter, nil otherwise",
            },
            [15] = {
                ["Name"] = "combatRole",
                ["Desc"] = "String - Returns the combat role of the player if one is selected, i.e. \"DAMAGER\", \"TANK\" or \"HEALER\". Returns \"NONE\" otherwise.",
            },
        },
        ["Format"] = "name, rank, subgroup, level, class, fileName, zone, online, isDead, role, isML, combatRole = GetRaidRosterInfo(raidIndex);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "raidIndex",
                ["Desc"] = "Number - Index of raid member between 1 and MAX_RAID_MEMBERS (40). If you specify an index that is out of bounds, the function returns nil.",
            },
        },
        ["Desc"] = "Gets information about a raid member.",
    },
    ["RequestGuildApplicantsList"] = {
        ["Desc"] = "Requests information about guild applicants received trough the Guild Finder.",
        ["Format"] = "RequestGuildApplicantsList()",
    },
    ["ChannelUnmoderator"] = {
        ["Desc"] = "Takes the specified user away from the moderator status.",
        ["Format"] = "ChannelUnmoderator(channelName, playerName);",
    },
    ["GetTradeSkillDescription"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "craftDescription",
                ["Desc"] = "String. Returns, for example, \"Permanently enchant a two handed melee weapon to grant +25 Agility.\"",
            },
        },
        ["Format"] = "craftDescription = GetTradeSkillDescription(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Numeric - Number from 1 to X number of total trade skills, where 1 is the top-most skill listed.",
            },
        },
        ["Desc"] = "This command returns a string description of what the current trade skill does.",
    },
    ["GetQuestLogRewardMoney"] = {
        ["Desc"] = "Returns a number representing the amount of copper rewarded by a particular quest.",
        ["Format"] = "GetQuestLogRewardMoney();",
    },
    ["UnitIsSameServer"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "sameServer",
                ["Desc"] = "Flag - 1 if the specified unit is from the player's realm (or a Connected Realm linked to the player's own realm), nil otherwise.",
            },
        },
        ["Format"] = "sameServer = UnitIsSameServer(\"unit\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - unitId of a unit to query.",
            },
        },
        ["Desc"] = "Returns whether the specified unit is from the player's own realm (or, equivalently, a linked Connected Realm).",
    },
    ["ClearVoidTransferDepositSlot"] = {
        ["Desc"] = "Clears the specified Void Transfer deposit slot [1]",
        ["Format"] = "ClearVoidTransferDepositSlot(slotIndex)",
    },
    ["GetSocketItemBoundTradeable"] = {
        ["Desc"] = "Returns whether the item currently selected for socketing can be traded to other eligible players.",
        ["Format"] = "isBoundTradeable = GetSocketItemBoundTradeable()",
    },
    ["GetSpellLink"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "link",
                ["Desc"] = "String - A link to the spell",
            },
            [2] = {
                ["Name"] = "TradeSkillLink",
                ["Desc"] = "String - A link to the tradeskill if available, otherwise nil. (3.0.1+)",
            },
        },
        ["Format"] = "link = GetSpellLink(spellId)link = GetSpellLink(spellName[, spellRank])link = GetSpellLink(spellNum, spellBook)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "spellId",
                ["Desc"] = "Integer - The global spell number, found on wowhead, allakhazam, or thottbot or through COMBAT_LOG_EVENT.",
            },
        },
        ["Desc"] = "Get chat-link for a spell.",
    },
    ["GetChatWindowMessages"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "type1, ...",
                ["Desc"] = "String - Chat type received by the window.",
            },
        },
        ["Format"] = "type1, ... = GetChatWindowMessages(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - Chat window index, ascending from 1.",
            },
        },
        ["Desc"] = "Returns chat types received by a chat window.",
    },
    ["GetInventoryItemQuality"] = {
        ["Returns"] = "quality",
        ["Format"] = "quality = GetInventoryItemQuality(\"unit\", slotId)",
        ["Arguments"] = "(\"unit\", slotId)",
        ["Desc"] = "Return the quality of an inventory item.",
    },
    ["BNGetNumFriends"] = {
        ["Desc"] = "Returns info about how much Battle.net friends are added to the friendslist and how much of them are currently online.",
        ["Format"] = "numFriends, numOnline = BNGetNumFriends()",
    },
    ["GetPVPTimer"] = {
        ["Desc"] = "Returns the amount of time left on your PVP flag.",
        ["Format"] = "ms = GetPVPTimer()",
    },
    ["KBSetup_GetArticleHeaderCount"] = {
        ["Returns"] = "count",
        ["Format"] = "count = KBSetup_GetArticleHeaderCount()",
        ["Arguments"] = "()",
        ["Desc"] = "Returns the number of articles for the current page.",
    },
    ["GetRewardSpell"] = {
        ["Desc"] = "Returns information about spell that you get as reward for completing quest currently in gossip frame.",
        ["Format"] = "texture, name, isTradeskillSpell, isSpellLearned = GetRewardSpell()",
    },
    ["RollOnLoot"] = {
        ["Desc"] = "Roll on the Loot roll identified with Rollid, roll is nil when passing, otherwise it uses 1 to roll on loot.",
        ["Format"] = "RollOnLoot(rollID[, rollType]);",
    },
    ["GetNumQuestChoices"] = {
        ["Desc"] = "Returns the number of reward choices in the quest you're currently completing.",
        ["Format"] = "numChoices = GetNumQuestChoices()",
    },
    ["GetAchievementLink"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "achievementLink",
                ["Desc"] = "String - The achievementLink to this achievement.",
            },
        },
        ["Format"] = "achievementLink = GetAchievementLink(AchievementID)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "achievementID",
                ["Desc"] = "Number - The ID of the Achievement.",
            },
        },
        ["Desc"] = "Returns a achievementLink for the specified Achievement.",
    },
    ["MoveViewOutStart"] = {
        ["Returns"] = "Nothing",
        ["Format"] = "MoveViewOutStart(speed)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "speed",
                ["Desc"] = "Number - Speed at which to begin zooming.",
            },
        },
        ["Desc"] = "Begins zooming the camera Out",
    },
    ["GetRaidDifficultyID"] = {
        ["Desc"] = "Returns the player's currently selected raid difficulty.",
        ["Format"] = "difficultyID = GetRaidDifficultyID()",
    },
    ["GetPlayerTradeMoney"] = {
        ["Desc"] = "Gets the amount of money in the trade window for the current user.",
        ["Format"] = "GetPlayerTradeMoney();",
    },
    ["NoPlayTime"] = {
        ["Desc"] = "Returns whether the current billing unit is considered \"unhealthy\" or not. This function is to limit players from playing the game for too long.",
        ["Format"] = "isUnhealthy = NoPlayTime()",
    },
    ["GetTotemInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "haveTotem",
                ["Desc"] = "returns true if you have the totem reagent in your bag ([Earth Totem], [Fire Totem], [Water Totem], [Air Totem]).",
            },
        },
        ["Format"] = "haveTotem, totemName, startTime, duration, icon = GetTotemInfo(1 through 4)",
        ["Arguments"] = "(integer)",
        ["Desc"] = "Returns information about totems",
    },
    ["HasKey"] = {
        ["Desc"] = "Returns whether or not the player has a key ring.",
        ["Format"] = "hasKeyring = HasKey()",
    },
    ["GetAuctionSellItemInfo"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["GetContainerItemLink"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "itemLink",
                ["Desc"] = "String - a chat link for the object in the specified bag slot; nil if there is no such object. This is typically, but not always an ItemLink.",
            },
        },
        ["Format"] = "itemLink = GetContainerItemLink(bagID, slotIndex)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "bagID",
                ["Desc"] = "Numeric - Bag index (bagID). Valid indices are integers -2 through 11. 0 is the backpack.",
            },
            [2] = {
                ["Name"] = "slotIndex",
                ["Desc"] = "Numeric - Slot index within the specified bag, ascending from 1. Slot 1 is typically the leftmost topmost slot.",
            },
        },
        ["Desc"] = "Returns a link of the object located in the specified slot of a specified bag.",
    },
    ["SelectStationery"] = {
        ["Returns"] = "nil",
        ["Format"] = "SelectStationery(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - The index of the stationery to buy.",
            },
        },
        ["Desc"] = "Selects one of the available stationeries.",
    },
    ["SetCVar"] = {
        ["Desc"] = "Changes a variable located inside Config.wtf",
        ["Format"] = "SetCVar( \"cvar\", value[, \"scriptCVar\"] );",
    },
    ["SetRaidDifficultyID"] = {
        ["Desc"] = "Changes the player's preferred raid difficulty.",
        ["Format"] = "SetRaidDifficultyID(difficultyIndex)",
    },
    ["ItemTextHasNextPage"] = {
        ["Returns"] = "hasNext",
        ["Format"] = "hasNext = ItemTextHasNextPage()",
        ["Arguments"] = "()",
        ["Desc"] = "Determine if there is a page after the current page.",
    },
    ["GetTradePlayerItemLink"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "Returns",
                ["Desc"] = "chatItemLink",
            },
        },
        ["Format"] = "",
        ["Arguments"] = "(ID)",
        ["Desc"] = "",
    },
    ["GetNumSockets"] = {
        ["Returns"] = {
            [1] = {
                ["Desc"] = "Number - The number of sockets in the item currently in the item socketing window. If the item socketing window is closed, 0.",
            },
        },
        ["Format"] = "",
        ["Arguments"] = "none",
        ["Desc"] = "",
    },
    ["PickupPetAction"] = {
        ["Returns"] = "nil",
        ["Format"] = "PickupPetAction(petActionSlot)",
        ["Arguments"] = "(petActionSlot)",
        ["Desc"] = "Pick up a pet action for drag-and-drop.",
    },
    ["ExpandQuestHeader"] = {
        ["Desc"] = "Expands the quest header.",
        ["Format"] = "ExpandQuestHeader(questID);",
    },
    ["PickupEquipmentSetByName"] = {
        ["Desc"] = "Picks up an equipment set, placing it on the cursor.",
        ["Format"] = "PickupEquipmentSet(index);PickupEquipmentSetByName(\"name\");",
    },
    ["GetNumGossipActiveQuests"] = {
        ["Desc"] = "Returns the number of active quests that you should eventually turn in to this NPC.",
        ["Format"] = "numActiveQuests = GetNumGossipActiveQuests();",
    },
    ["GetNumQuestItems"] = {
        ["Desc"] = "Returns the number of items nessecary to complete a particular quest.",
        ["Format"] = "GetNumQuestItems();",
    },
    ["GetCVar"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "value",
                ["Desc"] = "String - current value of the CVar.",
            },
        },
        ["Format"] = "value = GetCVar(\"cvarName\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "cvarName",
                ["Desc"] = "String (CVar) - name of the CVar to query the value of.",
            },
        },
        ["Desc"] = "Returns the current value of a console variable.",
    },
    ["CollapseQuestHeader"] = {
        ["Desc"] = "Collapses the quest header.",
        ["Format"] = "CollapseQuestHeader(questID);",
    },
    ["GuildPromote"] = {
        ["Returns"] = "nil",
        ["Format"] = "GuildPromote(\"playername\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "\"playername\"",
                ["Desc"] = "String - The name of the player to promote.",
            },
        },
        ["Desc"] = "Promotes a specified player if you have that privilege.",
    },
    ["ConfirmReadyCheck"] = {
        ["Returns"] = "This function is used in response to receiving a READY_CHECK event. Normally this event will display the ReadyCheckFrame dialog which will in turn call ConfirmReadyCheck in response to the user clicking the Yes or No button.",
        ["Format"] = "ConfirmReadyCheck(isReady)",
        ["Arguments"] = "(isReady)",
        ["Desc"] = "Sends a response to a raid ready check",
    },
    ["GetChannelName"] = {
        ["Desc"] = "Retrieves the id and the name from a specific channel.",
        ["Format"] = "id, name = GetChannelName(id);",
    },
    ["issecure"] = {
        ["Desc"] = "Determines whether the current execution path is secure.",
        ["Format"] = "secure = issecure()",
    },
    ["SetGuildBankWithdrawGoldLimit"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["GetNumSpecializations"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "numSpecialization",
                ["Desc"] = "Number - number of available specializations.",
            },
        },
        ["Format"] = "numSpecializations = GetNumSpecializations(isInspect, isPet)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "isInspect",
                ["Desc"] = "Boolean - if true, return information for the inspected unit; false by default",
            },
            [2] = {
                ["Name"] = "isPet",
                ["Desc"] = "Boolean - if true, return information for the player's pet; false by default",
            },
        },
        ["Desc"] = "Returns the number of available specializations.",
    },
    ["ToggleSheath"] = {
        ["Desc"] = "Toggles sheathed or unsheathed weapons.",
        ["Format"] = "ToggleSheath()",
    },
    ["BNGetInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "presenceID",
                ["Desc"] = "Integer - Your presenceID",
            },
            [2] = {
                ["Name"] = "battleTag",
                ["Desc"] = "String - A nickname and number that when combined, form a unique string that identifies the friend (e.g., \"Nickname#0001\")",
            },
            [3] = {
                ["Name"] = "toonID",
                ["Desc"] = "Integer - Your toonID",
            },
            [4] = {
                ["Name"] = "currentBroadcast",
                ["Desc"] = "String - the current text in your broadcast box",
            },
            [5] = {
                ["Name"] = "bnetAFK",
                ["Desc"] = "Boolean - true if you're flagged \"Away\"",
            },
            [6] = {
                ["Name"] = "bnetDND",
                ["Desc"] = "Boolean - true if you're flagged \"Busy\"",
            },
            [7] = {
                ["Name"] = "isRIDEnabled",
                ["Desc"] = "Boolean",
            },
        },
        ["Format"] = "presenceID, battleTag, toonID, currentBroadcast, bnetAFK, bnetDND, isRIDEnabled = BNGetInfo()",
        ["Arguments"] = "none",
        ["Desc"] = "Returns information about the player",
    },
    ["GetTradeSkillListLink"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "link",
                ["Desc"] = "If tradeskill is linkable.",
            },
            [2] = {
                ["Name"] = "nil",
                ["Desc"] = "If tradeskill is not linkable (runeforging) or if no tradeskill is open.",
            },
        },
        ["Format"] = "link = GetTradeSkillListLink()",
        ["Arguments"] = "None",
        ["Desc"] = "Retrieves the TradeSkillLink to the currently open tradeskill.",
    },
    ["CompleteQuest"] = {
        ["Desc"] = "Complete the specified quest.",
        ["Format"] = "CompleteQuest();",
    },
    ["GetQuestID"] = {
        ["Desc"] = "Returns the quest ID of the quest most recently discussed with an NPC.",
        ["Format"] = "questID = GetQuestID()",
    },
    ["IsSpellClassOrSpec"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "spec",
                ["Desc"] = "String - name of the specialization the spell is exclusive to, nil if not a specialization-granted spell.",
            },
            [2] = {
                ["Name"] = "class",
                ["Desc"] = "String - name of the class the spell is exclusive to, nil if not a class ability.",
            },
        },
        ["Format"] = "spec, class = IsSpellClassOrSpec(\"spellName\" or spellIndex, \"bookType\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "spellname",
                ["Desc"] = "String - name of the spell currently known by the player.",
            },
        },
        ["Desc"] = "Returns whether a given spell is specific to a specialization and/or class.",
    },
    ["ClickVoidTransferWithdrawalSlot"] = {
        ["Desc"] = "Clicks the specified Void Transfer withdrawal slot [1]",
        ["Format"] = "ClickVoidTransferWithdrawalSlot(slotIndex[, isRightClick])",
    },
    ["KBSetup_GetCategoryCount"] = {
        ["Returns"] = "count",
        ["Format"] = "count = KBSetup_GetCategoryCount()",
        ["Arguments"] = "()",
        ["Desc"] = "Returns the number of categories.",
    },
    ["CalendarGetMonth"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "month",
                ["Desc"] = "Number - Month index (1-12)",
            },
            [2] = {
                ["Name"] = "year",
                ["Desc"] = "Number - Year at the offset date (2004+)",
            },
            [3] = {
                ["Name"] = "numdays",
                ["Desc"] = "Number - Number of days in the month (28-31)",
            },
            [4] = {
                ["Name"] = "firstday",
                ["Desc"] = "Number - Weekday on which the month begins (1 = Sunday, 2 = Monday, ..., 7 = Saturday)",
            },
        },
        ["Format"] = "month, year, numdays, firstday = CalendarGetMonth( [offsetMonth] )",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "offsetMonth",
                ["Desc"] = "Number - Offset in months from the currently selected Calendar month, positive numbers indicating future months; defaults to 0.",
            },
        },
        ["Desc"] = "Returns information about the calendar month by offset.",
    },
    ["GetNumGroupMembers"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "numGroupMembers",
                ["Desc"] = "Number - total number of players in the group (either party or raid), 0 if not in a group.",
            },
        },
        ["Format"] = "numGroupMembers = GetNumGroupMembers( [groupType] )",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "groupType",
                ["Desc"] = "Optional - One of the following:LE_PARTY_CATEGORY_HOME - to query information about the player's manually-created group.LE_PARTY_CATEGORY_INSTANCE - to query information about the player's instance-specific temporary group (e.g. PvP battleground group, Dungeon Finder group).",
            },
            [2] = {
                ["Desc"] = "If omitted, defaults to _INSTANCE if such a group exists, _HOME otherwise.",
            },
        },
        ["Desc"] = "Returns the total number of players in a group.",
    },
    ["GetPetActionInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - The name of the action (or its global ID if isToken is true).",
            },
            [2] = {
                ["Name"] = "subtext",
                ["Desc"] = "String - The subtext for the action's tooltip.",
            },
            [3] = {
                ["Name"] = "texture",
                ["Desc"] = "String - The name (or its global ID, if isToken is true) of the texture for the action.",
            },
            [4] = {
                ["Name"] = "isToken",
                ["Desc"] = "Boolean - Indicates if the action is a reference to a global action, or not (guess)",
            },
            [5] = {
                ["Name"] = "isActive",
                ["Desc"] = "Boolean - Returns true if the ability is currently active.",
            },
            [6] = {
                ["Name"] = "autoCastAllowed",
                ["Desc"] = "Boolean - Returns true if this ability can use autocast.",
            },
            [7] = {
                ["Name"] = "autoCastEnabled",
                ["Desc"] = "Boolean - Returns true if autocast is currently enabled for this ability.",
            },
        },
        ["Format"] = "name, subtext, texture, isToken, isActive, autoCastAllowed, autoCastEnabled = GetPetActionInfo(index);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - The index of the pet action button you want to query.",
            },
        },
        ["Desc"] = "Returns information on the specified pet action.",
    },
    ["CancelPendingEquip"] = {
        ["Desc"] = "Cancels a pending equip operation.",
        ["Format"] = "CancelPendingEquip(slot)",
    },
    ["ForceQuit"] = {
        ["Desc"] = "Instantly quits the game, bypassing the usual 20 seconds countdown",
        ["Format"] = "ForceQuit()",
    },
    ["GetBindingAction"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "action",
                ["Desc"] = "String - action command performed by the binding. If no action is bound to the key, an empty string is returned.",
            },
        },
        ["Format"] = "action = GetBindingAction(\"binding\"[, checkOverride]);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "binding",
                ["Desc"] = "String - The name of the key (eg. \"BUTTON1\", \"1\", \"CTRL-G\")",
            },
            [2] = {
                ["Name"] = "checkOverride",
                ["Desc"] = "Optional boolean - if true, override bindings will be checked, otherwise, only default (bindings.xml/SetBinding) bindings are consulted.",
            },
        },
        ["Desc"] = "Returns the name of the action performed by the specified binding.",
    },
    ["DoReadyCheck"] = {
        ["Desc"] = "Initiates a raid ready check. Can only be called by the raid leader, does nothing if called by other raid members or outside of a raid.As of one of the 2.0 patches, this function can also be called while in a normal party, but again only by the Group Leader",
        ["Format"] = "DoReadyCheck()",
    },
    ["GetNumSpellTabs"] = {
        ["Desc"] = "Retrieves the number of tabs in the player's spellbook.",
        ["Format"] = "numTabs = GetNumSpellTabs()",
    },
    ["GetInspectSpecialization"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "id",
                ["Desc"] = "Number - specialization ID.",
            },
        },
        ["Format"] = "id = GetInspectSpecialization(\"unit\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - The unitid of the player to request the specialization of.",
            },
        },
        ["Desc"] = "Returns a number representing the current active specialization of a given unit.",
    },
    ["GetOutdoorPVPWaitTime"] = {
        ["Desc"] = "Returns the time until the next outdoor battle (e.g. Wintergrasp).",
        ["Format"] = "nextBattleTime = GetOutdoorPVPWaitTime()",
    },
    ["GetSendMailItem"] = {
        ["Desc"] = "Returns information about an item attached in the send mail frame.",
        ["Format"] = "name, texture, count, quality = GetSendMailItem(index)",
    },
    ["GetAuctionItemTimeLeft"] = {
        ["Desc"] = "Retrieves the time left for a item in the Auction House.",
        ["Format"] = "timeleft = GetAuctionItemTimeLeft(\"type\", index);",
    },
    ["IsAttackAction"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isAttack",
                ["Desc"] = "Flag - nil if the specified slot is not an attack action, or is empty. 1 if the slot is an attack action and should flash red during combat.",
            },
        },
        ["Format"] = "isAttack = IsAttackAction(actionSlot)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "actionSlot",
                ["Desc"] = "Numeric - The action slot to test.",
            },
        },
        ["Desc"] = "Determine whether action slot is an attack action.",
    },
    ["GetGuildRosterSelection"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["BNConnected"] = {
        ["Desc"] = "Returns info whether the WoW Client is connected to the Battle.net.",
        ["Format"] = "connected = BNConnected()",
    },
    ["GetNumComparisonCompletedAchievements"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "total",
                ["Desc"] = "Number - Total number of achievements currently in the game.",
            },
            [2] = {
                ["Name"] = "completed",
                ["Desc"] = "Number - Number of achievements completed by the comparison unit.",
            },
        },
        ["Format"] = "total, completed = GetAchievementComparisonInfo(achievementID)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "achievementID",
                ["Desc"] = "Number - ID of the achievement to retrieve information for.",
            },
        },
        ["Desc"] = "Returns the number of completed achievements for the comparison player.",
    },
    ["GetAreaSpiritHealerTime"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "timeleft",
                ["Desc"] = "Integer - Seconds until the Spirit Guide casts its next Area Resurrection. Returns 0 if player is not dead.",
            },
        },
        ["Format"] = "",
        ["Arguments"] = "nil",
        ["Desc"] = "",
    },
    ["GetBarberShopTotalCost"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "applyPrice",
                ["Desc"] = "Number - The total costs of changes.",
            },
        },
        ["Format"] = "",
        ["Arguments"] = "None",
        ["Desc"] = "",
    },
    ["GetContainerItemQuestInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isQuestItem",
                ["Desc"] = "Flag - true if the item is a quest item, nil otherwise.",
            },
            [2] = {
                ["Name"] = "questId",
                ["Desc"] = "Number/nil - Quest ID of the quest this item starts, no value if it does not start a quest.",
            },
            [3] = {
                ["Name"] = "isActive",
                ["Desc"] = "Flag - 1 if the quest this item starts has been accepted by the player, nil otherwise.",
            },
        },
        ["Format"] = "isQuestItem, questId, isActive = GetContainerItemQuestInfo(bag, slot);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "bag",
                ["Desc"] = "Number (BagId) - Index of the bag to query.",
            },
            [2] = {
                ["Name"] = "slot",
                ["Desc"] = "Number - Index of the slot within the bag (ascending from 1) to query.",
            },
        },
        ["Desc"] = "Returns whether the item in the slot is a quest item.",
    },
    ["GetNumQuestLeaderBoards"] = {
        ["Desc"] = "Returns the number of objectives for a given quest.",
        ["Format"] = "local numQuestLogLeaderBoards = GetNumQuestLeaderBoards([questID])",
    },
    ["GetArtifactInfoByRace"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "artifactName",
                ["Desc"] = "String - The name of the artifact.",
            },
            [2] = {
                ["Name"] = "artifactDescription",
                ["Desc"] = "String - The description displayed on the artifact detail page. Only visible after completion for rare artifacts.",
            },
            [3] = {
                ["Name"] = "artifactRarity",
                ["Desc"] = "Integer - The rarity of the artifact, 0 for Common and 1 for Rare.",
            },
            [4] = {
                ["Name"] = "artifactIcon",
                ["Desc"] = "String - The path to the artifact's icon texture.",
            },
            [5] = {
                ["Name"] = "hoverDescription",
                ["Desc"] = "String - The description shown in the tooltip when hovering over the completed artifact. Not visible before the artifact is completed.",
            },
            [6] = {
                ["Name"] = "keystoneCount",
                ["Desc"] = "Integer - The number of Keystone slots this artifact has. Only visible when this is the in progress artifact.",
            },
            [7] = {
                ["Name"] = "bgTexture",
                ["Desc"] = "String - The path to the artifact's background texture. Only displayed when the artifact is rare.",
            },
            [8] = {
                ["Name"] = "firstCompletionTime",
                ["Desc"] = "Integer - The first time the artifact was ever completed, in the same format as time().",
            },
            [9] = {
                ["Name"] = "completionCount",
                ["Desc"] = "Integer - The number of times this artifact has been completed.",
            },
        },
        ["Format"] = "artifactName, artifactDescription, artifactRarity, artifactIcon, hoverDescription, keystoneCount, bgTexture, firstCompletionTime, completionCount = GetArtifactInfoByRace(raceIndex, artifactIndex);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "raceIndex",
                ["Desc"] = "Integer - Index of the race to pick the artifact from.",
            },
            [2] = {
                ["Name"] = "artifactIndex",
                ["Desc"] = "Table - Index of the artifact.",
            },
        },
        ["Desc"] = "Returns the information for a specific race's artifact.",
    },
    ["HasLFGRestrictions"] = {
        ["Desc"] = "Returns whether the player is in a random party formed by the dungeon finder system.",
        ["Format"] = "isRestricted = HasLFGRestrictions();",
    },
    ["PetDismiss"] = {
        ["Desc"] = "Dismiss your pet.",
        ["Format"] = "PetDismiss();",
    },
    ["GetTrackingInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - Track name.",
            },
            [2] = {
                ["Name"] = "texture",
                ["Desc"] = "String - Track texture.",
            },
            [3] = {
                ["Name"] = "active",
                ["Desc"] = "Flag - If the track is active, it will return 1 but otherwise nil.",
            },
            [4] = {
                ["Name"] = "category",
                ["Desc"] = "String - Track category, returns \"spell\" if the tracking method is a spell in the spellbook or \"other\" if it's a static tracking method.",
            },
            [5] = {
                ["Name"] = "nested",
                ["Desc"] = "Integer - Nesting level, returns -1 for items at the root level, TOWNSFOLK for items in the Townsfolk dropdown, and HUNTER_TRACKING for Hunter tracking spells.",
            },
        },
        ["Format"] = "name, texture, active, category, nested = GetTrackingInfo(id);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "id",
                ["Desc"] = "Number - tracking type index, ascending from 1 to GetNumTrackingTypes().",
            },
        },
        ["Desc"] = "Returns information regarding the specified tracking id.",
    },
    ["UnitGUID"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "guid",
                ["Desc"] = "String (GUID) - a string containing the hexadecimal representation of the unit's GUID, e.g. \"0xF130C3030000037F2\", or nil if the unit does not exist.",
            },
        },
        ["Format"] = "guid = UnitGUID(\"unit\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String (unitId) - unit to look up the GUID of.",
            },
        },
        ["Desc"] = "Returns the GUID of the specified unit.",
    },
    ["GetCurrentResolution"] = {
        ["Desc"] = "Returns the index of the current resolution in effect",
        ["Format"] = "index = GetCurrentResolution()",
    },
    ["BNGetFriendInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "presenceID",
                ["Desc"] = "Number - A unique numeric identifier for the friend during this session.",
            },
            [2] = {
                ["Name"] = "presenceName",
                ["Desc"] = "String - An escape sequence (starting with |K) representing the friend's full name or BatteTag name.",
            },
            [3] = {
                ["Name"] = "battleTag",
                ["Desc"] = "String - A nickname and number that when combined, form a unique string that identifies the friend (e.g., \"Nickname#0001\").",
            },
            [4] = {
                ["Name"] = "isBattleTagPresence",
                ["Desc"] = "Boolean - Whether or not the friend is known by their BattleTag.",
            },
            [5] = {
                ["Name"] = "toonName",
                ["Desc"] = "String - The name of the logged in toon/character.",
            },
            [6] = {
                ["Name"] = "toonID",
                ["Desc"] = "Number - A unique numeric identifier for the friend's character during this session.",
            },
            [7] = {
                ["Name"] = "client",
                ["Desc"] = "String - Either \"WoW\" (BNET_CLIENT_WOW), \"S2\" (BNET_CLIENT_S2), \"D3\" (BNET_CLIENT_D3) or \"HS\" (BNET_CLIENT_WTCG) for World of Warcraft, StarCraft 2, Diablo 3 or Heartstone.",
            },
            [8] = {
                ["Name"] = "isOnline",
                ["Desc"] = "Boolean - Whether or not the friend is online.",
            },
            [9] = {
                ["Name"] = "lastOnline",
                ["Desc"] = "Number - The number of seconds elapsed since this friend was last online (from the epoch date of January 1, 1970). Returns nil if currently online.",
            },
            [10] = {
                ["Name"] = "isAFK",
                ["Desc"] = "Boolean - Whether or not the friend is flagged as Away.",
            },
            [11] = {
                ["Name"] = "isDND",
                ["Desc"] = "Boolean - Whether or not the friend is flagged as Busy.",
            },
            [12] = {
                ["Name"] = "broadcastText",
                ["Desc"] = "String - The friend's Battle.Net broadcast message.",
            },
            [13] = {
                ["Name"] = "noteText",
                ["Desc"] = "String - The contents of the player's note about this friend.",
            },
            [14] = {
                ["Name"] = "isRIDFriend",
                ["Desc"] = "Boolean - Returns true for RealID friends and false for BattleTag friends.",
            },
            [15] = {
                ["Name"] = "broadcastTime",
                ["Desc"] = "Number - The number of seconds elapsed since the current broadcast message was sent.",
            },
            [16] = {
                ["Name"] = "canSoR",
                ["Desc"] = "Boolean - Whether or not this friend can receive a Scroll of Resurrection.",
            },
        },
        ["Format"] = "presenceID, presenceName, battleTag, isBattleTagPresence, toonName, toonID, client, isOnline, lastOnline, isAFK, isDND, broadcastText, noteText, isRIDFriend, broadcastTime, canSoR = BNGetFriendInfo(friendIndex)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "friendIndex",
                ["Desc"] = "Number - The index on the friends list for this RealID friend.",
            },
        },
        ["Desc"] = "Returns information about the specified RealID friend.",
    },
    ["GetQuestLogPushable"] = {
        ["Desc"] = "Returns true if the currently loaded quest in the quest window is able to be shared with other players.",
        ["Format"] = "isPushable = GetQuestLogPushable();",
    },
    ["GetManaRegen"] = {
        ["Returns"] = "base, casting",
        ["Format"] = "base, casting = GetManaRegen()",
        ["Arguments"] = "None",
        ["Desc"] = "Gets the player's current mana regeneration rates (in mana per 1 seconds).",
    },
    ["SocketItemToArtifact"] = {
        ["Desc"] = "Socked a Keystone to the selected artifact.",
        ["Format"] = "keystoneAdded = SocketItemToArtifact()",
    },
    ["PutItemInBag"] = {
        ["Desc"] = "Puts the item on the cursor into the specified bag slot on the main bar, if it's a bag. Otherwise, attempts to place the item inside the bag in that slot. Note that to place an item in the backpack, you must use PutItemInBackpack.",
        ["Format"] = "PutItemInBag(slotId)",
    },
    ["GetWorldPVPAreaInfo"] = {
        ["Returns"] = "pvpID, localizedName, isActive, canQueue, startTime, canEnter",
        ["Format"] = "pvpID, localizedName, isActive, canQueue, startTime, canEnter = GetWorldPVPAreaInfo(pvpID)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "pvpID",
                ["Desc"] = "Number - the zone's index, from 1 to GetNumWorldPVPAreas()",
            },
        },
        ["Desc"] = "Get information regarding a world PvP zone (e.g. Wintergrasp or Tol Barad).",
    },
    ["UnitIsTappedByPlayer"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isTapped",
                ["Desc"] = "Flag - 1 if the unit is tapped by current player, nil otherwise.",
            },
        },
        ["Format"] = "isTapped = UnitIsTappedByPlayer(\"unit\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String (unitId) - unit to query, e.g. \"target\"",
            },
        },
        ["Desc"] = "Returns whether a unit is tappe by the player.",
    },
    ["GetTradeSkillInvSlots"] = {
        ["Desc"] = "Returns a list of the available inventory slot types",
        ["Format"] = "GetTradeSkillInvSlots();",
    },
    ["SetFriendNotes"] = {
        ["Returns"] = "nil",
        ["Format"] = "SetFriendNotes(friendIndex, noteText)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "friendIndex",
                ["Desc"] = "Integer - Index of friend in the friend list (Note that status changes can re-order the friend list, indexes are not guaranteed to remain stable across events) (Also note that index should not be greater than 50 [see Notes]).",
            },
            [2] = {
                ["Name"] = "noteText",
                ["Desc"] = "String - The text that the friends note will be set to, up to 48 characters.",
            },
        },
        ["Desc"] = "Sets the note text for a friend.",
    },
    ["GetInventoryItemGems"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "gem1, gem2, ...",
                ["Desc"] = "Number - Item ID of the gem(s) socketed within the item in the queried slot.",
            },
        },
        ["Format"] = "gem1, gem2, ... = GetInventoryItemGems(invSlot);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "invSlot",
                ["Desc"] = "Number (InventorySlotId) - Index of the inventory slot to query.",
            },
        },
        ["Desc"] = "Returns item ids of the gems socketed in the item in the specified inventory slot.",
    },
    ["GetGossipText"] = {
        ["Desc"] = "Get the gossip text.",
        ["Format"] = "text = GetGossipText()",
    },
    ["SendMail"] = {
        ["Desc"] = "Sends in-game mail, if your mailbox is open.",
        ["Format"] = "SendMail(\"recipient\", \"subject\", \"body\")",
    },
    ["AddOrDelMute"] = {
        ["Desc"] = "Toggles whether a player is muted in the in-game voice chat.",
        ["Format"] = "AddOrDelMute(\"playerName\");",
    },
    ["GetActiveSpecGroup"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "activeSpec",
                ["Desc"] = "Number - The index of the player's active specialization/talent/glyph group (1 for primary / 2 for secondary).",
            },
        },
        ["Format"] = "activeSpec = GetActiveSpecGroup([isInspect])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "isInspect",
                ["Desc"] = "Boolean - If true returns the information for the inspected unit instead of the player. Defaults to false.",
            },
        },
        ["Desc"] = "Returns the index of the current active specialization/talent/glyph group.",
    },
    ["IsModifiedClick"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isHeld",
                ["Desc"] = "1 if the modifier is being held, nil otherwise.",
            },
        },
        ["Format"] = "isHeld = IsModifiedClick(\"action\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "action",
                ["Desc"] = {
                    [1] = {
                        ["Desc"] = "SELFCAST, AUTOLOOTTOGGLE, STICKYCAMERA, CHATLINK, DRESSUP, SOCKETITEM, SPLITSTACK, PICKUPACTION, COMPAREITEMS, OPENALLBAGS, QUESTWATCHTOGGLE",
                    },
                },
            },
        },
        ["Desc"] = "Returns 1 if the keys for the specified action are down, nil otherwise.",
    },
    ["UnitIsFeignDeath"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isFeign",
                ["Desc"] = "Flag - Returns 1 if the checked unit is feigning death, nil otherwise.",
            },
        },
        ["Format"] = "isFeign = UnitIsFeignDeath(\"unit\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - unit to check.",
            },
        },
        ["Desc"] = "Returns whether a unit is feigning death.",
    },
    ["CalendarGetMinDate"] = {
        ["Desc"] = "Returns the first day supported by the Calendar API.",
        ["Format"] = "weekday, month, day, year = CalendarGetMinDate()",
    },
    ["IsMounted"] = {
        ["Desc"] = "Checks to see if the player is mounted or not.ArgumentsNoneReturns1 if the player is currently mounted, nil otherwiseExample Codemounted = IsMounted()If the player is mounted then the value of mounted will be 1. However if the player is not mounted then mounted will have a value of nil. To save space, instead of assiging the return value of IsMounted() to mounted, IsMounted() can be inserted into the code like a number.",
        ["Format"] = "/script if IsMounted() == nil then...",
    },
    ["TaxiNodeGetType"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "type",
                ["Desc"] = "String - \"CURRENT\" for the player's current position, \"REACHABLE\" for nodes that can be travelled to, \"DISTANT\" for nodes that can't be travelled to, and \"NONE\" if the index is out of bounds.",
            },
        },
        ["Format"] = "type = TaxiNodeGetType(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - Taxi map node index, ascending from 1 to NumTaxiNodes().",
            },
        },
        ["Desc"] = "Returns the type of a taxi map node.",
    },
    ["GetGuildBankTabInfo"] = {
        ["Returns"] = "name, icon, isViewable, canDeposit, numWithdrawals, remainingWithdrawals",
        ["Format"] = "name, icon, isViewable, canDeposit, numWithdrawals, remainingWithdrawals = GetGuildBankTabInfo(tab);",
        ["Arguments"] = "(\"tab\")",
        ["Desc"] = "Gets display / player's access information regarding a guild bank tab.",
    },
    ["TaxiGetSrcX"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "sX",
                ["Desc"] = "Number - The horizontal position of the source node.",
            },
        },
        ["Format"] = "local sX = TaxiGetSrcX(destinationIndex, routeIndex)",
        ["Arguments"] = "(destinationIndex, routeIndex)",
        ["Desc"] = "Returns the horizontal position of the source node of a given route to the destination.",
    },
    ["CanEditMOTD"] = {
        ["Desc"] = "Checks if the player can edit the guild MOTD.",
        ["Format"] = "canEdit = CanEditMOTD()",
    },
    ["CreateFrame"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "newFrame",
                ["Desc"] = "Frame - Pointer to the newly created frame.",
            },
        },
        ["Format"] = "newFrame = CreateFrame(\"frameType\"[, \"frameName\"[, parentFrame[, \"inheritsFrame\"[, id]]]]);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "frameType",
                ["Desc"] = "String - Type of the frame to be created (XML tag name): \"Frame\", \"Button\", etc. See UIOBJECT_Frame",
            },
            [2] = {
                ["Name"] = "frameName",
                ["Desc"] = "String - Name of the newly created frame. If nil, no frame name is assigned. The function will also set a global variable of this name to point to the newly created frame.",
            },
            [3] = {
                ["Name"] = "parentFrame",
                ["Desc"] = "Frame - The frame object that will be used as the created Frame's parent (cannot be a string!) Does not default to UIParent if given nil.",
            },
            [4] = {
                ["Name"] = "inheritsFrame",
                ["Desc"] = "String - a comma-delimited list of names of virtual frames to inherit from (the same as in XML). If nil, no frames will be inherited. These frames cannot be frames that were created using this function, they must be created using XML with virtual=\"true\" in the tag.",
            },
            [5] = {
                ["Name"] = "id",
                ["Desc"] = "Number - ID to assign to the frame. See API Frame SetID",
            },
        },
        ["Desc"] = "Creates a new UI frame.",
    },
    ["ConfirmLootRoll"] = {
        ["Desc"] = "Confirm your loot roll after one of the events \"CONFIRM_LOOT_ROLL\" or \"CONFIRM_DISENCHANT_ROLL\" has fired.",
        ["Format"] = "ConfirmLootRoll(RollID[ ,roll])",
    },
    ["GetShapeshiftFormCooldown"] = {
        ["Desc"] = "Returns cooldown information for a specified form.",
        ["Format"] = "startTime, duration, isActive = GetShapeshiftFormCooldown(index)",
    },
    ["UnitPVPName"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "titleName",
                ["Desc"] = "String - The unit's combined title and name, e.g. \"Playername, the Insane\", or nil if the unit is out of range.",
            },
        },
        ["Format"] = "titleName = UnitPVPName(\"unit\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - visible unit to retrieve the name and title of.",
            },
        },
        ["Desc"] = "Returns the unit's conjoined title and name.",
    },
    ["GetChannelList"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "id1, name1, ...",
                ["Desc"] = "pairs of channel number and channel name.",
            },
        },
        ["Format"] = "id1, name1, id2, name2, ... = GetChannelList();",
        ["Arguments"] = "() - none",
        ["Desc"] = "GetChannelListRetrieves joined channels.",
    },
    ["CameraZoomIn"] = {
        ["Returns"] = "nil",
        ["Format"] = "CameraZoomIn(increment)",
        ["Arguments"] = "(float increment)",
        ["Desc"] = "Zooms the camera into the viewplane",
    },
    ["GetMerchantItemMaxStack"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "maxStack",
                ["Desc"] = "Number - The maximum stack size for the item.",
            },
        },
        ["Format"] = "maxStack = GetMerchantItemMaxStack(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - The index of the item in the merchant's inventory.",
            },
        },
        ["Desc"] = "Gets the maximum stack size for an item from the active merchant.",
    },
    ["UnitIsFriend"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "IsFriend",
                ["Desc"] = "Boolean flag - 1 if otherunit is friendly to unit; nil otherwise.",
            },
        },
        ["Format"] = "isFriend = UnitIsFriend(\"unit\",\"otherunit\");",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - A valid unit.",
            },
            [2] = {
                ["Name"] = "otherunit",
                ["Desc"] = "String - A valid unit.",
            },
        },
        ["Desc"] = "This function will determine whether two units are friendly to each other (i.e. able to help each other in combat).",
    },
    ["SetSelectedAuctionItem"] = {
        ["Desc"] = "Selects a specific item in the auction house",
        ["Format"] = "SetSelectedAuctionItem(\"type\", index)",
    },
    ["GetLootMethod"] = {
        ["Desc"] = "Retrieves the Loot Method and (if applicable) Master Looter idenity.",
        ["Format"] = "lootmethod, masterlooterPartyID, masterlooterRaidID = GetLootMethod()",
    },
    ["ShowCloak"] = {
        ["Desc"] = "Enables or disables display of your cloak.",
        ["Format"] = "ShowCloak(flag);",
    },
    ["DeclineResurrect"] = {
        ["Desc"] = "Declines a resurrection offer.",
        ["Format"] = "DeclineResurrect();",
    },
    ["GetBattlefieldTimeWaited"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "timeInQueue",
                ["Desc"] = "Integer - Milliseconds this player has been waiting in the queue",
            },
        },
        ["Format"] = "",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "battlegroundQueuePosition",
                ["Desc"] = "Integer - The queue position.",
            },
        },
        ["Desc"] = "",
    },
    ["wipe"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "table",
                ["Desc"] = "Table - The empty table.",
            },
        },
        ["Format"] = "table = table.wipe(table)wipe(table)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "table",
                ["Desc"] = "Table - The table to be cleared.",
            },
        },
        ["Desc"] = "Wipes a table of all contents.",
    },
    ["VoiceIsDisabledByClient"] = {
        ["Desc"] = "Returns whether voice chat is disabled by the client.",
        ["Format"] = "disabled = VoiceIsDisabledByClient()",
    },
    ["GetArchaeologyRaceInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "raceName",
                ["Desc"] = "String - Name of the race.",
            },
            [2] = {
                ["Name"] = "raceTexture",
                ["Desc"] = "String - Path to the texture used by this race in the Archaeology UI.",
            },
            [3] = {
                ["Name"] = "raceItemID",
                ["Desc"] = "Number - The itemID for the Keystone this race uses.",
            },
            [4] = {
                ["Name"] = "numFragmentsCollected",
                ["Desc"] = "Number - Number of collected fragments for this race.",
            },
            [5] = {
                ["Name"] = "numFragmentsRequired",
                ["Desc"] = "Number - Number of fragments required to solve the current artifact",
            },
        },
        ["Format"] = "raceName, raceTexture, raceItemID, numFragmentsCollected, numFragmentsRequired = GetArchaeologyRaceInfo(raceIndex)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "raceIndex",
                ["Desc"] = "Number - Index of the race to query; ascending from 1.",
            },
        },
        ["Desc"] = "Returns the information for a specific race used in Archaeology.",
    },
    ["ItemTextGetMaterial"] = {
        ["Returns"] = "materialName",
        ["Format"] = "materialName = ItemTextGetMaterial()",
        ["Arguments"] = "()",
        ["Desc"] = "Get the material which an item text is written on.",
    },
    ["UnlockVoidStorage"] = {
        ["Returns"] = "none",
        ["Format"] = "UnlockVoidStorage()",
        ["Arguments"] = "none",
        ["Desc"] = "Pays for, and unlocks the Void Storage [1]",
    },
    ["UnitSex"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "gender",
                ["Desc"] = "Number - One of the following values, or nil if the unit is unknown:1 = Neutrum / Unknown2 = Male3 = Female",
            },
        },
        ["Format"] = "gender = UnitSex(\"unit\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - unitId of the unit to query, e.g. \"player\".",
            },
        },
        ["Desc"] = "Returns the gender of the specified unit.",
    },
    ["SummonFriend"] = {
        ["Desc"] = "Summons a player using the RaF system.",
        ["Format"] = "SummonFriend(\"unit\")",
    },
    ["UnitRangedAttackPower"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "base",
                ["Desc"] = "Number - The unit's base ranged attack power (seems to give a positive number even if no ranged weapon equipped)",
            },
            [2] = {
                ["Name"] = "posBuff",
                ["Desc"] = "Number - The total effect of positive buffs to ranged attack power.",
            },
            [3] = {
                ["Name"] = "negBuff",
                ["Desc"] = "Number - The total effect of negative buffs to the ranged attack power (a negative number)",
            },
        },
        ["Format"] = "base, posBuff, negBuff = UnitRangedAttackPower(\"unit\");",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - The UnitId to get information from. (Likely only works for \"player\" and \"pet\")",
            },
        },
        ["Desc"] = "Returns the unit's ranged attack power and modifiers.",
    },
    ["UnitPlayerControlled"] = {
        ["Returns"] = "UnitIsPlayerControlled",
        ["Format"] = "UnitIsPlayerControlled = UnitPlayerControlled(\"unit\")",
        ["Arguments"] = "(\"unit\")",
        ["Desc"] = "Return whether the \"unit\" is controlled by a player or an NPC.",
    },
    ["ClosePetStables"] = {
        ["Returns"] = "nil",
        ["Format"] = "ClosePetStables()",
        ["Arguments"] = "none",
        ["Desc"] = "Closes the pet stable window.",
    },
    ["GetMultiCastTotemSpells"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "totem1",
                ["Desc"] = "Number - The spell Id of the first valid spell for the slot",
            },
            [2] = {
                ["Name"] = "totem2",
                ["Desc"] = "Number - The spell Id of the second valid spell for the slot",
            },
            [3] = {
                ["Name"] = "totem3",
                ["Desc"] = "Number - The spell Id of the third valid spell for the slot",
            },
            [4] = {
                ["Name"] = "totem4",
                ["Desc"] = "Number - The spell Id of the fourth valid spell for the slot",
            },
            [5] = {
                ["Name"] = "totem5",
                ["Desc"] = "Number - The spell Id of the fifth valid spell for the slot",
            },
            [6] = {
                ["Name"] = "totem6",
                ["Desc"] = "Number - The spell Id of the sixth valid spell for the slot",
            },
            [7] = {
                ["Name"] = "totem7",
                ["Desc"] = "Number - The spell Id of the seventh valid spell for the slot",
            },
        },
        ["Format"] = "totem1, totem2, totem3, totem4, totem5, totem6, totem7 = GetMultiCastTotemSpells(slot)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "slot",
                ["Desc"] = {
                    [1] = {
                        ["Desc"] = "133 - Fire134 - Earth135 - Water136 - Air",
                    },
                },
            },
        },
        ["Desc"] = "Returns a list of valid totem spells for the specified totem bar slot.",
    },
    ["GetCurrentTitle"] = {
        ["Desc"] = "Example:",
        ["Format"] = "currentTitle = GetCurrentTitle();",
    },
    ["UnitIsTapped"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isTapped",
                ["Desc"] = "Flag - 1 if the unit is tapped, nil otherwise.",
            },
        },
        ["Format"] = "isTapped = UnitIsTapped(\"unit\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - unit to query, e.g. \"target\".",
            },
        },
        ["Desc"] = "Returns whether the unit is tapped (by anyone).",
    },
    ["BNSetCustomMessage"] = {
        ["Desc"] = "Sends a broadcast message to your Real ID friends.",
        ["Format"] = "BNSetCustomMessage(\"text\")",
    },
    ["UnitIsTappedByAllThreatList"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "tappedByAll",
                ["Desc"] = "Flag - 1 if the kill credit/quest loot is shared among everyone on its threat list, nil if only the person who tapped the unit initially gets credit.",
            },
        },
        ["Format"] = "tappedByAll = UnitIsTappedByAllThreatList(\"unit\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String (unitId) - Unit to query.",
            },
        },
        ["Desc"] = "Returns whether the kill credit/quest loot for the unit is shared by everyone on its threat list.",
    },
    ["UnitIsTrivial"] = {
        ["Desc"] = "Checks to see if a unit is trivial.",
        ["Format"] = "local isTrivial = UnitIsTrivial(unit);",
    },
    ["GetNumLootItems"] = {
        ["Desc"] = "Returns the slot number of the last item in the loot window (the item window must be opened).Would return the number of items right when the window is opened. If, for instance, the first item is looted, the function would still return the same number as before. Looting the last item would make the function return one less than the original amount.",
        ["Format"] = "GetNumLootItems();",
    },
    ["UnitIsPVPFreeForAll"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isFreeForAll",
                ["Desc"] = "Boolean - Whether the unit is flagged for free-for-all PVP",
            },
        },
        ["Format"] = "isFreeForAll = UnitIsPVPFreeForAll(unitId)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unitId",
                ["Desc"] = "UnitId - The unit to check",
            },
        },
        ["Desc"] = "Checks if a unit is flagged for free-for-all PVP. (ex. from being in a world arena)",
    },
    ["UnitIsPVP"] = {
        ["Desc"] = "Checks to see if a unit is flagged for PvP or not.",
        ["Format"] = "local ispvp = UnitIsPVP(unit);",
    },
    ["GetSelectedIgnore"] = {
        ["Desc"] = "Returns the currently selected index in the ignore listing",
        ["Format"] = "index = GetSelectedIgnore()",
    },
    ["GetOptOutOfLoot"] = {
        ["Desc"] = "Returns whether you're currently passing on all loot.",
        ["Format"] = "optedOut = GetOptOutOfLoot();",
    },
    ["DisableAllAddOns"] = {
        ["Returns"] = "nil",
        ["Format"] = "DisableAllAddOns()",
        ["Arguments"] = "()",
        ["Desc"] = "Disable all AddOns for subsequent sessions.",
    },
    ["SetupFullscreenScale"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["ChangeChatColor"] = {
        ["Desc"] = "Changes the text color of the specified chat channel. The \"color wheel\" popup calls this function to do the actual work, once the user is done with the popup.",
        ["Format"] = "ChangeChatColor(\"channelname\", red, green, blue);",
    },
    ["GetMerchantItemCostInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "itemCount",
                ["Desc"] = "Number - The number of different types of items required to purchase the item.",
            },
        },
        ["Format"] = "",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - The index of the item in the merchant's inventory",
            },
        },
        ["Desc"] = "",
    },
    ["UnitIsGhost"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isGhost",
                ["Desc"] = "Flag - 1 if the unit is in ghost form, nil otherwise.",
            },
        },
        ["Format"] = "isGhost = UnitIsGhost(unit)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - the UnitId to query",
            },
        },
        ["Desc"] = "Returns a value indicating whether the specified unit is in ghost form.",
    },
    ["UnitIsEnemy"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "IsEnemy",
                ["Desc"] = "Returns either nil or 1, not a boolean value.If the second parameter is \"target\" and nothing is targeted, this function returns nil.",
            },
        },
        ["Format"] = "",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - The UnitId of the first unit.",
            },
            [2] = {
                ["Name"] = "otherunit",
                ["Desc"] = "String - The UnitId of the unit to compare with the first unit.",
            },
        },
        ["Desc"] = "",
    },
    ["BNSendGameData"] = {
        ["Desc"] = "BNSendGameData is the battle.net chat-equivalent of SendAddonMessage().",
        ["Format"] = "BNSendGameData(presenceID, addonPrefix, message)",
    },
    ["UnitIsDead"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isDead",
                ["Desc"] = "Flag - 1 if the unit is dead, nil otherwise.",
            },
        },
        ["Format"] = "isDead = UnitIsDead(unit)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - the UnitId to query",
            },
        },
        ["Desc"] = "Returns a value indicating whether the specified unit is dead.",
    },
    ["ShowMerchantSellCursor"] = {
        ["Desc"] = "Changes the cursor to the merchant sell cursor.",
        ["Format"] = "ShowMerchantSellCursor(index);",
    },
    ["UnitCreatureFamily"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "creatureFamily",
                ["Desc"] = "String - localized name of the creature family (e.g., \"Crab\" or \"Wolf\"). Possible English values are:",
            },
        },
        ["Format"] = "creatureFamily = UnitCreatureFamily(unit);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "UnitId - unit you wish to query.",
            },
        },
        ["Desc"] = "Returns the creature family of the specified unit (e.g., \"Crab\" or \"Wolf\"). Only works on Beasts and Demons, since the family's only function is to determine what abilities the unit will have if a hunter or warlock tames it; however, works on most currently untameable Beasts for reasons of backward and forward compatibility. Returns nil if the creature isn't a Beast or doesn't belong to a family that includes a tameable creature.",
    },
    ["UnitIsAFK"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isAFK",
                ["Desc"] = "1 if unit is AFK, nil otherwise.",
            },
        },
        ["Format"] = "isAFK = UnitIsAFK(\"unit\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "The UnitId to return AFK status of.",
            },
        },
        ["Desc"] = "Checks if a unit is AFK.",
    },
    ["EJ_GetEncounterInfo"] = {
        ["Format"] = "name, description, encounterID, rootSectionID, link = EJ_GetEncounterInfo(encounterID)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "encounterID",
                ["Desc"] = "Number - Encounter ID",
            },
        },
        ["Desc"] = "Returns Encounter info [1]",
    },
    ["UnitInRaid"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Layout position for raid members: integer ascending from 0 (which is the first member of the first group).",
            },
        },
        ["Format"] = "index = UnitInRaid(\"unit\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - unitId to check.",
            },
        },
        ["Desc"] = "Returns a number if the unit is in your raid group, nil otherwise.",
    },
    ["UnitHealthMax"] = {
        ["Desc"] = "Returns the maximum health of the specified unit.",
        ["Format"] = "local max_health = UnitHealthMax(unit);",
    },
    ["GetNumAddOns"] = {
        ["Returns"] = "count",
        ["Format"] = "count = GetNumAddOns()",
        ["Arguments"] = "()",
        ["Desc"] = "Get the number of user supplied AddOns.",
    },
    ["UnitGroupRolesAssigned"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "role",
                ["Desc"] = "String - TANK, HEALER, DAMAGER, NONE",
            },
        },
        ["Format"] = "role = UnitGroupRolesAssigned(Unit);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "Unit",
                ["Desc"] = "String - the unit to be queried (player, party1 .. party4, target, raid1 .. raid40)",
            },
        },
        ["Desc"] = "Returns the assigned role in a group formed via the Dungeon Finder Tool.",
    },
    ["UnitGetGuildXP"] = {
        ["Returns"] = "currentXP, nextLevelXP, dailyXP, maxDailyXP, unitWeeklyXP, unitTotalXP",
        ["Format"] = "currentXP, nextLevelXP, dailyXP, maxDailyXP, unitWeeklyXP, unitTotalXP = UnitGetGuildXP(target)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "target",
                ["Desc"] = "String - The affected group member. i.e. \"player\" or player name. The only accepted value seems to be \"player\".",
            },
        },
        ["Desc"] = "Retrieves the Guild XP information of the target.",
    },
    ["UnitFactionGroup"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "englishFaction",
                ["Desc"] = "String - Unit's faction name in English, i.e. \"Alliance\", \"Horde\", \"Neutral\" or nil.",
            },
            [2] = {
                ["Name"] = "localizedFaction",
                ["Desc"] = "String - Unit's faction name in the client's locale or nil.",
            },
        },
        ["Format"] = "englishFaction, localizedFaction = UnitFactionGroup(\"unit\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String (unitId) - unit you want to get the faction for.",
            },
        },
        ["Desc"] = "Get the name of the faction (Horde/Alliance) a unit belongs to.",
    },
    ["UnitExists"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "exists",
                ["Desc"] = "Flag - 1 if the unit exists and is in the current zone, or nil if not",
            },
        },
        ["Format"] = "exists = UnitExists(\"unit\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String (UnitId) - The unit to query (e.g. \"player\", \"party2\", \"pet\", \"target\" etc.)",
            },
        },
        ["Desc"] = "Determines if the unit exists.",
    },
    ["GetMerchantNumItems"] = {
        ["Desc"] = "Returns the number of items a merchant carries.",
        ["Format"] = "numItems = GetMerchantNumItems();",
    },
    ["UnitCreatureType"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "creatureType",
                ["Desc"] = "string - the localized creature type of the unit",
            },
        },
        ["Format"] = "creatureType = UnitCreatureType(unit)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "string - the UnitId to query",
            },
        },
        ["Desc"] = "Returns the creature type of the specified unit.",
    },
    ["UnitClassification"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "classification",
                ["Desc"] = "String - the unit's classification: \"worldboss\", \"rareelite\", \"elite\", \"rare\", \"normal\", \"trivial\", or \"minus\"",
            },
        },
        ["Format"] = "classification = UnitClassification(\"unit\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - unitId of the unit to query, e.g. \"target\"",
            },
        },
        ["Desc"] = "Returns the classification of the specified unit (e.g., \"elite\" or \"worldboss\").",
    },
    ["GetNumSavedInstances"] = {
        ["Desc"] = "Returns the number of instances for which the player currently has lockout data saved.",
        ["Format"] = "numInstances = GetNumSavedInstances()",
    },
    ["Dismount"] = {
        ["Desc"] = "Dismounts the player if the player was mounted.",
        ["Format"] = "Dismount()",
    },
    ["GetNumGossipAvailableQuests"] = {
        ["Desc"] = "Returns the number of quests (that you are not already on) offered by this NPC.",
        ["Format"] = "numNewQuests = GetNumGossipAvailableQuests();",
    },
    ["UnitCanCooperate"] = {
        ["Desc"] = "Returns true if the first unit can cooperate with the second, false otherwise.",
        ["Format"] = "UnitCanCooperate(unit1, unit2);",
    },
    ["GetBattlefieldFlagPosition"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "x, y",
                ["Desc"] = "Integer - Position of the flag on the map.",
            },
            [2] = {
                ["Name"] = "token",
                ["Desc"] = "String - Name of flag texture in Interface\\WorldStateFrame\\",
            },
            [3] = {
                ["Desc"] = "In Warsong Gulch the names of the flag textures are the strings \"AllianceFlag\" and \"HordeFlag\".",
            },
        },
        ["Format"] = "",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Integer - Index to get the flag position from",
            },
        },
        ["Desc"] = "",
    },
    ["GetGuildBankMoneyTransaction"] = {
        ["Desc"] = "gets a specific money transaction from the guild bank",
        ["Format"] = "type, name, amount, years, months, days, hours = GetGuildBankMoneyTransaction(index)",
    },
    ["CheckInteractDistance"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "inRange",
                ["Desc"] = "Boolean flag - 1 if you are in range to perform the interaction, nil otherwise.",
            },
        },
        ["Format"] = "inRange = CheckInteractDistance(\"unit\", distIndex);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - Unit to compare distance to.",
            },
            [2] = {
                ["Name"] = "distIndex",
                ["Desc"] = {
                    [1] = {
                        ["Desc"] = "1 = Inspect, 28 yards",
                    },
                    [2] = {
                        ["Desc"] = "2 = Trade, 11.11 yards",
                    },
                    [3] = {
                        ["Desc"] = "3 = Duel, 9.9 yards",
                    },
                    [4] = {
                        ["Desc"] = "4 = Follow, 28 yards",
                    },
                },
            },
        },
        ["Desc"] = "Checks whether you are in range to perform a specific interaction with a specified unit.",
    },
    ["QueryAuctionItems"] = {
        ["Desc"] = "Will return information about items in the auction house. There must be a delay of about 0.3 second between regular queries and 15 minutes between getall queries. Use CanSendAuctionQuery() to determine if a query can be done.",
        ["Format"] = "QueryAuctionItems(\"name\", minLevel, maxLevel, invTypeIndex, classIndex, subclassIndex, page, isUsable, qualityIndex, getAll)",
    },
    ["GetNumTrainerServices"] = {
        ["Desc"] = "Returns the number of trainer services.",
        ["Format"] = "GetNumTrainerServices();",
    },
    ["CloseBankFrame"] = {
        ["Returns"] = "nil",
        ["Format"] = "CloseBankFrame();",
        ["Arguments"] = "None",
        ["Desc"] = "Will Close the Bank Frame if opened.",
    },
    ["GetInventoryItemCount"] = {
        ["Returns"] = "count",
        ["Format"] = "count = GetInventoryItemCount(\"unit\", slotId)",
        ["Arguments"] = "(\"unit\", slotId)",
        ["Desc"] = "Determine the quantity of an item in an inventory slot.",
    },
    ["UnitBuff"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - The name of the spell or effect of the buff, or nil if no buff was found with the specified name or at the specified index. This is the name shown in yellow when you mouse over the buff's icon.",
            },
            [2] = {
                ["Name"] = "rank",
                ["Desc"] = "String - The rank of the spell or effect that caused the buff. Returns \"\" if there is no rank.",
            },
            [3] = {
                ["Name"] = "iconTexture",
                ["Desc"] = "String - The identifier of (path and filename to) the indicated buff.",
            },
            [4] = {
                ["Name"] = "count",
                ["Desc"] = "Number - The number of times the buff has been applied to the target.",
            },
            [5] = {
                ["Name"] = "debuffType",
                ["Desc"] = "String - The magic type of the buff",
            },
            [6] = {
                ["Name"] = "duration",
                ["Desc"] = "Number - The full duration of the buff in seconds",
            },
            [7] = {
                ["Name"] = "expirationTime",
                ["Desc"] = "Number - Time the buff will expire in seconds",
            },
            [8] = {
                ["Name"] = "source",
                ["Desc"] = "String - The unit that cast the buff",
            },
            [9] = {
                ["Name"] = "isStealable",
                ["Desc"] = "Boolean - 1 if it is stealable otherwise nil",
            },
            [10] = {
                ["Name"] = "shouldConsolidate",
                ["Desc"] = "Boolean - 1 if the buff should be placed in a buff consolidation box (usually long-term effects).",
            },
            [11] = {
                ["Name"] = "spellId",
                ["Desc"] = "Number - spell ID of the aura.",
            },
            [12] = {
                ["Name"] = "canApplyAura",
                ["Desc"] = "Boolean - true if the player can apply the aura (not necessarily if the player did apply the aura, just if the player can apply the aura).",
            },
            [13] = {
                ["Name"] = "isBossDebuff",
                ["Desc"] = "Boolean - true if the aura was cast by a boss.",
            },
            [14] = {
                ["Name"] = "value1",
                ["Desc"] = "Number - Value of variable effect 1 of the aura. (HoTs, resource-capturing trinkets, etc.)",
            },
            [15] = {
                ["Name"] = "value2",
                ["Desc"] = "Number - Value of variable effect 2 of the aura. (HoTs, resource-capturing trinkets, etc.)",
            },
            [16] = {
                ["Name"] = "value3",
                ["Desc"] = "Number - Value of variable effect 3 of the aura. (HoTs, resource-capturing trinkets, etc.)",
            },
        },
        ["Format"] = "name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellId, canApplyAura, isBossDebuff, value1, value2, value3 = UnitBuff(\"unit\", index or \"name\"[, \"rank\"[, \"filter\"]])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - The unit you want debuff information for.",
            },
            [2] = {
                ["Name"] = "index",
                ["Desc"] = "Number - The index of the debuff to retrieve info for. Starts at 1, maximum 40.",
            },
            [3] = {
                ["Name"] = "filter",
                ["Desc"] = "This parameter can be any of \"PLAYER\", \"RAID\", \"CANCELABLE\", \"NOT_CANCELABLE\". You can also specify several filters separated by a | or space character to chain multiple filters together (e.g. \"CANCELABLE|RAID\" or \"CANCELABLE RAID\" == cancelable buffs that you can cast on your raid).",
            },
        },
        ["Desc"] = "Retrieve info about a certain buff on a certain unit. This essentially an alias of UnitAura with the \"HELPFUL\" filter.",
    },
    ["CancelAreaSpiritHeal"] = {
        ["Desc"] = "Cancels the area Spirit Healer's resurrection in battlegrounds.",
        ["Format"] = "CancelAreaSpiritHeal()",
    },
    ["ClickAuctionSellItemButton"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["GetMerchantItemInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - The name of the item",
            },
            [2] = {
                ["Name"] = "texture",
                ["Desc"] = "String - The texture that represents the item's icon",
            },
            [3] = {
                ["Name"] = "price",
                ["Desc"] = "Number - The price of the item (in copper)",
            },
            [4] = {
                ["Name"] = "quantity",
                ["Desc"] = "Number - The quantity that will be purchased (the batch size, e.g. 5 for vials)",
            },
            [5] = {
                ["Name"] = "numAvailable",
                ["Desc"] = "Number - The number of this item that the merchant has in stock. -1 for unlimited stock.",
            },
            [6] = {
                ["Name"] = "isUsable",
                ["Desc"] = "Number - Is 1 if the player can use this item, nil otherwise",
            },
            [7] = {
                ["Name"] = "extendedCost",
                ["Desc"] = "Number - Is 1 if the item has extended (PvP) cost info, nil otherwise",
            },
        },
        ["Format"] = "name, texture, price, quantity, numAvailable, isUsable, extendedCost = GetMerchantItemInfo(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - The index of the item in the merchant's inventory",
            },
        },
        ["Desc"] = "Returns information about a merchant's item.",
    },
    ["UnitAttackSpeed"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "mainSpeed",
                ["Desc"] = "Number - The unit's base main hand attack speed (seconds)",
            },
            [2] = {
                ["Name"] = "offSpeed",
                ["Desc"] = "Number - The unit's offhand attack speed (seconds) - nil if the unit has no offhand weapon.",
            },
        },
        ["Format"] = "mainSpeed, offSpeed = UnitAttackSpeed(\"unit\");",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "UnitId - The unit to get information from. (Verified for \"player\" and \"target\")",
            },
        },
        ["Desc"] = "Returns the unit's melee attack speed for each hand.",
    },
    ["SummonRandomCritter"] = {
        ["Desc"] = "Summons a random non-combat pet companion.",
        ["Format"] = "SummonRandomCritter()",
    },
    ["GetNumVoidTransferWithdrawal"] = {
        ["Desc"] = "Returns the number of items being withdrawed from the Void Storage [1]",
        ["Format"] = "numWithdrawals = GetNumVoidTransferWithdrawal()",
    },
    ["PetCanBeRenamed"] = {
        ["Desc"] = "Retuns true if the pet can be renamed.",
        ["Format"] = "canRename = PetCanBeRenamed();",
    },
    ["UnitAttackBothHands"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "mainBase",
                ["Desc"] = "Number - The unit's base main hand weapon skill (not rating).",
            },
            [2] = {
                ["Name"] = "mainMod",
                ["Desc"] = "Number - Any modifier to the unit's main hand weapon skill (not rating).",
            },
            [3] = {
                ["Name"] = "offBase",
                ["Desc"] = "Number - The unit's base offhand weapon skill (not rating)(equal to unarmed weapon skill if unit doesn't dual wield).",
            },
            [4] = {
                ["Name"] = "offMod",
                ["Desc"] = "Number - Any modifier to the unit's offhand weapon skill (not rating).",
            },
        },
        ["Format"] = "mainBase, mainMod, offBase, offMod = UnitAttackBothHands(unit);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - The UnitId to get information from. (Verified for \"player\" and \"target\")",
            },
        },
        ["Desc"] = "Returns information about the unit's melee attacks.",
    },
    ["GetSpellInfo"] = {
        ["Returns"] = "name, rank, icon, cost, isFunnel, powerType, castTime, minRange, maxRange",
        ["Format"] = "name, rank, icon, cost, isFunnel, powerType, castTime, minRange, maxRange = GetSpellInfo(spellId or spellName)",
        ["Arguments"] = "(spellId or spellName)",
        ["Desc"] = "Get information about a spell.",
    },
    ["UnitArmor"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "base",
                ["Desc"] = "Number - The unit's base armor without buffs, armor kits or enchantments.",
            },
            [2] = {
                ["Name"] = "effectiveArmor",
                ["Desc"] = "Number - The unit's effective armor after buffs (and??)",
            },
            [3] = {
                ["Name"] = "armor",
                ["Desc"] = "Number - The unit's armor after adding armor kits and enchantments but without buffs.",
            },
            [4] = {
                ["Name"] = "posBuff",
                ["Desc"] = "Number - Amount of armor increase due to positive buffs",
            },
            [5] = {
                ["Name"] = "negBuff",
                ["Desc"] = "Number - Amount of armor reduction due to negative buffs (a negative number)",
            },
        },
        ["Format"] = "base, effectiveArmor, armor, posBuff, negBuff = UnitArmor(unit);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - The unitId to get information from. Normally only works for \"player\" and \"pet\", but also for \"target\" if the target is a beast upon which the hunter player has cast Beast Lore.",
            },
        },
        ["Desc"] = "Returns the armor statistics relevant to the specified target.",
    },
    ["UnitAffectingCombat"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "affectingCombat",
                ["Desc"] = "Flag - Returns 1 if the unit is in combat or has aggro, nil otherwise.",
            },
        },
        ["Format"] = "affectingCombat = UnitAffectingCombat(\"unit\");",
        ["Arguments"] = "(\"unit\")",
        ["Desc"] = "Determine whether a unit is in combat or has aggro.",
    },
    ["UninviteUnit"] = {
        ["Desc"] = "Removes a player from the party/raid group if you're the party leader, or initiates a vote to kick a player from a Dungeon Finder group.",
        ["Format"] = "UninviteUnit(\"name\" [, \"reason\"])",
    },
    ["GetStablePetInfo"] = {
        ["Desc"] = "Returns information about a specific stabled pet.",
        ["Format"] = "petIcon, petName, petLevel, petType, petTalents = GetStablePetInfo(index);",
    },
    ["GetCurrentMapZone"] = {
        ["Desc"] = "Returns the index of the zone the world map is currently showing",
        ["Format"] = "zoneIndex = GetCurrentMapZone();",
    },
    ["GetNumStationeries"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "numStationeries",
                ["Desc"] = "Number - The number of stationeries available for use.",
            },
        },
        ["Format"] = "local numStationeries = GetNumStationeries()",
        ["Arguments"] = "None",
        ["Desc"] = "Gets the number of stationeries available for use in sending mail.",
    },
    ["ToggleGlyphFilter"] = {
        ["Desc"] = "Toggles the state of a glyph filter",
        ["Format"] = "ToggleGlyphFilter(filter)",
    },
    ["TaxiNodePosition"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["SetOptOutOfLoot"] = {
        ["Desc"] = "Controls whether the player is automatically passing on all loot.",
        ["Format"] = "SetOptOutOfLoot(optOut);",
    },
    ["GetSpecializationRole"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "roleToken",
                ["Desc"] = "String - One of \"DAMAGER\", \"TANK\", \"HEALER\"; 0 if the query is invalid.",
            },
        },
        ["Format"] = "roleToken = GetSpecializationRole(specIndex[, isInspect[, isPet]])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "specIndex",
                ["Desc"] = "Number - Specialization index, ascending from 1.",
            },
        },
        ["Desc"] = "Returns the role a specialization is intended to perform.",
    },
    ["SetScreenResolution"] = {
        ["Desc"] = "Returns the index of the current resolution in effect",
        ["Format"] = "SetScreenResolution([index])",
    },
    ["GetMasterLootCandidate"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "candidate",
                ["Desc"] = "The name of the player at index.",
            },
        },
        ["Format"] = "candidate = GetMasterLootCandidate(slot, index);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "slot",
                ["Desc"] = "The loot slot number of the item you want to get information about",
            },
        },
        ["Desc"] = "Returns the name of the player at the specified index, who would receive an item assigned by GiveMasterLoot(slot, index) using the same index.",
    },
    ["TaxiNodeCost"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["SetReforgeFromCursorItem"] = {
        ["Returns"] = "none",
        ["Format"] = "SetReforgeFromCursorItem()",
        ["Arguments"] = "none",
        ["Desc"] = "Sets an item from the mouse cursor for reforging [1]",
    },
    ["IsAltKeyDown"] = {
        ["Desc"] = "There are three seperate levels of IsModifierKeyDown() type API functions but they all do the same basic function and return true if the specified key is currently pressed down.The first level is one function to tell you if any of the modifier keys are down IsModifierKeyDown()The second level is the three diferent functions one for each type of Modifier key: Shift, Alt &amp; CtrlThe third is one function for each seperate modifier key: Left Alt, Right Alt, Left Shift, Right Shift, Left Ctrl &amp; Right Ctrl.Is Any Modifier Key DownReturns whether ANY modifier key is currently pressed down.",
        ["Format"] = "anyModKeyIsDown = IsModifierKeyDown();",
    },
    ["TaxiGetSrcY"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "sY",
                ["Desc"] = "Number - The vertical position of the source node.",
            },
        },
        ["Format"] = "local sY = TaxiGetSrcY(destinationIndex, routeIndex)",
        ["Arguments"] = "(destinationIndex, routeIndex)",
        ["Desc"] = "Returns the vertical position of the source node of a given route to the destination.",
    },
    ["MoveViewRightStart"] = {
        ["Returns"] = "Nothing",
        ["Format"] = "MoveViewRightStart(speed)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "speed",
                ["Desc"] = "Number - Speed at which to begin rotating.",
            },
        },
        ["Desc"] = "Begins rotating the camera to the Right around your Character.",
    },
    ["SetCurrencyBackpack"] = {
        ["Desc"] = "Alters the backpack tracking state of a currency.",
        ["Format"] = "SetCurrencyBackpack(id, backpack)",
    },
    ["IsSwimming"] = {
        ["Desc"] = "Returns whether the player character is swimming.",
        ["Format"] = "isSwimming = IsSwimming()",
    },
    ["SetAbandonQuest"] = {
        ["Desc"] = "Selects the currently selected quest to be abandoned.",
        ["Format"] = "SetAbandonQuest()",
    },
    ["IsTradeskillTrainer"] = {
        ["Desc"] = "Determine whether last opened trainer window offered trade skill (profession) abilities.",
        ["Format"] = "isTradeskillTrainer = IsTradeskillTrainer();",
    },
    ["AcceptResurrect"] = {
        ["Desc"] = "Accepts a resurrection, returning the character to life.",
        ["Format"] = "AcceptResurrect();",
    },
    ["TakeInboxItem"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["GetGlyphSocketInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "enabled",
                ["Desc"] = "Boolean - 1 if available, nil if locked.",
            },
            [2] = {
                ["Name"] = "glyphType",
                ["Desc"] = "Number - GLYPH_TYPE_MAJOR (1), or GLYPH_TYPE_MINOR (2)",
            },
            [3] = {
                ["Name"] = "glyphTooltipIndex",
                ["Desc"] = "Number - Index to be used with GLYPH_SLOT_TOOLTIP#",
            },
            [4] = {
                ["Name"] = "glyphSpellID",
                ["Desc"] = "Number - spell ID of socketted glyph, nil if no glyph is socketed.",
            },
            [5] = {
                ["Name"] = "icon",
                ["Desc"] = "String - Glyph rune texture path.",
            },
            [6] = {
                ["Name"] = "glyphID",
                ["Desc"] = "Number - unique glyph id",
            },
        },
        ["Format"] = "enabled, glyphType, glyphTooltipIndex, glyphSpellID, icon = GetGlyphSocketInfo(socketID[[, talentGroup], isInspect, inspectUnit]);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "socketID",
                ["Desc"] = "Number - glyph [Glyph SocketID|socket index]] (1 to GetNumGlyphSockets() )",
            },
            [2] = {
                ["Name"] = "talentGroup",
                ["Desc"] = "Optional Number - (dual) specialization index (1 to GetNumTalentGroups(...)).",
            },
            [3] = {
                ["Name"] = "isInspect",
                ["Desc"] = "Optional Boolean - true to return information about the inspected unit",
            },
            [4] = {
                ["Name"] = "inspectUnit",
                ["Desc"] = "String - the unitid being inspected",
            },
        },
        ["Desc"] = "Returns information on a glyph socket.",
    },
    ["TaxiGetDestY"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "dY",
                ["Desc"] = "Number - The vertical position of the destination node for the route.",
            },
        },
        ["Format"] = "local dY = TaxiGetDestX(destinationIndex, routeIndex)",
        ["Arguments"] = "(destinationIndex, routeIndex)",
        ["Desc"] = "Returns the vertical position of the destination node of a given route to the destination.",
    },
    ["GetNumAuctionItems"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "batch",
                ["Desc"] = "The size of the batch being viewed, 50 for a page view.",
            },
            [2] = {
                ["Name"] = "count",
                ["Desc"] = "The total number of items in the query.",
            },
        },
        ["Format"] = "batch,count = GetNumAuctionItems(\"list\");",
        ["Arguments"] = "(string type)",
        ["Desc"] = "Retrieves the number of auction items of a certain type.",
    },
    ["GetSelectedStationeryTexture"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "texture",
                ["Desc"] = "String - The path to the selected stationery's texture.",
            },
        },
        ["Format"] = "local texture = GetSelectedStationeryTexture()",
        ["Arguments"] = "None",
        ["Desc"] = "Gets the selected stationery texture.",
    },
    ["GetGuildRosterLastOnline"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "yearsOffline",
                ["Desc"] = "Integer - number of years since the member was last online. May return nil.",
            },
            [2] = {
                ["Name"] = "monthsOffline",
                ["Desc"] = "Integer - number of months since the member was last online. May return nil.",
            },
            [3] = {
                ["Name"] = "daysOffline",
                ["Desc"] = "Integer - number of days since the member was last online. May return nil.",
            },
            [4] = {
                ["Name"] = "hoursOffline",
                ["Desc"] = "Integer - number of hours since the member was last online. May return nil.",
            },
        },
        ["Format"] = "yearsOffline, monthsOffline, daysOffline, hoursOffline = GetGuildRosterLastOnline(index);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Integer - index of the guild roster entry you wish to query.",
            },
        },
        ["Desc"] = "Returns a specific guild member's last seen time.",
    },
    ["GetMapLandmarkInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - Name of the landmark, e.g. \"Domination Point Tower\".",
            },
            [2] = {
                ["Name"] = "description",
                ["Desc"] = "String - Description of the landmark, e.g. \"Horde Controlled\" or \"Grand Master Pet Tamer\".",
            },
            [3] = {
                ["Name"] = "textureIndex",
                ["Desc"] = "Number - An index representing which POI or object icon to display for this landmark.",
            },
            [4] = {
                ["Name"] = "x",
                ["Desc"] = "Number - The X location of the landmark's center; 0 at left edge of the map, 1 at the right.",
            },
            [5] = {
                ["Name"] = "y",
                ["Desc"] = "Number - The Y location of the landmark's center; 0 at the top edge of the map, 1 at the bottom.",
            },
            [6] = {
                ["Name"] = "mapLinkID",
                ["Desc"] = "Number - map link ID that should be followed if the landmark is clicked.",
            },
            [7] = {
                ["Name"] = "showInBattleMap",
                ["Desc"] = "Boolean - whether this landmark should be shown in the battle map.",
            },
            [8] = {
                ["Name"] = "graveyardID",
                ["Desc"] = "Number - for graveyard landmarks, graveyard ID for use in conjunction with SetCemeteryPreference; 0 if not a graveyard.",
            },
            [9] = {
                ["Name"] = "areaID",
                ["Desc"] = "Number - mapID of the map this landmark should be limited to, or 0 if no such limitation applies.",
            },
            [10] = {
                ["Name"] = "poiID",
                ["Desc"] = "Number - POI-specific ID, or nil.",
            },
            [11] = {
                ["Name"] = "isObjectIcon",
                ["Desc"] = "Flag - if true, this landmark uses an object rather than POI icon.",
            },
        },
        ["Format"] = "name, description, textureIndex, x, y, mapLinkID, showInBattleMap, graveyardID, areaID, poiID, isObjectIcon = GetMapLandmarkInfo(landmarkIndex)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "landmarkIndex",
                ["Desc"] = "Number - Indicates which landmark to query (from 1 to GetNumMapLandmarks())",
            },
        },
        ["Desc"] = "Returns the information about a landmark on the current world map.",
    },
    ["AddMute"] = {
        ["Desc"] = "Mutes a player in the in-game voice chat.",
        ["Format"] = "AddMute(\"playerName\");",
    },
    ["IsCurrentAction"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isCurrent",
                ["Desc"] = "Flag - 1 if the action in the slot is currently executing, nil otherwise.",
            },
        },
        ["Format"] = "isCurrent = IsCurrentAction(actionSlot)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "actionSlot",
                ["Desc"] = "Number - action slot ID to query.",
            },
        },
        ["Desc"] = "Determine whether an action is currently executing.",
    },
    ["GetInboxHeaderInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "packageIcon",
                ["Desc"] = "String - texture path for package icon if it contains a package (nil otherwise)",
            },
            [2] = {
                ["Name"] = "stationeryIcon",
                ["Desc"] = "String - texture path for mail message icon.",
            },
            [3] = {
                ["Name"] = "sender",
                ["Desc"] = "String - name of the player who sent the message.",
            },
            [4] = {
                ["Name"] = "subject",
                ["Desc"] = "String - the message subject",
            },
            [5] = {
                ["Name"] = "money",
                ["Desc"] = "Number - The amount of money attached",
            },
            [6] = {
                ["Name"] = "CODAmount",
                ["Desc"] = "Number - The amount of COD payment required to receive the package",
            },
            [7] = {
                ["Name"] = "daysLeft",
                ["Desc"] = "Number - The number of days (fractional) before the message expires",
            },
            [8] = {
                ["Name"] = "hasItem",
                ["Desc"] = "Number - Either the number of attachments or nil if no items are present. Note that items that have been taken from the mailbox continue to occupy empty slots, but hasItem is the total number of items remaining in the mailbox. Use ATTACHMENTS_MAX_RECEIVE for the total number of attachments rather than this.",
            },
            [9] = {
                ["Name"] = "wasRead",
                ["Desc"] = "Flag - 1 if the mail has been read, nil otherwise. Using GetInboxText() marks an item as read.",
            },
            [10] = {
                ["Name"] = "wasReturned",
                ["Desc"] = "Flag - 1 if the mail was returned, nil otherwise",
            },
            [11] = {
                ["Name"] = "textCreated",
                ["Desc"] = "Flag - 1 if a letter object has been created from this mail, nil otherwise",
            },
            [12] = {
                ["Name"] = "canReply",
                ["Desc"] = "Flag - 1 if this letter can be replied to, nil otherwise",
            },
            [13] = {
                ["Name"] = "isGM",
                ["Desc"] = "Flag - 1 if this letter was sent by a GameMaster",
            },
        },
        ["Format"] = "packageIcon, stationeryIcon, sender, subject, money, CODAmount, daysLeft, hasItem, wasRead, wasReturned, textCreated, canReply, isGM = GetInboxHeaderInfo(index);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - the index of the message (1 is the first message)",
            },
        },
        ["Desc"] = "Returns information about an item in the mailbox.",
    },
    ["AcceptBattlefieldPort"] = {
        ["Desc"] = "Confirms entry into a Battleground you are queued for that is ready.",
        ["Format"] = "AcceptBattlefieldPort(index, accept)",
    },
    ["SetGuildRosterSelection"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["KBArticle_BeginLoading"] = {
        ["Returns"] = "nil",
        ["Format"] = "KBArticle_BeginLoading(id, searchType)",
        ["Arguments"] = "(id, searchType)",
        ["Desc"] = "Starts the article load process.",
    },
    ["GetActiveArtifactByRace"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "artifactName",
                ["Desc"] = "String - The name of the artifact.",
            },
            [2] = {
                ["Name"] = "artifactDescription",
                ["Desc"] = "String - The description displayed on the artifact detail page. Only visible after completion for rare artifacts.",
            },
            [3] = {
                ["Name"] = "artifactRarity",
                ["Desc"] = "Integer - The rarity of the artifact, 0 for Common and 1 for Rare.",
            },
            [4] = {
                ["Name"] = "artifactIcon",
                ["Desc"] = "String - The path to the artifact's icon texture.",
            },
            [5] = {
                ["Name"] = "hoverDescription",
                ["Desc"] = "String - The description shown in the tooltip when hovering over the completed artifact. Not visible before the artifact is completed.",
            },
            [6] = {
                ["Name"] = "keystoneCount",
                ["Desc"] = "Integer - The number of Keystone slots this artifact has. Only visible when this is the in progress artifact.",
            },
            [7] = {
                ["Name"] = "bgTexture",
                ["Desc"] = "String - The path to the artifact's background texture. Only displayed when the artifact is rare.",
            },
        },
        ["Format"] = "artifactName, artifactDescription, artifactRarity, artifactIcon, hoverDescription, keystoneCount, bgTexture = GetActiveArtifactByRace(raceIndex);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "raceIndex",
                ["Desc"] = "Integer - Index of the race to pick the artifact from.",
            },
        },
        ["Desc"] = "Returns the information for a specific race's active artifact.",
    },
    ["GetMapContinents"] = {
        ["Desc"] = "Returns a list of continent names.",
        ["Format"] = "continent1, continent2, ... = GetMapContinents();",
    },
    ["SpellIsTargeting"] = {
        ["Desc"] = "Returns whether a spell is about to be cast, waiting for the player to select a target.",
        ["Format"] = "isTargeting = SpellIsTargeting()",
    },
    ["GetScreenWidth"] = {
        ["Desc"] = "Returns the width of the window in pixels.",
        ["Format"] = "GetScreenWidth();",
    },
    ["ReplaceTradeEnchant"] = {
        ["Desc"] = "Confirms that an enchant applied to the trade frame should replace an existing enchant.",
        ["Format"] = "ReplaceTradeEnchant()",
    },
    ["GetLFGProposal"] = {
        ["Desc"] = "Returns information about the current LFD group invite.",
        ["Format"] = "proposalExists, id, typeID, subtypeID, name, texture, role, hasResponded, totalEncounters, completedEncounters, numMembers, isLeader, isHoliday, proposalCategory = GetLFGProposal()",
    },
    ["GetSpecializationInfoByID"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "id",
                ["Desc"] = "Number - specialization ID.",
            },
            [2] = {
                ["Name"] = "name",
                ["Desc"] = "String - specialization name, e.g. \"Balance\".",
            },
            [3] = {
                ["Name"] = "description",
                ["Desc"] = "String - description of the specialization, e.g. \"Can take on the form of a powerful Moonkin, balancing the power of Arcane and Nature magic to destroy enemies at a distance.\"",
            },
            [4] = {
                ["Name"] = "icon",
                ["Desc"] = "String - Texture path to this specialization's icon.",
            },
            [5] = {
                ["Name"] = "background",
                ["Desc"] = "String - Background texture name for this talent tree; prepend \"Interface\\TALENTFRAME\\\" to this value for a valid texture path.",
            },
            [6] = {
                ["Name"] = "role",
                ["Desc"] = "String - This specialization's intended role in a party, one of \"DAMAGER\", \"TANK\", \"HEALER\".",
            },
            [7] = {
                ["Name"] = "class",
                ["Desc"] = "String - The name of the class to which this specialization belongs.",
            },
        },
        ["Format"] = "id, name, description, icon, background, role = GetSpecializationInfoByID(specID)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "specID",
                ["Desc"] = "Number - Specialization ID of the specialization to query, returned from GetInspectSpecialization.",
            },
        },
        ["Desc"] = "Returns information about the specified specialization.",
    },
    ["GetCVarDefault"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "value",
                ["Desc"] = "String - Default value of the console variable.",
            },
        },
        ["Format"] = "value = GetCVarDefault(\"cvarName\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "cvarName",
                ["Desc"] = "String (CVar) - Name of the console variable to query.",
            },
        },
        ["Desc"] = "Returns the default value of a console variable.",
    },
    ["SortAuctionItems"] = {
        ["Desc"] = "Sorts the auction house display.",
        ["Format"] = "SortAuctionItems(\"type\", \"sort\");",
    },
    ["LootSlot"] = {
        ["Returns"] = "unknown",
        ["Format"] = "LootSlot(slot)",
        ["Arguments"] = "(slot)",
        ["Desc"] = "This will attempt to loot the specified slot. If you must confirm that you want to loot the slot (BoP, loot rolls, etc), then a follow-up call to ConfirmLootSlot is needed.",
    },
    ["IsSpellOverlayed"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isTrue",
                ["Desc"] = "Boolean - is it true if the spell is already using SpellActivationAlert, false otherwise",
            },
        },
        ["Format"] = "isTrue = IsSpellOverlayed(spellID)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "spellID",
                ["Desc"] = "Number - the spell ID number",
            },
        },
        ["Desc"] = "Returns whether spellID is using SpellActivationAlert (glowing-circle around it) currently, or not.",
    },
    ["AddQuestWatch"] = {
        ["Returns"] = "None",
        ["Format"] = "AddQuestWatch(questIndex[, watchTime])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "questIndex",
                ["Desc"] = "Number - The index of the quest in the quest log.",
            },
            [2] = {
                ["Name"] = "watchTime",
                ["Desc"] = "Number - The amount of time to watch the quest in seconds.",
            },
        },
        ["Desc"] = "Adds a quest to the list of quests being watched with an optional time to watch it.",
    },
    ["MouselookStop"] = {
        ["Desc"] = "Exits mouse look mode; allows mouse input to move the mouse cursor.",
        ["Format"] = "MouselookStop();",
    },
    ["ClearCursor"] = {
        ["Returns"] = "none",
        ["Format"] = "ClearCursor()",
        ["Arguments"] = "none",
        ["Desc"] = "Clears the in-game cursor, returning the object held to its original position (equivalent to right-clicking while holding something on the cursor).",
    },
    ["ClosePetition"] = {
        ["Returns"] = "nil",
        ["Format"] = "ClosePetition()",
        ["Arguments"] = "None",
        ["Desc"] = "Closes a petition that has been presented to the player.",
    },
    ["GetCurrencyListSize"] = {
        ["Desc"] = "Returns the number of entries in the currency list.",
        ["Format"] = "listSize = GetCurrencyListSize();",
    },
    ["LeaveParty"] = {
        ["Returns"] = "nil",
        ["Format"] = "LeaveParty()",
        ["Arguments"] = "None",
        ["Desc"] = "Leaves the current party.",
    },
    ["GetTradeSkillInvSlotFilter"] = {
        ["Desc"] = "local isVisible GetTradeSkillInvSlotFilter(slotIndex);ReturnvaluesisVisible",
        ["Format"] = "Whether the slot for slotIndex is visible (1) or not (nil).",
    },
    ["GetAuctionInvTypes"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["GetTransmogrifyCost"] = {
        ["Desc"] = "Returns the total cost and amount of (de)transmogrifications [1]",
        ["Format"] = "cost, numChanges = GetTransmogrifyCost()",
    },
    ["IsFactionInactive"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "inactive",
                ["Desc"] = "Flag - 1 if the faction is flagged as inactive, nil otherwise.",
            },
        },
        ["Format"] = "inactive = IsFactionInactive(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - index of the faction within the faction list, ascending from 1.",
            },
        },
        ["Desc"] = "Returns whether the player has flagged the specified faction as an inactive.",
    },
    ["ShowRepairCursor"] = {
        ["Returns"] = "nil",
        ["Format"] = "ShowRepairCursor()",
        ["Arguments"] = "none",
        ["Desc"] = "Puts the cursor in repair mode.",
    },
    ["NotifyInspect"] = {
        ["Desc"] = "Requests a unit's inventory and talent information from the server, allowing you to inspect the unit.",
        ["Format"] = "NotifyInspect(\"unit\")",
    },
    ["GetActionBarPage"] = {
        ["Desc"] = "Returns the index of the currently-selected action bar page.",
        ["Format"] = "index = GetActionBarPage()",
    },
    ["RepairAllItems"] = {
        ["Desc"] = "Repairs all equipped and inventory items.",
        ["Format"] = "RepairAllItems([guildBankRepair])",
    },
    ["ShowingHelm"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isShowingHelm",
                ["Desc"] = "1 (showing helm) or nil (not showing helm)",
            },
        },
        ["Format"] = "isShowingHelm = ShowingHelm()",
        ["Arguments"] = "None",
        ["Desc"] = "Returns 1 if the player is showing his helm",
    },
    ["GuildControlSetRank"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["GetTrainerServiceDescription"] = {
        ["Desc"] = "Returns the description of a specific trainer service.",
        ["Format"] = "GetTrainerServiceDescription(index);",
    },
    ["GetTradeSkillInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "skillName",
                ["Desc"] = "String - The name of the skill, e.g. \"Copper Breastplate\" or \"Daggers\", if the skillIndex references to a heading.",
            },
            [2] = {
                ["Name"] = "skillType",
                ["Desc"] = "String - \"header\", if the skillIndex references to a heading; \"subheader\", if the skillINdex references a subheader for things like the cooking specialties; or a string indicating the difficulty to craft the item (\"trivial\", \"easy\", \"medium\", \"optimal\", \"difficult\").",
            },
            [3] = {
                ["Name"] = "numAvailable",
                ["Desc"] = "Number - The number of items the player can craft with his available trade goods.",
            },
            [4] = {
                ["Name"] = "isExpanded",
                ["Desc"] = "Boolean - Returns if the header of the skillIndex is expanded in the crafting window or not",
            },
            [5] = {
                ["Name"] = "altVerb",
                ["Desc"] = "String - If not nil, a verb other than \"Create\" which describes the trade skill action (i.e., for Enchanting, this returns \"Enchant\"). If nil the expected verb is \"Create.\"",
            },
            [6] = {
                ["Name"] = "numSkillUps",
                ["Desc"] = "Number - The number of skill ups that the player can receive by crafting this item.",
            },
            [7] = {
                ["Name"] = "indentLevel",
                ["Desc"] = "Number - 0 or 1, indicates whether this skill should be indented beneath its header. Used for specialty subheaders and their recipes.",
            },
            [8] = {
                ["Name"] = "showProgressBar",
                ["Desc"] = "Boolean - indicates if a sub-progressbar must be displayed with the specialty current and max ranks. In the normal UI, those values are only shown when the mouse is over the sub-header.",
            },
            [9] = {
                ["Name"] = "currentRank",
                ["Desc"] = "Number - is a the current rank for the specialty if showProgressBar is true.",
            },
            [10] = {
                ["Name"] = "maxRank",
                ["Desc"] = "Number - is a the maximum rank for the specialty if showProgressBar is true.",
            },
            [11] = {
                ["Name"] = "startingRank",
                ["Desc"] = "Number - is the starting rank where the specialty is available. It is used as the starting value of the progress bar.",
            },
        },
        ["Format"] = "skillName, skillType, numAvailable, isExpanded, altVerb, numSkillUps, indentLevel, showProgressBar, currentRank, maxRank, startingRank = GetTradeSkillInfo(skillIndex)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "skillIndex",
                ["Desc"] = "Number - The id of the skill you want to query.",
            },
        },
        ["Desc"] = "Retrieves information about a specific trade skill.",
    },
    ["GetAbandonQuestName"] = {
        ["Desc"] = "Returns the name of a quest that will be abandoned if AbandonQuest is called.",
        ["Format"] = "questName = GetAbandonQuestName()",
    },
    ["GetBattlefieldPortExpiration"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "expiration",
                ["Desc"] = "Integer - Remaining time of battlefield port in seconds",
            },
        },
        ["Format"] = "",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Integer - Index of queue to get the expiration from",
            },
        },
        ["Desc"] = "",
    },
    ["SetWatchedFactionIndex"] = {
        ["Desc"] = "Sets the faction to be watched.",
        ["Format"] = "SetWatchedFactionIndex(index)",
    },
    ["ChannelToggleAnnouncements"] = {
        ["Desc"] = "Toggles the channel to display announcements either on or off.",
        ["Format"] = "ChannelToggleAnnouncements(channelName, name);",
    },
    ["GetCoinTextureString"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "formattedAmount",
                ["Desc"] = "String - a string suitable for printing or displaying.",
            },
        },
        ["Format"] = "formattedAmount = GetCoinTextureString(amount[, fontHeight])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "amount",
                ["Desc"] = "Number - the amount of money in copper (for example, the return value from GetMoney)",
            },
            [2] = {
                ["Name"] = "fontHeight",
                ["Desc"] = "Optional Number - the height of the coin icon; if not specified, defaults to 14.",
            },
        },
        ["Desc"] = "Breaks down an amount of money into gold/silver/copper, inserts appropriate \"|T\" texture strings for coin icons, and returns the resulting string.",
    },
    ["UnitIsPlayer"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["SetTradeSkillInvSlotFilter"] = {
        ["Desc"] = "Set the inventory slot type filter.",
        ["Format"] = "SetTradeSkillInvSlotFilter(slotIndex, onOff{, exclusive} );",
    },
    ["SetSelectedIgnore"] = {
        ["Desc"] = "Sets the currently selected ignore entry",
        ["Format"] = "SetSelectedIgnore(index)",
    },
    ["GetArchaeologyInfo"] = {
        ["Desc"] = "Returns the localized name for Archaeology.",
        ["Format"] = "localizedName = GetArchaeologyInfo()",
    },
    ["SetTracking"] = {
        ["Returns"] = "nothing",
        ["Format"] = "SetTracking(id,enabled);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "id",
                ["Desc"] = "The id of the tracking you would like to change. The id is assigned by the client, 1 is the first tracking method available on the tracking list, 2 is the next and so on. To get Information about a specific id, use GetTrackingInfo.",
            },
            [2] = {
                ["Name"] = "enabled",
                ["Desc"] = "Boolean flag if the specified tracking id is to be enabled or disabled.",
            },
        },
        ["Desc"] = "Enables or disables a tracking method with a specified id.",
    },
    ["GetReforgeItemStats"] = {
        ["Desc"] = "Returns the reforge item's stats [1] [2]",
        ["Format"] = "stats = {GetReforgeItemStats()}",
    },
    ["GetMacroInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - The name of the macro.",
            },
            [2] = {
                ["Name"] = "iconTexture",
                ["Desc"] = "String - Path to the icon texture currently displayed for the macro.",
            },
            [3] = {
                ["Name"] = "body",
                ["Desc"] = "String - Macro contents.",
            },
            [4] = {
                ["Name"] = "isLocal",
                ["Desc"] = "Flag - unknown.",
            },
        },
        ["Format"] = "name, iconTexture, body, isLocal = GetMacroInfo(\"name\" or macroSlot);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - Name of the macro to query.",
            },
        },
        ["Desc"] = "Return information about a macro.",
    },
    ["ConfirmBindOnUse"] = {
        ["Desc"] = "Accepts the confirmation to bind an item after attempting to loot a Bind on Pickup item (BoP) or attempting to equip a Bind on Equip item (BoE).",
        ["Format"] = "ConfirmBindOnUse()",
    },
    ["GetAchievementCategory"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "categoryID",
                ["Desc"] = "Number - ID of the achievement's category.",
            },
        },
        ["Format"] = "categoryID = GetAchievementCategory(achievementID)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "achievementID",
                ["Desc"] = "Number - ID of the achievement to retrieve information for.",
            },
        },
        ["Desc"] = "Returns the category number the requested achievement belongs to.",
    },
    ["SetSelectedArtifact"] = {
        ["Desc"] = "Set the artifact-pointer to raceIndex.",
        ["Format"] = "SetSelectedArtifact(raceIndex)",
    },
    ["GetBattlefieldScore"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - The player's name, with their server name attached if from a different server to the player.",
            },
            [2] = {
                ["Name"] = "killingBlows",
                ["Desc"] = "Number - Number of killing blows.",
            },
            [3] = {
                ["Name"] = "honorableKills",
                ["Desc"] = "Number - Number of honorable kills.",
            },
            [4] = {
                ["Name"] = "deaths",
                ["Desc"] = "Number - The number of deaths.",
            },
            [5] = {
                ["Name"] = "honorGained",
                ["Desc"] = "Number - The amount of honour gained so far (Bonus Honour).",
            },
            [6] = {
                ["Name"] = "faction",
                ["Desc"] = "Number - (Battlegrounds: Horde = 0, Alliance = 1 / Arenas: Green Team = 0, Yellow Team = 1).",
            },
            [7] = {
                ["Name"] = "race",
                ["Desc"] = "String - The players race (Orc, Undead, Human, etc).",
            },
            [8] = {
                ["Name"] = "class",
                ["Desc"] = "String - The players class (Mage, Hunter, Warrior, etc).",
            },
            [9] = {
                ["Name"] = "classToken",
                ["Desc"] = "String - The player's class name in english given in all capitals (MAGE , HUNTER, WARRIOR, etc)",
            },
            [10] = {
                ["Name"] = "damageDone",
                ["Desc"] = "Number - The amount of damage done.",
            },
            [11] = {
                ["Name"] = "healingDone",
                ["Desc"] = "Number - The amount of healing done.",
            },
            [12] = {
                ["Name"] = "talentSpec",
                ["Desc"] = "String - Localized name of player build",
            },
        },
        ["Format"] = "name, killingBlows, honorableKills, deaths, honorGained, faction, race, class, classToken, damageDone, healingDone, bgRating, ratingChange, preMatchMMR, mmrChange, talentSpec = GetBattlefieldScore(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - The characters index in battlegrounds, going from 1 to GetNumBattlefieldScores().",
            },
        },
        ["Desc"] = "Returns information about a player's score in battlegrounds.",
    },
    ["GetWeaponEnchantInfo"] = {
        ["Desc"] = "Returns information about the player's current temporary enchants, such as shaman weapon imbues, rogue poisons, and warlock spellstones.",
        ["Format"] = "hasMainHandEnchant, mainHandExpiration, mainHandCharges, hasOffHandEnchant, offHandExpiration, offHandCharges, hasThrownEnchant, thrownExpiration, thrownCharges = GetWeaponEnchantInfo()",
    },
    ["CancelTrade"] = {
        ["Desc"] = "Cancels the currently open trade.",
        ["Format"] = "CancelTrade()",
    },
    ["GrantLevel"] = {
        ["Desc"] = "Grant a custom amount of levels to a RaF-linked player.",
        ["Format"] = "GrantLevel(\"unit\", levels)",
    },
    ["GetItemStats"] = {
        ["Returns"] = {
            [1] = {
                ["Desc"] = "Table - A table of item stats. If statTable was supplied, it will also be returned.",
            },
        },
        ["Format"] = "stats = GetItemStats(itemLink, [statTable])",
        ["Arguments"] = {
            [1] = {
                ["Desc"] = "String - An item link for which to get stats.",
            },
        },
        ["Desc"] = "Returns a table of stats for an item.",
    },
    ["HasPetSpells"] = {
        ["Desc"] = "Returns how many abilities your pet has available.",
        ["Format"] = "hasPetSpells, petToken = HasPetSpells()",
    },
    ["GetNumBattlefieldScores"] = {
        ["Desc"] = "Appears to return the number of scores in the battleground/field scoreboard:",
        ["Format"] = "local x = GetNumBattlefieldScores();",
    },
    ["GetCurrencyListInfo"] = {
        ["Desc"] = "Returns information about an entry in the currency list.",
        ["Format"] = "name, isHeader, isExpanded, isUnused, isWatched, count, icon, maximum, hasWeeklyLimit, currentWeeklyAmount, unknown = GetCurrencyListInfo(index)",
    },
    ["SetPVP"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["GetNumQuestLogRewards"] = {
        ["Desc"] = "Returns the count of the rewards for a particular quest.",
        ["Format"] = "GetNumQuestLogRewards();",
    },
    ["SendWho"] = {
        ["Desc"] = "Sends a Who request, much like using the slash command /who or entering a query in the entry field of the Who List.",
        ["Format"] = "SendWho(filter)",
    },
    ["SetPortraitToTexture"] = {
        ["Desc"] = "Sets the texture to be displayed from a file applying a circular opacity mask making it look round like portraits.",
        ["Format"] = "SetPortraitToTexture(texture or \"texture\", \"texturePath\");",
    },
    ["SetPetStablePaperdoll"] = {
        ["Returns"] = "None",
        ["Format"] = "SetPetStablePaperdoll(modelObject)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "modelObject",
                ["Desc"] = "PlayerModel - The model of the pet to display.",
            },
        },
        ["Desc"] = "Sets the paperdoll model in the pet stable to a new player model.",
    },
    ["AddChatWindowChannel"] = {
        ["Desc"] = "Makes messages from a specified chat channel output in a specific chat frame.",
        ["Format"] = "AddChatWindowChannel(windowId, \"channelName\");",
    },
    ["AddOrRemoveFriend"] = {
        ["Desc"] = "Adds or removes player to or from the friends list.",
        ["Format"] = "AddOrRemoveFriend(\"player\"[, \"note\"])",
    },
    ["EJ_GetNumLoot"] = {
        ["Desc"] = "Returns the amount of loot for the currently viewed Instance or Encounter",
        ["Format"] = "numLoot = EJ_GetNumLoot()",
    },
    ["SetNextBarberShopStyle"] = {
        ["Desc"] = "Alters style selection in a particular customization category.",
        ["Format"] = "SetNextBarberShopStyle(catId[, reverse]);",
    },
    ["debugprofilestop"] = {
        ["Desc"] = "Returns the amount of time since profiling was started.",
        ["Format"] = "elapsedMilliseconds = debugprofilestop();",
    },
    ["GetSpellCharges"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "currentCharges",
                ["Desc"] = "Number - The number of charges of the ability currently available.",
            },
            [2] = {
                ["Name"] = "maxCharges",
                ["Desc"] = "Number - The maximum number of charges the ability may have available.",
            },
            [3] = {
                ["Name"] = "cooldownStart",
                ["Desc"] = "Number - Time (per GetTime) at which the next charge cooldown began, or 2^32 / 1000 if the spell is not currently recharging.",
            },
            [4] = {
                ["Name"] = "cooldownDuration",
                ["Desc"] = "Number - Time (in seconds) required to gain a charge.",
            },
        },
        ["Format"] = "currentCharges, maxCharges, cooldownStart, cooldownDuration = GetSpellCharges(spellId or \"spellName\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "spellId",
                ["Desc"] = "Number - spell ID of a player ability to query.",
            },
        },
        ["Desc"] = "Returns information about the charges of a charge-accumulating player ability.",
    },
    ["ClickTransmogrifySlot"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["SetMapToCurrentZone"] = {
        ["Desc"] = "Sets the world map to display the zone the player is currently in.",
        ["Format"] = "SetMapToCurrentZone()",
    },
    ["SetLootThreshold"] = {
        ["Desc"] = "Sets the loot quality threshold as a number for the party or raid.",
        ["Format"] = "SetLootThreshold(threshold)",
    },
    ["IsEquippedItemType"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isEqupped",
                ["Desc"] = "Boolean - is an item of the given type equipped",
            },
        },
        ["Format"] = "isEquipped = IsEquippedItemType(\"type\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "type",
                ["Desc"] = "String (ItemType) - any valid inventory type, item class, or item subclass",
            },
        },
        ["Desc"] = "Determines if an item of a given type is equipped.",
    },
    ["GetTransmogrifySlotInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isTransmogrified",
                ["Desc"] = "Boolean - If the item is currently tranmogrified",
            },
            [2] = {
                ["Name"] = "canTransmogrify",
                ["Desc"] = "Boolean - If the item is applicable for transmogrification",
            },
            [3] = {
                ["Name"] = "cannotTransmogrifyReason",
                ["Desc"] = "Number - The error reason index if canTransmogrify is false [2]",
            },
            [4] = {
                ["Name"] = "hasPending",
                ["Desc"] = "Boolean - If the item is currently pending transmogrification",
            },
            [5] = {
                ["Name"] = "hasUndo",
                ["Desc"] = "Boolean - If the item is currently pending detransmogrification",
            },
            [6] = {
                ["Name"] = "visibleItemID",
                ["Desc"] = "Number - The currently \"visible\" Item ID",
            },
            [7] = {
                ["Name"] = "textureName",
                ["Desc"] = "String - The currently \"visible\" Item Icon",
            },
        },
        ["Format"] = "isTransmogrified, canTransmogrify, cannotTransmogrifyReason, hasPending, hasUndo, visibleItemID, textureName = GetTransmogrifySlotInfo(slotId)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "slotId",
                ["Desc"] = "Number - Inventory Slot Id",
            },
        },
        ["Desc"] = "Returns info about the given transmogrify slot item [1]",
    },
    ["SetLootMethod"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["SetLFGComment"] = {
        ["Desc"] = "Sets your comment in the LFG interface.",
        ["Format"] = "SetLFGComment(\"comment\")",
    },
    ["GetQuestLogTitle"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "title",
                ["Desc"] = "String - The title of the quest, or nil if the index is out of range.",
            },
            [2] = {
                ["Name"] = "level",
                ["Desc"] = "Integer - The level of the quest",
            },
            [3] = {
                ["Name"] = "suggestedGroup",
                ["Desc"] = "Integer - If the quest is designed for more than one player, it is the number of players suggested to complete the quest. Otherwise, it is 0.",
            },
            [4] = {
                ["Name"] = "isHeader",
                ["Desc"] = "Boolean - 1 if the entry is a header, nil otherwise.",
            },
            [5] = {
                ["Name"] = "isCollapsed",
                ["Desc"] = "Boolean - 1 if the entry is a collapsed header, nil otherwise.",
            },
            [6] = {
                ["Name"] = "isComplete",
                ["Desc"] = "Integer - 1 if the quest is completed, -1 if the quest is failed, , nil otherwise.",
            },
            [7] = {
                ["Name"] = "frequency",
                ["Desc"] = "Integer - The reset period of the quest. For example, dailies are '1' and weeklies are '7'.",
            },
            [8] = {
                ["Name"] = "questID",
                ["Desc"] = "Integer - The quest identification number. This is the number found in GetQuestsCompleted() after it has been completed. It is also the number used to identify quests on sites such as Wowhead.com (Example: Rest and Relaxation)",
            },
            [9] = {
                ["Name"] = "startEvent",
                ["Desc"] = "Boolean -?",
            },
            [10] = {
                ["Name"] = "displayQuestID",
                ["Desc"] = "Integer -?",
            },
            [11] = {
                ["Name"] = "isOnMap",
                ["Desc"] = "Boolean -?",
            },
            [12] = {
                ["Name"] = "hasLocalPOI",
                ["Desc"] = "Boolean -?",
            },
            [13] = {
                ["Name"] = "isTask",
                ["Desc"] = "Boolean -?",
            },
            [14] = {
                ["Name"] = "isStory",
                ["Desc"] = "Boolean -?",
            },
        },
        ["Format"] = "title, level, suggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isStory = GetQuestLogTitle(questIndex);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "questIndex",
                ["Desc"] = "Integer - The index of the quest you wish to get information about, between 1 and GetNumQuestLogEntries()'s first return value.",
            },
        },
        ["Desc"] = "Returns information about a quest in your quest log.",
    },
    ["SetLayoutMode"] = {
        ["Desc"] = "Transfers the UI renderer into the selected layout mode",
        ["Format"] = "SetLayoutMode([newState])",
    },
    ["CalendarGetDate"] = {
        ["Desc"] = "Get the current date from the Calendar API",
        ["Format"] = "weekday, month, day, year = CalendarGetDate();",
    },
    ["GetQuestItemLink"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "itemLink",
                ["Desc"] = "String - The link to the quest item specified.",
            },
        },
        ["Format"] = "itemLink = GetQuestItemLink(\"type\", index);",
        ["Arguments"] = "(String \"type\", Integer index)",
        ["Desc"] = "Returns link to the quest item.",
    },
    ["ChannelInvite"] = {
        ["Desc"] = "Invites the specified user to the channel.",
        ["Format"] = "ChannelInvite(channelName, playerName);",
    },
    ["PetStopAttack"] = {
        ["Desc"] = "Stops pet from attacking.",
        ["Format"] = "PetStopAttack()",
    },
    ["GuildDisband"] = {
        ["Returns"] = "nil",
        ["Format"] = "GuildDisband()",
        ["Arguments"] = "None",
        ["Desc"] = "Disbands your guild (guild leader only)",
    },
    ["RejectProposal"] = {
        ["Desc"] = "Rejects an Dungeon Finder group invitation and leaves the queue.",
        ["Format"] = "RejectProposal();",
    },
    ["AddIgnore"] = {
        ["Desc"] = "Adds a player to your ignore list.",
        ["Format"] = "AddIgnore(playerName);",
    },
    ["IsIndoors"] = {
        ["Desc"] = "Returns whether the player's character is currently indoors. Most mounts are not usable indoors.",
        ["Format"] = "indoors = IsIndoors();",
    },
    ["GetGlyphClearInfo"] = {
        ["Desc"] = "Returns information about the current cost of removing a glyph.",
        ["Format"] = "name, count, icon, spellId, cost = GetGlyphClearInfo()",
    },
    ["SetFactionInactive"] = {
        ["Desc"] = "Flags the specified faction as inactive.",
        ["Format"] = "SetFactionInactive(index)",
    },
    ["ActionHasRange"] = {
        ["Desc"] = "Returns true if the action has a numeric range requirement.",
        ["Format"] = "isTrue = ActionHasRange(slotID)",
    },
    ["IsAddOnLoaded"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "loaded",
                ["Desc"] = "Flag - 1 if the addon has been, or is being loaded, nil otherwise.",
            },
            [2] = {
                ["Name"] = "finished",
                ["Desc"] = "Flag - 1 if the addon has finished loading (the ADDON_LOADED has already been fired for this addon), nil otherwise.",
            },
        },
        ["Format"] = "loaded, finished = IsAddOnLoaded(index or \"name\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Integer - The index of the addon in the user's addon list. You cannot query Blizzard-provided AddOns using this parameter.",
            },
        },
        ["Desc"] = "Returns whether an addon has been loaded.",
    },
    ["GetArmorPenetration"] = {
        ["Desc"] = "Returns the percentage of target's armory your physical attacks ignore due to armor penetration.",
        ["Format"] = "armorPen = GetArmorPenetration()",
    },
    ["GetQuestIndexForTimer"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "questIndex",
                ["Desc"] = "Number - The quest log's index of the timed quest.",
            },
        },
        ["Format"] = "questIndex = GetQuestIndexForTimer(timerId)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "timerId",
                ["Desc"] = "Number - The ID of a quest timer.",
            },
        },
        ["Desc"] = "Gets the quest log index of a quest being timed.",
    },
    ["SetFactionActive"] = {
        ["Desc"] = "Clears the inactive flag on the specified faction.",
        ["Format"] = "SetFactionActive(index)",
    },
    ["GetLFGBootProposal"] = {
        ["Desc"] = "Returns information about an LFG Kick vote currently in progress.",
        ["Format"] = "inProgress, didVote, myVote, targetName, totalVotes, bootVotes, timeLeft, reason = GetLFGBootProposal();",
    },
    ["SetCursor"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "changed",
                ["Desc"] = "Flag - always 1.",
            },
        },
        ["Format"] = "changed = SetCursor(\"cursor\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "cursor",
                ["Desc"] = "String - cursor to switch to; either a built-in cursor identifier (like \"ATTACK_CURSOR\"), path to a cursor texture (e.g. \"Interface/Cursor/Taxi\"), or nil to reset to a default cursor.",
            },
        },
        ["Desc"] = "Changes the current cursor graphic.",
    },
    ["MouselookStart"] = {
        ["Desc"] = "Enters mouse look mode, during which mouse movement is used to alter the character's movement/facing direction.",
        ["Format"] = "MouselookStart();",
    },
    ["GetGuildBankItemLink"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "itemLink",
                ["Desc"] = "String - The item link for the item. Returns nil if there is no item.",
            },
        },
        ["Format"] = "itemLink = GetGuildBankItemInfo(tab,slot)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "tab",
                ["Desc"] = "Integer - The index of the tab in the guild bank",
            },
            [2] = {
                ["Name"] = "slot",
                ["Desc"] = "Integer - The index of the slot in the provided tab.",
            },
        },
        ["Desc"] = "Returns the item link for an item in the given Guild Bank tab and slot.",
    },
    ["GetLFRChoiceOrder"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "raidList",
                ["Desc"] = "Table - Key =?; Value = Dungeon ID",
            },
        },
        ["Format"] = "raidList = GetLFRChoiceOrder([LFRRaidList])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "LFRRaidList",
                ["Desc"] = "Table -?",
            },
        },
        ["Desc"] = "Seems to be for used ordering the LFR list [1]",
    },
    ["DeclineQuest"] = {
        ["Desc"] = "Declines the currently offered quest.",
        ["Format"] = "DeclineQuest()",
    },
    ["GetTradeskillRepeatCount"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "repeatCount",
                ["Desc"] = "Number - The number of times the current tradeskill item is being crafted.",
            },
        },
        ["Format"] = "local repeatCount = GetTradeskillRepeatCount()",
        ["Arguments"] = "None",
        ["Desc"] = "Returns the number of times the current item is being crafted.",
    },
    ["SetConsoleKey"] = {
        ["Desc"] = "Sets the key used to open the console overlay for the current session.",
        ["Format"] = "SetConsoleKey(\"key\")",
    },
    ["AcceptGroup"] = {
        ["Desc"] = "Accept the invitation to a group.",
        ["Format"] = "AcceptGroup()",
    },
    ["GetWorldStateUIInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "uiType",
                ["Desc"] = "Number - 1 if the element should be conditionally displayed (based on the state of the \"Show World PvP Objectives\" setting and the player's location).",
            },
            [2] = {
                ["Name"] = "state",
                ["Desc"] = "Number - 0 indicates the element will not be displayed. In Warsong Gulch, returns 1 if the team does not hold the enemy flag and 2 if the team does.",
            },
            [3] = {
                ["Name"] = "hidden",
                ["Desc"] = "Boolean -?",
            },
            [4] = {
                ["Name"] = "text",
                ["Desc"] = "String - Score ([score]/1600 inside Arathi Basin and Eye of the Storm; [score]/3 inside Warsong Gulch)",
            },
            [5] = {
                ["Name"] = "icon",
                ["Desc"] = "String - Icon ( or  icon path returned inside Warsong Gulch)",
            },
            [6] = {
                ["Name"] = "dynamicIcon",
                ["Desc"] = "String - Second icon thats usually position to the right of the main icon (Alliance flag or Horde flag icon path returned insied Warsong Gulch)",
            },
            [7] = {
                ["Name"] = "tooltip",
                ["Desc"] = "String - Tooltip displayed when hovering over the row (eg \"Horde flag captures\")",
            },
            [8] = {
                ["Name"] = "dynamicTooltip",
                ["Desc"] = "String - Tooltip displayed when hovering over the dynamicIcon (eg \"Alliance flag has been picked up\")",
            },
            [9] = {
                ["Name"] = "extendedUI",
                ["Desc"] = "String - \"CAPTUREPOINT\" for objective capture bar, \"\" for regular objectives,",
            },
            [10] = {
                ["Name"] = "extendedUIState1",
                ["Desc"] = "Number - for CaptureBar: current objective position: 100 means left, 0 means right,",
            },
            [11] = {
                ["Name"] = "extendedUIState2",
                ["Desc"] = "Number - for CaptureBar: neutral zone width: 0 means no neutral zone, 90 means 5% Alliance, 90% neutral and 5% Horde,",
            },
            [12] = {
                ["Name"] = "extendedUIState3",
                ["Desc"] = "Number - for CaptureBar: bar index.",
            },
        },
        ["Format"] = "uiType, state, hidden, text, icon, dynamicIcon, tooltip, dynamicTooltip, extendedUI, extendedUIState1, extendedUIState2, extendedUIState3 = GetWorldStateUIInfo(index);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number: between 1 and GetNumWorldStateUI().",
            },
        },
        ["Desc"] = "Get score and flag status within a battlefield.",
    },
    ["IsRightShiftKeyDown"] = {
        ["Desc"] = "There are three seperate levels of IsModifierKeyDown() type API functions but they all do the same basic function and return true if the specified key is currently pressed down.The first level is one function to tell you if any of the modifier keys are down IsModifierKeyDown()The second level is the three diferent functions one for each type of Modifier key: Shift, Alt &amp; CtrlThe third is one function for each seperate modifier key: Left Alt, Right Alt, Left Shift, Right Shift, Left Ctrl &amp; Right Ctrl.Is Any Modifier Key DownReturns whether ANY modifier key is currently pressed down.",
        ["Format"] = "anyModKeyIsDown = IsModifierKeyDown();",
    },
    ["CalendarGetDayEventSequenceInfo"] = {
        ["Returns"] = "sequenceIndex, numSequenceDays, sequenceType",
        ["Format"] = "sequenceIndex, numSequenceDays, sequenceType = CalendarGetDayEventSequenceInfo(monthOffset, day, eventIndex);",
        ["Arguments"] = "(monthOffset, day, eventIndex)",
        ["Desc"] = "Retrieve information about the specified event.",
    },
    ["SetActionBarToggles"] = {
        ["Returns"] = "nil",
        ["Format"] = "SetActionBarToggles(bottomLeftState, bottomRightState, sideRightState, sideRight2State)",
        ["Arguments"] = "(bottomLeftState, bottomRightState, sideRightState, sideRight2State)",
        ["Desc"] = "Set the desired state of the extra action bars.",
    },
    ["EJ_SetDifficulty"] = {
        ["Desc"] = "Sets the encounter difficulty shown in the Encounter Journal.",
        ["Format"] = "EJ_SetDifficulty(difficultyID)",
    },
    ["GetBinding"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "command",
                ["Desc"] = "(string) The name of the command the keys are bound to (e.g. MOVEFORWARD, TOGGLEFRIENDSTAB). Used in GetBindingKey(\"command\") among other things.",
            },
            [2] = {
                ["Name"] = "key1-N",
                ["Desc"] = "(string) The string representation of the key bound to this command (e.g. W, CTRL-F). Even though the default key binding GUI window only displays 2 possible keys bound to each command, it appears there is no limit to the number of keys that can be bound to a single command. This function will return as many keys as have been set with SetBinding.",
            },
        },
        ["Format"] = "command, key1, key2 = GetBinding(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "A value from 1 to X where X is the number returned from GetNumBindings.",
            },
        },
        ["Desc"] = "Returns the command name and all keys currently bound to the command specified by index. This would generally be used in conjunction with GetNumBindings to loop through and set/get all of the key bindings available.",
    },
    ["UpdateMapHighlight"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - The name of the area which is being pointed at.",
            },
            [2] = {
                ["Name"] = "fileName",
                ["Desc"] = "String - The filename of the highlight texture to use, or nil if none.",
            },
            [3] = {
                ["Name"] = "texPctX",
                ["Desc"] = "Number - Proportion of the highlight texture's full width to use (proportion from 0 to 1) this is a guess",
            },
            [4] = {
                ["Name"] = "texPctY",
                ["Desc"] = "Number - Proportion of the highlight texture's full height to use (proportion from 0 to 1) this is a guess",
            },
            [5] = {
                ["Name"] = "texX",
                ["Desc"] = "Number - The width of the highlight texture as a proportion of the map's width (between 0 and 1)",
            },
            [6] = {
                ["Name"] = "texY",
                ["Desc"] = "Number - The height of the highlight texture as a proportion of the map's height (between 0 and 1)",
            },
            [7] = {
                ["Name"] = "scrollX",
                ["Desc"] = "Number - The X location of the start of the highlight texture as a proportion of the map's width (between 0 and 1)",
            },
            [8] = {
                ["Name"] = "scrollY",
                ["Desc"] = "Number - The Y location of the start of the highlight texture as a proportion of the map's height (between 0 and 1)",
            },
        },
        ["Format"] = "",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "x",
                ["Desc"] = "Number - X position of the click (A proportion between 0 and 1, relative to WorldMapDetailFrame)",
            },
            [2] = {
                ["Name"] = "y",
                ["Desc"] = "Number - Y position of the click (A proportion between 0 and 1, relative to WorldMapDetailFrame)",
            },
        },
        ["Desc"] = "",
    },
    ["GetArtifactProgress"] = {
        ["Desc"] = "Returns information about current used fragments for the selected artifact.",
        ["Format"] = "numFragmentsCollected, numFragmentsAdded, numFragmentsRequired = GetArtifactProgress();",
    },
    ["GetVoidItemInfo"] = {
        ["Format"] = "itemID, textureName, locked, recentDeposit, isFiltered = GetVoidItemInfo(slotIndex)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "slotIndex",
                ["Desc"] = {
                    [1] = {
                        ["Desc"] = "Note: The index starts from top to bottom first (vertically), then left to right (horizontally); This is similar to the Guild Bank frame",
                    },
                },
            },
        },
        ["Desc"] = "Returns info about a Void Storage slot [1]",
    },
    ["issecurevariable"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isSecure",
                ["Desc"] = "Flag - 1 if the table[variable] key is secure, nil if it is tainted.",
            },
            [2] = {
                ["Name"] = "taint",
                ["Desc"] = "String - name of the addon that tainted the table field; an empty string if tainted by a macro; nil if secure.",
            },
        },
        ["Format"] = "isSecure, taint = issecurevariable([table,] \"variable\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "table",
                ["Desc"] = "Table - table to check the the key in; if omitted, defaults to the globals table (_G).",
            },
            [2] = {
                ["Name"] = "variable",
                ["Desc"] = "String - string key to check the taint of. Numbers will be converted to a string; other types will throw an error.",
            },
        },
        ["Desc"] = "Determines whether the given table key is secure.",
    },
    ["GetSpellCritChance"] = {
        ["Desc"] = "Returns a players critical hit chance with spells for a certain school.",
        ["Format"] = "theCritChance = GetSpellCritChance(school)",
    },
    ["IsConsumableItem"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isConsumable",
                ["Desc"] = "Flag - 1 if the item is consumed when used, nil otherwise",
            },
        },
        ["Format"] = "isConsumable = IsConsumableItem(itemID or itemLink or itemName)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "item",
                ["Desc"] = "Mixed - An item ID (number), item link or item name (string) to query",
            },
        },
        ["Desc"] = "Returns whether an item is consumed when used.",
    },
    ["GetAutoCompleteResults"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "nick1, nick2, ...",
                ["Desc"] = "String - auto-completed name of a player that satisfies the requirements.",
            },
        },
        ["Format"] = "nick1, nick2, ... = GetAutoCompleteResults(\"text\", include, exclude, maxResults[, cursorPosition]);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "text",
                ["Desc"] = "String - first characters of the possible names to be autocompleted",
            },
            [2] = {
                ["Name"] = "include",
                ["Desc"] = "Number - bit mask of filters that the results must match at least one of.",
            },
            [3] = {
                ["Name"] = "exclude",
                ["Desc"] = "Number - bit mask of filters that the results must not match any of.",
            },
            [4] = {
                ["Name"] = "maxResults",
                ["Desc"] = "Number - number of results desired.",
            },
            [5] = {
                ["Name"] = "cursorPosition",
                ["Desc"] = "Number - position of the cursor within the editbox (i.e. how much of the text string should be matching).",
            },
        },
        ["Desc"] = "Returns possible player names matching a given prefix string and specified requirements.",
    },
    ["SendChatMessage"] = {
        ["Desc"] = "Sends a chat message.",
        ["Format"] = "SendChatMessage(\"msg\" [,\"chatType\" [,languageID [,\"channel\"]]]);",
    },
    ["AbandonQuest"] = {
        ["Desc"] = "Abandons the quest specified by SetAbandonQuest",
        ["Format"] = "AbandonQuest();",
    },
    ["SendAddonMessage"] = {
        ["Desc"] = "Sends a message to the hidden addon channel. Introduced in Patch 1.12.",
        ["Format"] = "SendAddonMessage(\"prefix\", \"text\", \"type\", \"target\")",
    },
    ["SelectTrainerService"] = {
        ["Returns"] = "nil",
        ["Format"] = "SelectTrainerService(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - Index of the trainer service being selected. Note that indices are affected by the trainer filter. (See GetTrainerServiceTypeFilter and SetTrainerServiceTypeFilter.)",
            },
        },
        ["Desc"] = "Notifies the server that a trainer service has been selected.",
    },
    ["QuestChooseRewardError"] = {
        ["Desc"] = "Throws an error when the choose reward method doesn't work.",
        ["Format"] = "QuestChooseRewardError();",
    },
    ["SelectGossipAvailableQuest"] = {
        ["Desc"] = "Selects an available quest from a gossip list.",
        ["Format"] = "SelectGossipAvailableQuest(index)",
    },
    ["EJ_GetNumSearchResults"] = {
        ["Desc"] = "Returns the number of search results",
        ["Format"] = "numResults = EJ_GetNumSearchResults()",
    },
    ["GetInventoryItemBroken"] = {
        ["Returns"] = "isBroken",
        ["Format"] = "isBroken = GetInventoryItemBroken(\"unit\", slotId)",
        ["Arguments"] = "(\"unit\", slotId)",
        ["Desc"] = "Determine if an inventory item is broken (no durability)",
    },
    ["GetBattlefieldWinner"] = {
        ["Desc"] = "Get the winner of the battlefield",
        ["Format"] = "winner = GetBattlefieldWinner()",
    },
    ["GetSummonFriendCooldown"] = {
        ["Desc"] = "Returns information about the cooldown time of the RaF Summon Friend ability.",
        ["Format"] = "start, duration = GetSummonFriendCooldown()",
    },
    ["GetRewardText"] = {
        ["Desc"] = "Returns quest reward text, displayed by the NPC before the player hits \"Complete Quest\".",
        ["Format"] = "GetRewardText();",
    },
    ["SearchLFGGetNumResults"] = {
        ["Desc"] = "Returns how many players listed in raid browser for selected LFG id.",
        ["Format"] = "numResults, totalResults = SearchLFGGetNumResults();",
    },
    ["GetAddOnCPUUsage"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "time",
                ["Desc"] = "Number - The total time used by the specified AddOn, in milliseconds.",
            },
        },
        ["Format"] = "time = GetAddOnCPUUsage(index|\"name\")",
        ["Arguments"] = "(index|\"name\")",
        ["Desc"] = "Returns the total time used by the specified AddOn.",
    },
    ["BuyTrainerService"] = {
        ["Returns"] = "nil",
        ["Format"] = "BuyTrainerService(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - The index of the service to train.",
            },
        },
        ["Desc"] = "Buys a service available at the current trainer.",
    },
    ["CloseMail"] = {
        ["Returns"] = "nil",
        ["Format"] = "CloseMail()",
        ["Arguments"] = "none",
        ["Desc"] = "Closes the 'Mailbox' window.",
    },
    ["SaveBindings"] = {
        ["Desc"] = "Writes the current in-memory key bindings to disk.",
        ["Format"] = "SaveBindings(which)",
    },
    ["GetBattlefieldInstanceRunTime"] = {
        ["Desc"] = "Returns the time passed since the battleground started.",
        ["Format"] = "time = GetBattlefieldInstanceRunTime()",
    },
    ["CancelDuel"] = {
        ["Desc"] = "Forfeits the current duel, or declines an invitation to duel.",
        ["Format"] = "CancelDuel();",
    },
    ["GetNumFactions"] = {
        ["Desc"] = "Returns the number of lines in the faction display.",
        ["Format"] = "numFactions = GetNumFactions()",
    },
    ["AcceptXPLoss"] = {
        ["Desc"] = "Accept the durability loss / resurrection sickness when being resurrected by the spirit healer.",
        ["Format"] = "AcceptXPLoss();",
    },
    ["GetDefaultLanguage"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "language",
                ["Desc"] = "the default language of the indicated object, usually the faction's common language (i.e. \"Common\" and \"Orcish\").",
            },
        },
        ["Format"] = "language = GetDefaultLanguage(unit);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "player",
                ["Desc"] = "UnitId - unit whose default language you wish to query.",
            },
        },
        ["Desc"] = "Returns the Language used by the indicated Player.",
    },
    ["KBSetup_GetSubCategoryData"] = {
        ["Returns"] = "id, caption",
        ["Format"] = "id, caption = KBSetup_GetSubCategoryData(category, index)",
        ["Arguments"] = "(category, index)",
        ["Desc"] = "Returns information about a subcategory.",
    },
    ["RetrieveCorpse"] = {
        ["Returns"] = "nil",
        ["Format"] = "RetrieveCorpse()",
        ["Arguments"] = "None",
        ["Desc"] = "Resurrects when the player is standing near its corpse.",
    },
    ["GetGuildInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "guildName",
                ["Desc"] = "String - The name of the guild the unit is in (or nil?).",
            },
            [2] = {
                ["Name"] = "guildRankName",
                ["Desc"] = "String - unit's rank in unit's guild.",
            },
            [3] = {
                ["Name"] = "guildRankIndex",
                ["Desc"] = "Integer - unit's rank (index). - zero based index (0 is Guild Master, 1 and above are lower ranks)",
            },
        },
        ["Format"] = "guildName, guildRankName, guildRankIndex = GetGuildInfo(unit);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "UnitId - The unit whose guild information you wish to query.",
            },
        },
        ["Desc"] = "Returns guild-related information about a unit.",
    },
    ["GetAuctionItemBattlePetInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "creatureID",
                ["Desc"] = "Number - An indexing value Blizzard uses to number NPCs.",
            },
            [2] = {
                ["Name"] = "displayID",
                ["Desc"] = "Number - An indexing value Blizzard uses to number model/skin combinations.",
            },
        },
        ["Format"] = "creatureID, displayID = GetAuctionItemBattlePetInfo(\"type\", index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "type",
                ["Desc"] = {
                    [1] = {
                        ["Desc"] = "\"list\" - An item up for auction, the \"Browse\" tab in the dialog.\"bidder\" - An item the player has bid on, the \"Bids\" tab in the dialog.\"owner\" - An item the player has up for auction, the \"Auctions\" tab in the dialog.",
                    },
                },
            },
        },
        ["Desc"] = "Retrieves info about one Battle Pet in the current retrieved list of Battle Pets from the Auction House.",
    },
    ["GetPetFoodTypes"] = {
        ["Desc"] = "Returns the food types the current pet can eat.",
        ["Format"] = "local petFoodList = { GetPetFoodTypes() };",
    },
    ["ResetCursor"] = {
        ["Returns"] = "none",
        ["Format"] = "ResetCursor();",
        ["Arguments"] = "none",
        ["Desc"] = "Resets mouse cursor.",
    },
    ["GetTradeSkillReagentItemLink"] = {
        ["Returns"] = "link",
        ["Format"] = "link = GetTradeSkillReagentItemLink(skillId, reagentId)",
        ["Arguments"] = "(skillId, reagentId)",
        ["Desc"] = "Gets the link string for a trade skill reagent.",
    },
    ["RequestInspectHonorData"] = {
        ["Desc"] = "Requests PvP participation information for the currently inspected target.",
        ["Format"] = "RequestInspectHonorData()",
    },
    ["KBArticle_GetData"] = {
        ["Returns"] = "id, subject, subjectAlt, text, keywords, languageId, isHot",
        ["Format"] = "id, subject, subjectAlt, text, keywords, languageId, isHot = KBArticle_GetData()",
        ["Arguments"] = "()",
        ["Desc"] = "Returns data for the current article.",
    },
    ["GetBonusBarOffset"] = {
        ["Desc"] = "Returns the current bonus action bar index.",
        ["Format"] = "offset = GetBonusBarOffset()",
    },
    ["GetQuestTimers"] = {
        ["Returns"] = "Strings questTimers",
        ["Format"] = "GetQuestTimers();",
        ["Arguments"] = "none",
        ["Desc"] = "Returns all of the quest timers currently in progress.",
    },
    ["RepopMe"] = {
        ["Desc"] = "Releases your ghost to the graveyard.",
        ["Format"] = "RepopMe();",
    },
    ["ChannelModerator"] = {
        ["Desc"] = "Sets the specified player as the channel moderator.",
        ["Format"] = "ChannelModerator(channelName, playerName);",
    },
    ["ReplaceGuildMaster"] = {
        ["Desc"] = "Impeaches the current Guild Master.",
        ["Format"] = "ReplaceGuildMaster()",
    },
    ["ReplaceEnchant"] = {
        ["Desc"] = "Confirms the \"Replace Enchant\" dialog.",
        ["Format"] = "ReplaceEnchant()",
    },
    ["GetQuestGreenRange"] = {
        ["Desc"] = "Return for how many levels below you quests and mobs remain \"green\" (i.e. yield xp)",
        ["Format"] = "range = GetQuestGreenRange()",
    },
    ["GetTitleText"] = {
        ["Desc"] = "Returns the name of the last-offered quest.",
        ["Format"] = "title = GetTitleText()",
    },
    ["GetFrameCPUUsage"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "time",
                ["Desc"] = "Number - The total time used by the specified event handlers, in milliseconds.",
            },
            [2] = {
                ["Name"] = "count",
                ["Desc"] = "Number - The total number of times the event handlers were called.",
            },
        },
        ["Format"] = "time, count = GetFrameCPUUsage(frame[, includeChildren])",
        ["Arguments"] = "(frame[, includeChildren])",
        ["Desc"] = "Returns the total time used by and number of calls of a frame's event handlers.",
    },
    ["GetLootRollItemLink"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "itemLink",
                ["Desc"] = "itemLink",
            },
        },
        ["Format"] = "itemLink = GetLootRollItemLink(id)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "id",
                ["Desc"] = "Number - id is a number used by the server to keep track of items being rolled on. It is generated server side and transmitted to the client.",
            },
        },
        ["Desc"] = "Retrieves the itemLink of an item being rolled on.",
    },
    ["GetInventoryItemDurability"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "current",
                ["Desc"] = "Number - current durability value.",
            },
            [2] = {
                ["Name"] = "maximum",
                ["Desc"] = "Number - maximum durability value.",
            },
        },
        ["Format"] = "current, maximum = GetInventoryItemDurability(slot);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "slot",
                ["Desc"] = "Number - Inventory slot index to query durability of.",
            },
        },
        ["Desc"] = "Returns current and maximum durability of an equipped item.",
    },
    ["RemoveChatWindowMessages"] = {
        ["Desc"] = "Stops the specified chat window from displaying a specified type of messages.",
        ["Format"] = "RemoveChatWindowMessages(index, \"messageGroup\")",
    },
    ["RemoveChatWindowChannel"] = {
        ["Desc"] = "Blocks further messages from a specified chat channel from appearing in a specific chat frame.",
        ["Format"] = "RemoveChatWindowChannel(windowId, \"channelName\");",
    },
    ["GetSpecializationInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "id",
                ["Desc"] = "Number - specialization ID.",
            },
            [2] = {
                ["Name"] = "name",
                ["Desc"] = "String - specialization name, e.g. \"Balance\".",
            },
            [3] = {
                ["Name"] = "description",
                ["Desc"] = "String - description of the specialization, e.g. \"Can take on the form of a powerful Moonkin, balancing the power of Arcane and Nature magic to destroy enemies at a distance.\"",
            },
            [4] = {
                ["Name"] = "icon",
                ["Desc"] = "String - Texture path to this specialization's icon.",
            },
            [5] = {
                ["Name"] = "background",
                ["Desc"] = "String - Background texture name for this talent tree; prepend \"Interface\\TALENTFRAME\\\" to this value for a valid texture path.",
            },
            [6] = {
                ["Name"] = "role",
                ["Desc"] = "String - This specialization's intended role in a party, one of \"DAMAGER\", \"TANK\", \"HEALER\".",
            },
        },
        ["Format"] = "id, name, description, icon, background, role = GetSpecializationInfo(specIndex [, isInspect [, isPet]])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "specIndex",
                ["Desc"] = "Number - Index of the specialization to query, ascending from 1 to GetNumSpecializations().",
            },
            [2] = {
                ["Name"] = "isInspect",
                ["Desc"] = "Optional boolean - If true, query specialization information for the inspected unit.",
            },
            [3] = {
                ["Name"] = "isPet",
                ["Desc"] = "Optional boolean - If true, query specialization information for the player's pet.",
            },
        },
        ["Desc"] = "Returns information about the player's specializations.",
    },
    ["ReforgeItem"] = {
        ["Returns"] = "Using 0 as the Reforge ID will restore the reforge",
        ["Format"] = "ReforgeItem(reforgeID)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "reforgeID",
                ["Desc"] = "Number - Reforge ID",
            },
        },
        ["Desc"] = "Reforges the current item, and pays for the cost [1]",
    },
    ["CloseTradeSkill"] = {
        ["Returns"] = "nil",
        ["Format"] = "CloseTradeSkill();",
        ["Arguments"] = "none",
        ["Desc"] = "Closes an open trade skill window.",
    },
    ["IsThreatWarningEnabled"] = {
        ["Desc"] = "Returns whether threat warnings are currently enabled.",
        ["Format"] = "enabled = IsThreatWarningEnabled();",
    },
    ["GetCategoryInfo"] = {
        ["Returns"] = "Title, ParentCategoryID, Unknown",
        ["Format"] = "Title, ParentCategoryID, Something = GetCategoryInfo(CategoryID)",
        ["Arguments"] = "(Number CategoryID)",
        ["Desc"] = "Returns information about the given Category. New in Patch 3.0",
    },
    ["QuestLogPushQuest"] = {
        ["Desc"] = "Initiates the sharing of the currently viewed quest in the quest log with other players.",
        ["Format"] = "QuestLogPushQuest();",
    },
    ["GetNumShapeshiftForms"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["GetSpellTabInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - The name of the spell line (General, Shadow, Fury, etc.)",
            },
            [2] = {
                ["Name"] = "texture",
                ["Desc"] = "String - The texture path for the spell line's icon",
            },
            [3] = {
                ["Name"] = "offset",
                ["Desc"] = "Number - Number of spell book entries before this tab (one less than index of the first spell book item in this tab)",
            },
            [4] = {
                ["Name"] = "numEntries",
                ["Desc"] = "Number - The number of spell entries in this tab.",
            },
            [5] = {
                ["Name"] = "isGuild",
                ["Desc"] = "Boolean - true for Guild Perks, false otherwise",
            },
            [6] = {
                ["Name"] = "offspecID",
                ["Desc"] = "Number - 0 if the tab contains spells you can cast (general/specialization/trade skill/etc); or specialization ID of the specialization this tab is showing the spells of.",
            },
        },
        ["Format"] = "name, texture, offset, numEntries, isGuild, offspecID = GetSpellTabInfo(tabIndex)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "tabIndex",
                ["Desc"] = "Number - The index of the tab, ascending from 1.",
            },
        },
        ["Desc"] = "Retrieves information about the specified line of spells",
    },
    ["GetPVPDesired"] = {
        ["Desc"] = "Checks to see if the player has enabled PvP (\"Permaflagged\").",
        ["Format"] = "local ispvp = GetPVPDesired();",
    },
    ["RunBinding"] = {
        ["Desc"] = "Executes a key binding as if a key was pressed.",
        ["Format"] = "RunBinding(\"command\"[, \"up\"]);",
    },
    ["EJ_InstanceIsRaid"] = {
        ["Desc"] = "Returns whether the currently viewed Instance is a raid instance [1]",
        ["Format"] = "isRaid = EJ_InstanceIsRaid()",
    },
    ["GetEquipmentSetLocations"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "infoArray",
                ["Desc"] = "Table - the array portion of this table contains information on each of the slots for the set.",
            },
            [2] = {
                ["Desc"] = "0: Ammo",
            },
            [3] = {
                ["Desc"] = "1: Head",
            },
            [4] = {
                ["Desc"] = "2: Neck",
            },
            [5] = {
                ["Desc"] = "3: Shoulder",
            },
            [6] = {
                ["Desc"] = "4: Shirt",
            },
            [7] = {
                ["Desc"] = "5: Chest",
            },
            [8] = {
                ["Desc"] = "6: Belt",
            },
            [9] = {
                ["Desc"] = "7: Legs",
            },
            [10] = {
                ["Desc"] = "8: Feet",
            },
            [11] = {
                ["Desc"] = "9: Wrist",
            },
            [12] = {
                ["Desc"] = "10: Gloves",
            },
            [13] = {
                ["Desc"] = "11: Finger 1",
            },
            [14] = {
                ["Desc"] = "12: Finger 2",
            },
            [15] = {
                ["Desc"] = "13: Trinket 1",
            },
            [16] = {
                ["Desc"] = "14: Trinket 2",
            },
            [17] = {
                ["Desc"] = "15: Back",
            },
            [18] = {
                ["Desc"] = "16: Main hand",
            },
            [19] = {
                ["Desc"] = "17: Off hand",
            },
            [20] = {
                ["Desc"] = "18: Ranged",
            },
            [21] = {
                ["Desc"] = "19: Tabard",
            },
        },
        ["Format"] = "infoArray = GetEquipmentSetLocations(\"name\"[, infoArray]);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "\"name\"",
                ["Desc"] = "String - equipment set name to retrieve information about.",
            },
            [2] = {
                ["Name"] = "infoArray",
                ["Desc"] = "Table - optional if you don't want a new return table created. (Recommended if you call this multiple times)",
            },
        },
        ["Desc"] = "Populates a table with the location/status of each slot in the specified equipment set.",
    },
    ["GetSpecializationSpells"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "spellID",
                ["Desc"] = "Number - spell learned as part of the specialization.",
            },
            [2] = {
                ["Name"] = "level",
                ["Desc"] = "Number - level at which the spell is learned by the specialization.",
            },
        },
        ["Format"] = "spellID1, level1, spellID2, level2, ... = GetSpecializationSpells(specIndex[, isInspect[, isPet]])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "specIndex",
                ["Desc"] = "Number - index of the specialization to query, integer ascending from 1.",
            },
            [2] = {
                ["Name"] = "isInspect",
                ["Desc"] = "Flag - a truthy value to query information about the inspected unit; player information is returned otherwise.",
            },
            [3] = {
                ["Name"] = "isPet",
                ["Desc"] = "Flag - a truthy value to query information about a pet specialization; player information is returned otherwise.",
            },
        },
        ["Desc"] = "Returns spells learned as part of a specific specialization.",
    },
    ["GetNumTrackingTypes"] = {
        ["Desc"] = "Returns the number of available tracking methods.",
        ["Format"] = "GetNumTrackingTypes();",
    },
    ["GetGossipOptions"] = {
        ["Desc"] = "Get the available gossip items on an NPC (possibly stuff like the BWL and MC orbs too).",
        ["Format"] = "title1, gossip1 = GetGossipOptions()",
    },
    ["GetCurrentMapAreaID"] = {
        ["Desc"] = "Returns the mapID of the currently displayed area map.",
        ["Format"] = "mapID = GetCurrentMapAreaID()",
    },
    ["ProcessMapClick"] = {
        ["Desc"] = "Passes a click on the map to the client, which then calculates if the zone has to be changed",
        ["Format"] = "ProcessMapClick(x, y)",
    },
    ["IsQuestFlaggedCompleted"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isCompleted",
                ["Desc"] = "Boolean - 1 if it is completed, nil if not or if the questID is not valid.",
            },
        },
        ["Format"] = "isCompleted = IsQuestFlaggedCompleted(questID)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "questID",
                ["Desc"] = "Number - The quest to query.",
            },
        },
        ["Desc"] = "Determine if a quest has been completed.",
    },
    ["MoveViewLeftStart"] = {
        ["Returns"] = "Nothing",
        ["Format"] = "MoveViewLeftStart(speed)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "speed",
                ["Desc"] = "Number - Speed at which to begin rotating.",
            },
        },
        ["Desc"] = "Begins rotating the camera to the Left around your Character.",
    },
    ["GetProfessionInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - The skill name",
            },
            [2] = {
                ["Name"] = "icon",
                ["Desc"] = "String - the location of the icon image",
            },
            [3] = {
                ["Name"] = "skillLevel",
                ["Desc"] = "Number - the current skill level",
            },
            [4] = {
                ["Name"] = "maxSkillLevel",
                ["Desc"] = "Number - the current skill cap (75 for apprentice, 150 for journeyman etc.)",
            },
            [5] = {
                ["Name"] = "numAbilites",
                ["Desc"] = "Number - The number of abilities/icons listed. These are the icons you put on your action bars.",
            },
            [6] = {
                ["Name"] = "spelloffset",
                ["Desc"] = "Number - haven't figured this one out yet",
            },
            [7] = {
                ["Name"] = "skillLine",
                ["Desc"] = "Number - haven't figured this one out yet",
            },
            [8] = {
                ["Name"] = "skillModifier",
            },
            ["Desc"] = "name, icon, skillLevel, maxSkillLevel, numAbilities, spelloffset, skillLine, skillModifier",
        },
        ["Format"] = "name, icon, skillLevel, maxSkillLevel, numAbilities, spelloffset, skillLine, skillModifier = GetProfessionInfo(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - The skill index number (can be found with API GetProfessions()",
            },
        },
        ["Desc"] = "Gets details on a profession from its index including name, icon, and skill level.",
    },
    ["GetActionCount"] = {
        ["Desc"] = "Gets the available count for an action, if applicable.",
        ["Format"] = "text = GetActionCount(actionSlot)",
    },
    ["IsAuctionSortReversed"] = {
        ["Desc"] = "Returns the sorting for a column on the auction house display.",
        ["Format"] = "sorted = IsAuctionSortReversed(\"type\", \"sort\");",
    },
    ["GetLootThreshold"] = {
        ["Desc"] = "Returns the currently active loot threshold as a number.",
        ["Format"] = "threshold = GetLootThreshold()",
    },
    ["GetMirrorTimerInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "timer",
                ["Desc"] = "String - A string identifying timer type; \"EXHAUSTION\", \"BREATH\", and \"FEIGNDEATH\", or \"UNKNOWN\" indicating that the timer corresponding to that index is not currently active, and other return values are invalid.",
            },
            [2] = {
                ["Name"] = "initial",
                ["Desc"] = "Number - Value of the timer when the it started.",
            },
            [3] = {
                ["Name"] = "maxvalue",
                ["Desc"] = "Number - Maximum value of the timer.",
            },
            [4] = {
                ["Name"] = "scale",
                ["Desc"] = "Number - Change in timer value per second.",
            },
            [5] = {
                ["Name"] = "paused",
                ["Desc"] = "Flag - 0 if the timer is currently running, a value greater than zero if it is not.",
            },
            [6] = {
                ["Name"] = "label",
                ["Desc"] = "String - Localized timer name.",
            },
        },
        ["Format"] = "timer, initial, maxvalue, scale, paused, label = GetMirrorTimerInfo(id)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "id",
                ["Desc"] = "Number - timer index, from 1 to MIRRORTIMER_NUMTIMERS (3 as of 3.2). In general, the following correspondence holds: 1 = Fatigue, 2 = Breath, 3 = Feign Death.",
            },
        },
        ["Desc"] = "Gives information about the mirror bar. (Spirit release, exhaustion/fatigue, etc)",
    },
    ["GuildInvite"] = {
        ["Returns"] = "nil",
        ["Format"] = "GuildInvite([\"playername\"])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "\"playername\"",
                ["Desc"] = "String (PlayerName) - The name of the player to invite",
            },
        },
        ["Desc"] = "Invites a player or your target to your guild if you have that privilege.",
    },
    ["PlaceAction"] = {
        ["Returns"] = "nil",
        ["Format"] = "PlaceAction(actionSlot)",
        ["Arguments"] = "(actionSlot)",
        ["Desc"] = "Place the drag-and-drop item as an action.",
    },
    ["KBSetup_IsLoaded"] = {
        ["Returns"] = "loaded",
        ["Format"] = "loaded = KBSetup_IsLoaded()",
        ["Arguments"] = "()",
        ["Desc"] = "Determine if the article list is loaded.",
    },
    ["ClearTransmogrifySlot"] = {
        ["Desc"] = "Clears a transmogrify slot [1]",
        ["Format"] = "ClearTransmogrifySlot([slotId])",
    },
    ["UnitAttackPower"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "base",
                ["Desc"] = "Number - The unit's base attack power",
            },
            [2] = {
                ["Name"] = "posBuff",
                ["Desc"] = "Number - The total effect of positive buffs to attack power.",
            },
            [3] = {
                ["Name"] = "negBuff",
                ["Desc"] = "Number - The total effect of negative buffs to the attack power (a negative number)",
            },
        },
        ["Format"] = "base, posBuff, negBuff = UnitAttackPower(unit);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "UnitId - The unit to get information from. (Does not work for \"target\" - Possibly only \"player\" and \"pet\")",
            },
        },
        ["Desc"] = "Returns the unit's melee attack power and modifiers.",
    },
    ["UnitChannelInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - The name of the spell, or nil if no spell is being cast.",
            },
            [2] = {
                ["Name"] = "nameSubtext",
                ["Desc"] = "String - The string describing additional properties of spell, used to contain rank, e.g. \"Rank 1\".",
            },
            [3] = {
                ["Name"] = "text",
                ["Desc"] = "String - The name to be displayed.",
            },
            [4] = {
                ["Name"] = "texture",
                ["Desc"] = "String - The texture path associated with the spell icon.",
            },
            [5] = {
                ["Name"] = "startTime",
                ["Desc"] = "Number - Specifies when casting has begun, in milliseconds.",
            },
            [6] = {
                ["Name"] = "endTime",
                ["Desc"] = "Number - Specifies when casting will end, in milliseconds.",
            },
            [7] = {
                ["Name"] = "isTradeSkill",
                ["Desc"] = "Boolean - Specifies if the cast is a tradeskill",
            },
            [8] = {
                ["Name"] = "notInterruptible",
                ["Desc"] = "Boolean - if true, indicates that this cast cannot be interrupted with abilites like  [Kick] or  [Shield Bash]. In default UI those spells have shield frame around their icons on enemy cast bars.",
            },
        },
        ["Format"] = "name, nameSubtext, text, texture, startTime, endTime, isTradeSkill, notInterruptible = UnitCastingInfo(\"unit\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - The unit to query (e.g. \"player\", \"party2\", \"pet\", \"target\" etc.)",
            },
        },
        ["Desc"] = "Returns information about the spell currently being channeled by the specified unit.",
    },
    ["CanGuildPromote"] = {
        ["Desc"] = "Checks if the player can promote guild members.",
        ["Format"] = "canPromote = CanGuildPromote()",
    },
    ["OffhandHasWeapon"] = {
        ["Desc"] = "Return whether a weapon is in the offhand slot.ReturnshasWeaponFlag - 1 if an item of type Weapon is in the offhand slot, nil otherwiseNote: Shields, Held Off-Hand and other non-weapon items in this slot are typically not a weapon. You can think of this return as the equivalent of:",
        ["Format"] = "local _,_,id = string.find(GetInventoryItemLink(\"player\",GetInventorySlotInfo(\"SecondaryHandSlot\")) or \"\",\"(item:%d+:%d+:%d+:%d+)\")local _,_,_,_,itemType = GetItemInfo(id)return itemType==\"Weapon\"",
    },
    ["EquipCursorItem"] = {
        ["Desc"] = "Equips the currently picked up item to a specific inventory slot.",
        ["Format"] = "EquipCursorItem(slot);",
    },
    ["IsFlying"] = {
        ["Desc"] = "Checks whether the player is flying.",
        ["Format"] = "flying = IsFlying()",
    },
    ["GetContainerItemInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "texture",
                ["Desc"] = "String - the texture for the item in the specified bag slot",
            },
            [2] = {
                ["Name"] = "itemCount",
                ["Desc"] = "Number - the number of items in the specified bag slot",
            },
            [3] = {
                ["Name"] = "locked",
                ["Desc"] = "Flag - 1 if the item is locked by the server, nil otherwise.",
            },
            [4] = {
                ["Name"] = "quality",
                ["Desc"] = "Number - the numeric quality of the item",
            },
            [5] = {
                ["Name"] = "readable",
                ["Desc"] = "Flag - 1 if the item can be \"read\" (as in a book), nil otherwise",
            },
            [6] = {
                ["Name"] = "lootable",
                ["Desc"] = "Boolean - true if the item is a temporary container containing items that can be looted",
            },
            [7] = {
                ["Name"] = "itemLink",
                ["Desc"] = "String - the itemLink of the item in the specified bag slot",
            },
            [8] = {
                ["Name"] = "isFiltered",
                ["Desc"] = "Boolean - true if the item is greyed-out during the current inventory search",
            },
        },
        ["Format"] = "",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "bag",
                ["Desc"] = "Number (bagID) - number of the bag the item is in, e.g. 0 for your backpack.",
            },
            [2] = {
                ["Name"] = "slot",
                ["Desc"] = "Number - index of the slot inside the bag to look up.",
            },
        },
        ["Desc"] = "",
    },
    ["OfferPetition"] = {
        ["Returns"] = "nil",
        ["Format"] = "OfferPetition()",
        ["Arguments"] = "None",
        ["Desc"] = "Offer the target to sign your petition (only if the petition frame is visible)",
    },
    ["NumTaxiNodes"] = {
        ["Desc"] = "Returns the total number of flight points on the taxi map.",
        ["Format"] = "numNodes = NumTaxiNodes()",
    },
    ["GetSocketTypes"] = {
        ["Returns"] = {
            [1] = {
                ["Desc"] = {
                    [1] = {
                        ["Desc"] = "\"Red\" - Red socket",
                    },
                    [2] = {
                        ["Desc"] = "\"Yellow\" - Yellow socket",
                    },
                    [3] = {
                        ["Desc"] = "\"Blue\" - Blue socket",
                    },
                    [4] = {
                        ["Desc"] = "\"Meta\" - Meta socket",
                    },
                    [5] = {
                        ["Desc"] = "\"Socket\" - Prismatic socket",
                    },
                },
            },
        },
        ["Format"] = "",
        ["Arguments"] = {
            [1] = {
                ["Desc"] = "Number - The 1-based index of the socket for which to get information.",
            },
        },
        ["Desc"] = "",
    },
    ["GetAuctionItemSubClasses"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "subClass1, subClass2, subClass3, ...",
                ["Desc"] = "String - The localized item sub-class.",
            },
        },
        ["Format"] = "subClass1, subClass2, subClass3, ... = GetAuctionItemSubClasses(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - Index of the major category to look into, ascending from 1 to #GetAuctionItemClasses.",
            },
        },
        ["Desc"] = "Gets a list of the sub-classes for an Auction House item class.",
    },
    ["GetActionCooldown"] = {
        ["Desc"] = "Retrieves the cooldown data of the action specified.",
        ["Format"] = "start, duration, enable = GetActionCooldown(slot)",
    },
    ["CalendarGetAbsMonth"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "month",
                ["Desc"] = "Number - Month index (1-12 for January-December)",
            },
            [2] = {
                ["Name"] = "year",
                ["Desc"] = "Number - Year at the offset date (2004+)",
            },
            [3] = {
                ["Name"] = "numdays",
                ["Desc"] = "Number - Number of days in the month (28-31)",
            },
            [4] = {
                ["Name"] = "firstday",
                ["Desc"] = "Number - Weekday on which the month begins (1 = Sunday, 2 = Monday, ..., 7 = Saturday)",
            },
        },
        ["Format"] = "month, year, numdays, firstday = CalendarGetMonth( month[, year] )",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "month",
                ["Desc"] = "Number - Month index (1-12 for January-December), values outside the range are coerced into it, without adjusting the year.",
            },
            [2] = {
                ["Name"] = "year",
                ["Desc"] = "Number - Year (e.g. 2004); if omitted, currently selected year is assumed.",
            },
        },
        ["Desc"] = "Returns information about the calendar month.",
    },
    ["MoveViewUpStop"] = {
        ["Returns"] = "Nothing",
        ["Format"] = "MoveViewUpStop()",
        ["Arguments"] = "None",
        ["Desc"] = "Stops rotating the camera Up.",
    },
    ["GetNumCompanions"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "count",
                ["Desc"] = "Number - The number of companions of a specific type.",
            },
        },
        ["Format"] = "count = GetNumCompanions(\"type\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "type",
                ["Desc"] = "String - Type of companions to count: \"CRITTER\", or \"MOUNT\".",
            },
        },
        ["Desc"] = "Returns the number of companions you have.",
    },
    ["CallCompanion"] = {
        ["Desc"] = "Summons the specified companion.",
        ["Format"] = "CallCompanion(\"type\", id)",
    },
    ["GetCurrentMapContinent"] = {
        ["Desc"] = "Returns the index of the continent the world map is currently showing",
        ["Format"] = "continent = GetCurrentMapContinent()",
    },
    ["SetGuildRosterShowOffline"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["IsControlKeyDown"] = {
        ["Desc"] = "There are three seperate levels of IsModifierKeyDown() type API functions but they all do the same basic function and return true if the specified key is currently pressed down.The first level is one function to tell you if any of the modifier keys are down IsModifierKeyDown()The second level is the three diferent functions one for each type of Modifier key: Shift, Alt &amp; CtrlThe third is one function for each seperate modifier key: Left Alt, Right Alt, Left Shift, Right Shift, Left Ctrl &amp; Right Ctrl.Is Any Modifier Key DownReturns whether ANY modifier key is currently pressed down.",
        ["Format"] = "anyModKeyIsDown = IsModifierKeyDown();",
    },
    ["MoveViewLeftStop"] = {
        ["Returns"] = "Nothing",
        ["Format"] = "MoveViewLeftStop()",
        ["Arguments"] = "None",
        ["Desc"] = "Stops rotating the camera to the Left.",
    },
    ["MoveViewInStop"] = {
        ["Returns"] = "Nothing",
        ["Format"] = "MoveViewInStop()",
        ["Arguments"] = "None",
        ["Desc"] = "Stops moving the camera In.",
    },
    ["GetEquipmentSetInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - Equipment set name.",
            },
            [2] = {
                ["Name"] = "icon",
                ["Desc"] = "String - Icon texture file name (relative to Interface/Icons) selected for this set.",
            },
            [3] = {
                ["Name"] = "setID",
                ["Desc"] = "Number - Unknown.",
            },
            [4] = {
                ["Name"] = "isEquipped",
                ["Desc"] = "Boolean - True if all non-ignored slots in this set are equipped.",
            },
            [5] = {
                ["Name"] = "numItems",
                ["Desc"] = "Number - Number of items included in the set.",
            },
            [6] = {
                ["Name"] = "equippedItems",
                ["Desc"] = "Number - Number of items in this set currently equipped.",
            },
            [7] = {
                ["Name"] = "availableItems",
                ["Desc"] = "Number - Number of items in this set currently in the player's bags/bank, if bank is available.",
            },
            [8] = {
                ["Name"] = "missingItems",
                ["Desc"] = "Number - Number of items in this set that are not currently available to the player.",
            },
            [9] = {
                ["Name"] = "ignoredSlots",
                ["Desc"] = "Number - Number of inventory slots ignored by this set.",
            },
        },
        ["Format"] = "name, icon, setID, isEquipped, totalItems, equippedItems, inventoryItems, missingItems, ignoredSlots = GetEquipmentSetInfo(index)icon, setID, isEquipped, numItems, equippedItems, availableItems, missingItems, ignoredSlots = GetEquipmentSetInfoByName(\"name\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "GetEquipmentSetInfo -- index",
                ["Desc"] = "Number: an ascending index going from 1 to GetNumEquipmentSets().",
            },
            [2] = {
                ["Name"] = "GetEquipmentSetInfoByName -- name",
                ["Desc"] = "String: equipment set name.",
            },
        },
        ["Desc"] = "Returns information about a saved equipment set:",
    },
    ["HideRepairCursor"] = {
        ["Returns"] = "nil",
        ["Format"] = "HideRepairCursor()",
        ["Arguments"] = "none",
        ["Desc"] = "Takes the cursor out of repair mode.",
    },
    ["IsInGroup"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "inGroup",
                ["Desc"] = "Boolean - true if the player is in a groupType group (if groupType was not specified, true if in any type of group), false otherwise.",
            },
        },
        ["Format"] = "inGroup = IsInGroup([groupType])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "groupType",
                ["Desc"] = "Number - To check for a specific type of group, provide one of:LE_PARTY_CATEGORY_HOME: checks for home-realm parties.LE_PARTY_CATEGORY_INSTANCE: checks for instance-specific groups.",
            },
        },
        ["Desc"] = "Returns whether the player is in a [specific type of] group.",
    },
    ["GetInventoryAlertStatus"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "alertStatus",
                ["Desc"] = "Number - 0 for normal (6 or more durability points left), 1 for yellow (5 to 1 durability points left), 2 for broken (0 durability points left).",
            },
        },
        ["Format"] = "alertStatus = GetInventoryAlertStatus(\"index\");",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "String - one of the following:HeadShouldersChestWaistLegsFeetWristsHandsWeaponShieldRanged",
            },
        },
        ["Desc"] = "Returns one of several codes describing the \"status\" of an equipped item. The main use for this function is generalized durability checks.",
    },
    ["MoveViewDownStop"] = {
        ["Returns"] = "Nothing",
        ["Format"] = "MoveViewDownStop()",
        ["Arguments"] = "None",
        ["Desc"] = "Stops rotating the camera Down.",
    },
    ["IsAutoRepeatAction"] = {
        ["Returns"] = "isRepeating",
        ["Format"] = "isRepeating = IsAutoRepeatAction(actionSlot)",
        ["Arguments"] = "(actionSlot)",
        ["Desc"] = "Determine whether action slot is auto repeating.",
    },
    ["PickupContainerItem"] = {
        ["Desc"] = "Wildcard function usually called when a player left clicks on a slot in their bags. Functionality includes picking up the item from a specific bag slot, putting the item into a specific bag slot, and applying enchants (including poisons and sharpening stones) to the item in a specific bag slot, except if one of the Modifier Keys is pressed.",
        ["Format"] = "PickupContainerItem(bagID, slot);",
    },
    ["CloseAuctionHouse"] = {
        ["Desc"] = "Will close the AuctionFrame if opened.",
        ["Format"] = "CloseAuctionHouse();",
    },
    ["GetRuneCooldown"] = {
        ["Desc"] = "Gets the cooldown information about a Death Knight's Rune",
        ["Format"] = "start, duration, runeReady = GetRuneCooldown(id)",
    },
    ["SetMapZoom"] = {
        ["Desc"] = "Sets what is displayed by the current world map to a specific continent and zone.",
        ["Format"] = "SetMapZoom(continentIndex [,zoneIndex])",
    },
    ["GetTradeSkillSubClasses"] = {
        ["Desc"] = "Returns a list of the valid subclasses.",
        ["Format"] = "GetTradeSkillSubClasses();",
    },
    ["GetNumSpecGroups"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "numSpecGroups",
                ["Desc"] = "Number - number of available specialization groups; 1 for characters that have not learned dual-specializations, 2 for those that have.",
            },
        },
        ["Format"] = "numSpecGroups = GetNumSpecGroups([b])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "b",
                ["Desc"] = "Boolean - In theory this returns information for the inspected target instead of the player. In practice, this seems to return 0 if true. Defaults to false.",
            },
        },
        ["Desc"] = "Returns the number of specialization group (dual specs) the player has.",
    },
    ["LoggingCombat"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isLogging",
                ["Desc"] = "nil - You are not logging",
            },
            [2] = {
                ["Desc"] = "1 - You are logging",
            },
        },
        ["Format"] = "isLogging = LoggingCombat([newState])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "newState",
                ["Desc"] = "Boolean - Toggles combat logging",
            },
        },
        ["Desc"] = "Toggles logging for the combat log and returns the current state.",
    },
    ["CanSummonFriend"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "summonable",
                ["Desc"] = "Flag - 1 if you can summon the unit using RaF, nil otherwise.",
            },
        },
        ["Format"] = "summonable = CanSummonFriend(\"unit\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String (UnitId) - player to check whether you can summon.",
            },
        },
        ["Desc"] = "Returns whether you can RaF summon a particular unit.",
    },
    ["AutoStoreGuildBankItem"] = {
        ["Desc"] = "Allows you to withdraw an item and automatically store it in your inventory.",
        ["Format"] = "AutoStoreGuildBankItem(tab,slot)",
    },
    ["IsInventoryItemLocked"] = {
        ["Desc"] = "Returns whether an inventory item is locked, usually as it awaits pending action.",
        ["Format"] = "isLocked = IsInventoryItemLocked(slotId)",
    },
    ["LeaveBattlefield"] = {
        ["Desc"] = "Leaves the current battlefield",
        ["Format"] = "LeaveBattlefield()",
    },
    ["KBSystem_GetServerStatus"] = {
        ["Returns"] = "status",
        ["Format"] = "status = KBSystem_GetServerStatus()",
        ["Arguments"] = "()",
        ["Desc"] = "Returns the current server status.",
    },
    ["GetNumQuestRewards"] = {
        ["Desc"] = "Returns the number of items unconditionally rewarded by the quest being completed.",
        ["Format"] = "numRewards = GetNumQuestRewards()",
    },
    ["GetActionTexture"] = {
        ["Desc"] = "Returns the filepath for an action's texture.",
        ["Format"] = "texture = GetActionTexture(actionSlot)",
    },
    ["GetNumBattlefieldStats"] = {
        ["Desc"] = "Appears to return the number of columns in the battleground/field scoreboard, other than the common ones (Killing Blows, Kills, Deaths, Bonus Honour):",
        ["Format"] = "local x = GetNumBattlefieldStats();",
    },
    ["RequestArtifactCompletionHistory"] = {
        ["Desc"] = "Queries the server for archeology data. ARTIFACT_HISTORY_READY is fired when data is available.",
        ["Format"] = "RequestArtifactCompletionHistory()",
    },
    ["CanGuildDemote"] = {
        ["Desc"] = "Checks if the player can demote guild members.",
        ["Format"] = "canDemote = CanGuildDemote()",
    },
    ["JoinChannelByName"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "type",
                ["Desc"] = "Number - The type of channel. 0 for a undefined channel, 1 for the zone General channel, etc",
            },
            [2] = {
                ["Name"] = "name",
                ["Desc"] = "String - The name of the channel (Ohklus: seems to be nil for most channels).",
            },
        },
        ["Format"] = "type, name = JoinChannelByName(\"channelName\" [,\"password\" [,frameID[, hasVoice]]])",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "channelName",
                ["Desc"] = "String - The name of the channel to join",
            },
            [2] = {
                ["Desc"] = {
                    [1] = {
                        ["Desc"] = "You can't use the \"-\" character in channelName (patch 1.9)",
                    },
                },
            },
            [3] = {
                ["Name"] = "password",
                ["Desc"] = "String (optional) - The channel password, nil if none.",
            },
            [4] = {
                ["Name"] = "frameID",
                ["Desc"] = "Number (optional) - The chat frame ID number to add the channel to. Use Frame:GetID() to retrieve it for chat frame objects.",
            },
            [5] = {
                ["Name"] = "hasVoice",
                ["Desc"] = "Boolean (1/nil) - Enable voice chat for this channel.",
            },
        },
        ["Desc"] = "Joins the channel with the specified name. A player can be in a maximum of 10 chat channels.",
    },
    ["GetInventoryItemCooldown"] = {
        ["Returns"] = "start, duration, enable",
        ["Format"] = "start, duration, enable = GetInventoryItemCooldown(\"unit\", slotId)",
        ["Arguments"] = "(\"unit\", slotId)",
        ["Desc"] = "Get cooldown information for an inventory item.",
    },
    ["GetBestRFChoice"] = {
        ["Desc"] = "Returns the suggested/default Dungeon Id for the Raid Finder [1]",
        ["Format"] = "dungeonId = GetBestRFChoice()",
    },
    ["GetSpellCooldown"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "startTime",
                ["Desc"] = "Number - The time when the cooldown started (as returned by GetTime()); zero if no cooldown; current time if (enabled == 0).",
            },
            [2] = {
                ["Name"] = "duration",
                ["Desc"] = "Number - Cooldown duration in seconds, 0 if spell is ready to be cast.",
            },
            [3] = {
                ["Name"] = "enabled",
                ["Desc"] = "Number - 0 if the spell is active (Stealth, Shadowmeld, Presence of Mind, etc) and the cooldown will begin as soon as the spell is used/cancelled; 1 otherwise.",
            },
        },
        ["Format"] = "start, duration, enabled = GetSpellCooldown(\"spellName\" or spellID or slotID, \"bookType\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "spellName",
                ["Desc"] = "String - name of the spell to query.",
            },
        },
        ["Desc"] = "Retrieves the cooldown data of the spell specified.",
    },
    ["CanGuildInvite"] = {
        ["Desc"] = "Checks whether you have guild inviting permission.",
        ["Format"] = "canInvite = CanGuildInvite()",
    },
    ["GetPlayerMapPosition"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "posX",
                ["Desc"] = "Number - X value of the unit position (a proportion between 0 and 1, relative to WorldMapDetailFrame)",
            },
            [2] = {
                ["Name"] = "posY",
                ["Desc"] = "Number - Y value of the unit position (a proportion between 0 and 1, relative to WorldMapDetailFrame)",
            },
        },
        ["Format"] = "posX, posY = GetPlayerMapPosition(\"unit\");",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - The unitId for which the position is returned. Does not work with all unit types. Works with \"player\", \"partyN\" or \"raidN\" as unit type. In particular, it does not work on pets. This was to disable range-checking mods.",
            },
        },
        ["Desc"] = "A one-time call to SetMapToCurrentZone() is required before GetPlayerMapPosition() will return the correct values.UsageReturns the position of a unit on the current map",
    },
    ["ItemTextGetItem"] = {
        ["Returns"] = "textName",
        ["Format"] = "textName = ItemTextGetItem()",
        ["Arguments"] = "()",
        ["Desc"] = "Get the name of the current item text.",
    },
    ["GuildInfo"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["IsLeftAltKeyDown"] = {
        ["Desc"] = "There are three seperate levels of IsModifierKeyDown() type API functions but they all do the same basic function and return true if the specified key is currently pressed down.The first level is one function to tell you if any of the modifier keys are down IsModifierKeyDown()The second level is the three diferent functions one for each type of Modifier key: Shift, Alt &amp; CtrlThe third is one function for each seperate modifier key: Left Alt, Right Alt, Left Shift, Right Shift, Left Ctrl &amp; Right Ctrl.Is Any Modifier Key DownReturns whether ANY modifier key is currently pressed down.",
        ["Format"] = "anyModKeyIsDown = IsModifierKeyDown();",
    },
    ["SetChannelPassword"] = {
        ["Desc"] = "Changes the password of the current channel.",
        ["Format"] = "SetChannelPassword(channelName, password);",
    },
    ["GetGlyphInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - The name of the glyph or \"header\" if a header",
            },
            [2] = {
                ["Name"] = "glyphType",
                ["Desc"] = "Number - Type of the glyph (1 - Major, 2 - Minor)",
            },
            [3] = {
                ["Name"] = "isKnown",
                ["Desc"] = "Boolean - True if the player has learned the glyph in question or a filter index if a header",
            },
            [4] = {
                ["Name"] = "icon",
                ["Desc"] = "Texture for glyph button widget or nil if a header",
            },
            [5] = {
                ["Name"] = "glyphId",
                ["Desc"] = "Number - the id of the glyph or nil if a header",
            },
            [6] = {
                ["Name"] = "glyphLink",
                ["Desc"] = "String - the link of the selected glyph or nil if a header",
            },
            [7] = {
                ["Name"] = "spec",
                ["Desc"] = "String - the specialization that the glyph is specific to or nil if applicable to all specializations",
            },
        },
        ["Format"] = "name, glyphType, isKnown, icon, glyphId, glyphLink, spec = GetGlyphInfo(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - Index of glyph as is shown in the glyph panel, ascending from 1.",
            },
        },
        ["Desc"] = "Returns the information about glyphs",
    },
    ["IsRightControlKeyDown"] = {
        ["Desc"] = "There are three seperate levels of IsModifierKeyDown() type API functions but they all do the same basic function and return true if the specified key is currently pressed down.The first level is one function to tell you if any of the modifier keys are down IsModifierKeyDown()The second level is the three diferent functions one for each type of Modifier key: Shift, Alt &amp; CtrlThe third is one function for each seperate modifier key: Left Alt, Right Alt, Left Shift, Right Shift, Left Ctrl &amp; Right Ctrl.Is Any Modifier Key DownReturns whether ANY modifier key is currently pressed down.",
        ["Format"] = "anyModKeyIsDown = IsModifierKeyDown();",
    },
    ["IsRightAltKeyDown"] = {
        ["Desc"] = "There are three seperate levels of IsModifierKeyDown() type API functions but they all do the same basic function and return true if the specified key is currently pressed down.The first level is one function to tell you if any of the modifier keys are down IsModifierKeyDown()The second level is the three diferent functions one for each type of Modifier key: Shift, Alt &amp; CtrlThe third is one function for each seperate modifier key: Left Alt, Right Alt, Left Shift, Right Shift, Left Ctrl &amp; Right Ctrl.Is Any Modifier Key DownReturns whether ANY modifier key is currently pressed down.",
        ["Format"] = "anyModKeyIsDown = IsModifierKeyDown();",
    },
    ["IsQuestCompletable"] = {
        ["Desc"] = "Returns true if a quest is possible to complete.",
        ["Format"] = "IsQuestCompletable();",
    },
    ["SetRaidTarget"] = {
        ["Desc"] = "Set which Raid Target Icon will be shown over a mob or raid member.",
        ["Format"] = "SetRaidTarget(\"unit\", iconId)",
    },
    ["IsPassiveSpell"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isPassive",
                ["Desc"] = "Flag: 1 if the spell is passive, nil otherwise.",
            },
        },
        ["Format"] = "isPassive = IsPassiveSpell(spellId or index, bookType);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "spellId",
                ["Desc"] = "Number - spell ID to query.",
            },
        },
        ["Desc"] = "Returns whether the icon in your spellbook is a Passive ability (not necessarily a spell). (And actually noted as so in spellbook)",
    },
    ["IsMouseButtonDown"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isDown",
                ["Desc"] = "Flag - 1 if the queried mouse button is held down, nil otherwise.",
            },
        },
        ["Format"] = "isDown = IsMouseButtonDown(\"buttonName\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "buttonName",
                ["Desc"] = "String - identifier of the button to check, e.g \"LeftButton\", \"RightButton\", \"MiddleButton\", \"BUTTON4\"",
            },
        },
        ["Desc"] = "Returns whether a particular mouse button is currently being held down.",
    },
    ["BuybackItem"] = {
        ["Desc"] = "API BuybackItem will buyback an item from a merchant if you have the merchant window open.",
        ["Format"] = "BuybackItem(slot#);",
    },
    ["GetMacroIndexByName"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "macroIndex",
                ["Desc"] = "The numeric index of the macro or 0 if there's no macro with the given name.",
            },
        },
        ["Format"] = "macroIndex = GetMacroIndexByName(\"name\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "\"name\"",
                ["Desc"] = "String - The name of a macro as obtainable by GetActionText(slot)",
            },
        },
        ["Desc"] = "Return macro index for a given name.",
    },
    ["SearchLFGGetResults"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - Name of the player.",
            },
            [2] = {
                ["Name"] = "level",
                ["Desc"] = "Number - Player level.",
            },
            [3] = {
                ["Name"] = "areaName",
                ["Desc"] = "String - Player's area.",
            },
            [4] = {
                ["Name"] = "className",
                ["Desc"] = "String - Player's class.",
            },
            [5] = {
                ["Name"] = "comment",
                ["Desc"] = "String - Player's custom comment.",
            },
            [6] = {
                ["Name"] = "partyMembers",
                ["Desc"] = "Number - Count of players in the group.",
            },
            [7] = {
                ["Name"] = "bossKills",
                ["Desc"] = "Number - Sum of all boss kills on normal mode",
            },
            [8] = {
                ["Name"] = "gearRating",
                ["Desc"] = "Number - Some weird value only blizzard has clue about",
            },
        },
        ["Format"] = "local name, level, areaName, className, comment, partyMembers, status, class, encountersTotal, encountersComplete, isIneligible, isLeader, isTank, isHealer, isDamage, bossKills, specID, isGroupLeader, armor, spellDamage, plusHealing, CritMelee, CritRanged, critSpell, mp5, mp5Combat, attackPower, agility, maxHealth, maxMana, gearRating, avgILevel, defenseRating, dodgeRating, BlockRating, ParryRating, HasteRating, expertise = SearchLFGGetResults(index);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - Index of the player to query, ascending from 1 to totalResults return value from SearchLFGGetNumResults.",
            },
        },
        ["Desc"] = "Returns information about the player listed in raid browser.",
    },
    ["IsInRaid"] = {
        ["Desc"] = "Indicates whether the player is currently in a raid group.",
        ["Format"] = "isInRaid = IsInRaid()",
    },
    ["IsInInstance"] = {
        ["Desc"] = "Checks whether the player is in an instance and the type of instance.",
        ["Format"] = "inInstance, instanceType = IsInInstance()",
    },
    ["KBSetup_GetTotalArticleCount"] = {
        ["Returns"] = "count",
        ["Format"] = "count = KBSetup_GetTotalArticleCount()",
        ["Arguments"] = "()",
        ["Desc"] = "Returns the number of articles.",
    },
    ["IsEquippedAction"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["IsEquippableItem"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "result",
                ["Desc"] = "1 if equip-able, nil otherwise.",
            },
        },
        ["Format"] = "result = IsEquippableItem(itemId or \"itemName\" or \"itemLink\")",
        ["Arguments"] = "(itemId or \"itemName\" or \"itemLink\")",
        ["Desc"] = "Returns 1 if item is an equip-able one at all, your character notwithstanding, or nil if not.",
    },
    ["debugprofilestart"] = {
        ["Desc"] = "Starts the profiling timer.",
        ["Format"] = "debugprofilestart();",
    },
    ["GetVoidTransferWithdrawalInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "itemID",
                ["Desc"] = "Number - Item ID",
            },
            [2] = {
                ["Name"] = "textureName",
                ["Desc"] = "String - Item Icon",
            },
        },
        ["Format"] = "itemID, textureName = GetVoidTransferWithdrawalInfo(slotIndex)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "slotIndex",
                ["Desc"] = "Number - Index ranging from 1 to 9 (VOID_WITHDRAW_MAX)",
            },
        },
        ["Desc"] = "Returns info about the item being withdrawed from the Void Storage [1]",
    },
    ["IsAttackSpell"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isAttack",
                ["Desc"] = "Flag - Returns 1 if the spell is the \"Attack\" spell, nil otherwise",
            },
        },
        ["Format"] = "isAttack = IsAttackSpell(spellName)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "spellName",
                ["Desc"] = "String - The spell name to test.",
            },
        },
        ["Desc"] = "Determine whether spell is the \"Attack\" spell.",
    },
    ["InboxItemCanDelete"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "canDelete",
                ["Desc"] = "Flag - false if a mailed item or money is returnable, true otherwise.",
            },
        },
        ["Format"] = "canDelete = InboxItemCanDelete(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - the index of the message (1 is the first message)",
            },
        },
        ["Desc"] = "Boolean function for determining whether a message is returnable.",
    },
    ["HasWandEquipped"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["HasSoulstone"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "text",
                ["Desc"] = "string or nil - the type of self-resurrect available to your character (known values are \"Use Soulstone\", \"Reincarnate\", and \"Twisting Nether\") or nil if none are available",
            },
        },
        ["Format"] = "text = HasSoulstone()",
        ["Arguments"] = "none",
        ["Desc"] = "Returns whether or not, and how, your character can self-resurrect.",
    },
    ["GetTrainerServiceSkillReq"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "skillName",
                ["Desc"] = "The name of the skill.",
            },
            [2] = {
                ["Name"] = "skillLevel",
                ["Desc"] = "The required level needed for the skill.",
            },
            [3] = {
                ["Name"] = "hasReq",
                ["Desc"] = "1 or nil. Seems to be 1 for skills that you cannot learn, nil for skills you have learned already.",
            },
        },
        ["Format"] = "skillName, skillLevel, hasReq = GetTrainerServiceSkillReq(index)",
        ["Arguments"] = {
            [1] = {
                ["Desc"] = "the number of the selection in the trainer window",
            },
        },
        ["Desc"] = "Returns the name of the skill required, and the amount needed in that skill. Index is the selection index obtained by GetTrainerSelectionIndex().",
    },
    ["GuildSetLeader"] = {
        ["Desc"] = "Promotes a character to guild leader.",
        ["Format"] = "GuildSetLeader(\"name\");",
    },
    ["GetAddOnInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "name",
                ["Desc"] = "String - The name of the AddOn (the folder name).",
            },
            [2] = {
                ["Name"] = "title",
                ["Desc"] = "String - The title of the AddOn as listed in the .toc file (presumably this is the appropriate localized one).",
            },
            [3] = {
                ["Name"] = "notes",
                ["Desc"] = "String - The notes about the AddOn from its .toc file (presumably this is the appropriate localized one).",
            },
            [4] = {
                ["Name"] = "loadable",
                ["Desc"] = "Boolean - Indicates if the AddOn is eligible to be loaded, true if it is, false if it is not. Currently returns true if the addon is LoadOnDemand in the .toc file or if the addon is already loaded.",
            },
            [5] = {
                ["Name"] = "reason",
                ["Desc"] = "String - The reason why the AddOn cannot be loaded. This is nil if the addon is loadable or already loaded, otherwise it contains a code indicating the reason. (Observed reason codes: \"DISABLED\", \"MISSING\", \"INTERFACE_VERSION\")",
            },
            [6] = {
                ["Name"] = "security",
                ["Desc"] = "String - Indicates the security status of the AddOn. This is currently \"INSECURE\" for all user provided addons and \"SECURE\" for Blizzard_* AddOns.",
            },
        },
        ["Format"] = "name, title, notes, loadable, reason, security, newVersion = GetAddOnInfo(index or \"name\")",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Integer - The index of the AddOn in the user's AddOn list. Note that you cannot access Blizzard-provided AddOns through this mechanism.",
            },
            [2] = {
                ["Name"] = "name",
                ["Desc"] = "String - The name of the AddOn to be queried. You can access Blizzard-provided AddOns through this mechanism.",
            },
        },
        ["Desc"] = "Get information about an AddOn.",
    },
    ["GetNumGossipOptions"] = {
        ["Desc"] = "Returns the number of conversation options available with this NPC.",
        ["Format"] = "numOptions = GetNumGossipOptions();",
    },
    ["ShowingCloak"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isShowingCloak",
                ["Desc"] = "1 (showing cloak) or nil (not showing cloak)",
            },
        },
        ["Format"] = "isShowingCloak = ShowingCloak()",
        ["Arguments"] = "None",
        ["Desc"] = "Returns 1 if the player is showing his cloak",
    },
    ["ExecuteVoidTransfer"] = {
        ["Returns"] = "none",
        ["Format"] = "ExecuteVoidTransfer()",
        ["Arguments"] = "none",
        ["Desc"] = "Applies all pending void transfers (and pays for the cost of any deposited items) [1]",
    },
    ["GuildControlSaveRank"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["GetAvailableQuestInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "isTrivial",
                ["Desc"] = "Flag - 1 if the quest is trivial (too low-level compared to the character), nil otherwise.",
            },
            [2] = {
                ["Name"] = "isDaily",
                ["Desc"] = "Flag - 1 if the quest is a daily quest, nil otherwise.",
            },
            [3] = {
                ["Name"] = "isRepeatable",
                ["Desc"] = "Flag - 1 if the quest is repeatable, nil otherwise.",
            },
        },
        ["Format"] = "isTrivial, isDaily, isRepeatable = GetAvailableQuestInfo(index);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - Index of the available quest to query, starting from 1.",
            },
        },
        ["Desc"] = "Returns information about the type of an available quest.",
    },
    ["AddTrackedAchievement"] = {
        ["Desc"] = "Marks an achievement for tracking in the WatchFrame.",
        ["Format"] = "AddTrackedAchievement(achievementId)",
    },
    ["GetTrainerServiceInfo"] = {
        ["Desc"] = "Returns information about a trainer service.",
        ["Format"] = "name, rank, category, expanded = GetTrainerServiceInfo(id);",
    },
    ["GetChatWindowChannels"] = {
        ["Returns"] = "name1, zone1, name2, zone2, ...",
        ["Format"] = "name1, zone1, name2, zone2, ... = GetChatWindowChannels(frameId)",
        ["Arguments"] = "(frameId)",
        ["Desc"] = "Get the channels received by a chat window.",
    },
    ["ConvertToParty"] = {
        ["Desc"] = "Converts a raid group with 5 or less members to a party.",
        ["Format"] = "ConvertToParty()",
    },
    ["GetContainerItemGems"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "gem1, gem2, ...",
                ["Desc"] = "Number - Item IDs of the gems within the item in the specified container slot.",
            },
        },
        ["Format"] = "gem1, gem2, ... = GetContainerItemGems(bag, slot);",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "bag",
                ["Desc"] = "Number (BagId) - Index of the bag to query.",
            },
            [2] = {
                ["Name"] = "slot",
                ["Desc"] = "Number - Index of the slot within the bag to query, ascending from 1.",
            },
        },
        ["Desc"] = "Returns item IDs of gems inserted into the item in a specified container slot.",
    },
    ["UnitLevel"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "level",
                ["Desc"] = "Number - The unit level. Returns -1 for bosses, or players more than 10 levels above the player",
            },
        },
        ["Format"] = "/script SendChatMessage(\"Level \"..UnitLevel(\"target\"));",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "unit",
                ["Desc"] = "String - The unitId to get information from. (e.g. \"player\", \"target\")",
            },
        },
        ["Desc"] = "Returns the unit's level.ParametersArgumentsunitString - The unitId to get information from. (e.g. \"player\", \"target\")ReturnslevelNumber - The unit level. Returns -1 for bosses, or players more than 10 levels above the playerSample usage:",
    },
    ["GetComparisonStatistic"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "value",
                ["Desc"] = "String - The value of the requested Statistic from the comparison unit.",
            },
        },
        ["Format"] = "value = GetComparisonStatistic(achievementID)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "achievementID",
                ["Desc"] = "Number - The ID of the Achievement.",
            },
        },
        ["Desc"] = "Return the value of the requested Statistic from the comparison unit.",
    },
    ["EJ_GetSectionInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "title",
                ["Desc"] = "String - Section title, e.g. \"Stage One: The Final Assault\", \"Mutated Corruption\", \"Impale\".",
            },
            [2] = {
                ["Name"] = "description",
                ["Desc"] = "String - Description text, e.g. \"A Mutated Corruption appears shortly after assaulting a platform\".",
            },
            [3] = {
                ["Name"] = "depth",
                ["Desc"] = "Number - Section depth, i.e. the number of ancestors it has before reaching a sibling of the root section for the encounter (0 for the root section and its siblings, 1 for their children, 2 for their children's children...).",
            },
            [4] = {
                ["Name"] = "abilityIcon",
                ["Desc"] = "String - Path to a texture to display as an icon next to the section title, or \"\" if no static icon should be shown.",
            },
            [5] = {
                ["Name"] = "displayInfo",
                ["Desc"] = "Number - Model ID to display as an icon next to the section title, or 0 if no model-based icon should be shown.",
            },
            [6] = {
                ["Name"] = "siblingID",
                ["Desc"] = "Number - section ID of the next section on the same depth as this one, nil if none.",
            },
            [7] = {
                ["Name"] = "nextSectionID",
                ["Desc"] = "Number - section ID of the first child section of this section, nil if none.",
            },
            [8] = {
                ["Name"] = "filteredByDifficulty",
                ["Desc"] = "Boolean - true if this section should be hidden because it does not apply to the current EncounterJournal difficulty, false otherwise.",
            },
            [9] = {
                ["Name"] = "link",
                ["Desc"] = "String - chat link to this section, e.g. \" |cff66bbff|Hjournal:2:4102:4|h[Cataclysm]|h|r\".",
            },
            [10] = {
                ["Name"] = "startsOpen",
                ["Desc"] = "Boolean - True if the section should be expanded by default, false if it should be collapsed by default.",
            },
            [11] = {
                ["Name"] = "flag1, flag2, flag3, flag4",
                ["Desc"] = "Number - ID of a flag to display for this section; any unused flag return values are nil. The global ENCOUNTER_JOURNAL_FLAGid variables contain the flag title, and the index can be used to find the region of Interface\\EncounterJournal\\UI-EJ-Icons texture to display.",
            },
        },
        ["Format"] = "title, description, depth, abilityIcon, displayInfo, siblingID, nextSectionID, filteredByDifficulty, link, startsOpen, flag1, flag2, flag3, flag4 = EJ_GetSectionInfo(sectionID)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "sectionID",
                ["Desc"] = "Number - Abilities section ID to retrieve information about.",
            },
        },
        ["Desc"] = "Returns information about an entry in the Abilities section of the Encounter Journal.",
    },
    ["GetLootSlotLink"] = {
        ["Desc"] = "Retrieves the itemLink of one item in the current loot window.",
        ["Format"] = "\"itemLink\" = GetLootSlotLink(index)",
    },
    ["PetHasActionBar"] = {
        ["Returns"] = "hasActionBar",
        ["Format"] = "hasActionBar = PetHasActionBar()",
        ["Arguments"] = "()",
        ["Desc"] = "Determine if player has a pet with an action bar.",
    },
    ["GetGuildRosterShowOffline"] = {
        ["Desc"] = "Returns 1 if the guild roster is currently set to show offline members, nil otherwise.",
        ["Format"] = "showoffline = GetGuildRosterShowOffline();",
    },
    ["CanShowAchievementUI"] = {
        ["Desc"] = "Returns if the AchievementUI can be displayed.",
        ["Format"] = "canShow = CanShowAchievementUI()",
    },
    ["BuyMerchantItem"] = {
        ["Desc"] = "Buys the specified item.",
        ["Format"] = "BuyMerchantItem(index[, quantity]);",
    },
    ["GetStablePetFoodTypes"] = {
        ["Returns"] = "A list of the pet food type names, see GetPetFoodTypes().",
        ["Format"] = "local PetFoodList = { GetStablePetFoodTypes(index) };",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - The stable slot index of the pet: 0 for the current pet, 1 for the pet in the left slot, and 2 for the pet in the right slot.",
            },
        },
        ["Desc"] = "Returns a list of the food types a pet in the stable can eat.",
    },
    ["CombatTextSetActiveUnit"] = {
        ["Desc"] = "Alters the entity for which the COMBAT_TEXT_UPDATE event fires.",
        ["Format"] = "CombatTextSetActiveUnit(\"unit\");",
    },
    ["EJ_GetSearchResult"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "id",
                ["Desc"] = "Number - ID of the matching loot/encounter/creature/section or instance.",
            },
            [2] = {
                ["Name"] = "stype",
                ["Desc"] = "Number - result type; ascending from 0 for loot, encounter, creature, section, and instance respectively.",
            },
            [3] = {
                ["Name"] = "difficulty",
                ["Desc"] = "Number - difficulty index (per EJ_SetDifficulty).",
            },
            [4] = {
                ["Name"] = "instanceID",
                ["Desc"] = "Number - Instance ID of the instance this result stems from.",
            },
            [5] = {
                ["Name"] = "encounterID",
                ["Desc"] = "Number - Encounter ID of the encounter this result stems from.",
            },
            [6] = {
                ["Name"] = "link",
                ["Desc"] = "String - link of this search result.",
            },
        },
        ["Format"] = "id, stype, difficulty, instanceID, encounterID, link = EJ_GetSearchResult(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - search result index, ascending from 1 to EJ_GetNumSearchResults().",
            },
        },
        ["Desc"] = "Returns information about a search result",
    },
    ["GetSpellBookItemInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "skillType",
                ["Desc"] = "String - The type of the spell (known values: \"SPELL\", \"PETACTION\", \"FUTURESPELL\", \"FLYOUT\")",
            },
            [2] = {
                ["Name"] = "spellId",
                ["Desc"] = "Number - Spell ID of the spellbook item.",
            },
        },
        ["Format"] = "skillType, spellId = GetSpellBookItemInfo(spellName or index, bookType)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "spellName",
                ["Desc"] = "String - The name of the spell you want to query",
            },
            [2] = {
                ["Name"] = "index",
                ["Desc"] = "Number - The index into the spellbook",
            },
            [3] = {
                ["Name"] = "bookType",
                ["Desc"] = "String - Spell book type; either BOOKTYPE_PET (\"pet\") or BOOKTYPE_SPELL (\"spell\").",
            },
        },
        ["Desc"] = "Retrieves information about a specific SpellBook item",
    },
    ["GetIgnoreName"] = {
        ["Returns"] = "ignoreName",
        ["Format"] = "ignoreName = GetSelectedIgnore(index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = {
                    [1] = {
                        ["Desc"] = "Number - index of the instance, ranges from 1 to API_GetNumIgnores()",
                    },
                },
            },
        },
        ["Desc"] = "Returns the currently selected index in the ignore listing",
    },
    ["ListChannels"] = {
        ["Desc"] = "Lists all of the channels.",
        ["Format"] = "ListChannels();",
    },
    ["BNGetFOFInfo"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "presenceID",
                ["Desc"] = "Number - a unique numeric identifier for this friend for this session",
            },
            [2] = {
                ["Name"] = "givenName",
                ["Desc"] = "String - a |K Escape Sequence representing the friend's first/given name (As of 4.0)",
            },
            [3] = {
                ["Name"] = "surname",
                ["Desc"] = "String - a |K Escape Sequence representing the friend's Surname/Family name (As of 4.0)",
            },
            [4] = {
                ["Name"] = "isFriend",
            },
            ["Desc"] = "presenceID, givenName, surname, isFriend",
        },
        ["Format"] = "presenceID, givenName, surname, isFriend = BNGetFOFInfo(presenceID, mutual, non-mutual, index)",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "presenceID",
                ["Desc"] = "number - The presenceID for the RealID friend for whom you are requesting friend info.",
            },
            [2] = {
                ["Name"] = "mutual",
                ["Desc"] = "Boolean - Should the list include mutual friends (I.e. people who you and the person referenced by presenceID are both friends with).",
            },
            [3] = {
                ["Name"] = "non-mutual",
                ["Desc"] = "Boolean - Should the list include non-mutual friends.",
            },
            [4] = {
                ["Name"] = "index",
                ["Desc"] = "number - The index of the entry in the list to retrieve (1 to BNGetNumFOF(...))",
            },
        },
        ["Desc"] = "Returns information about the specified friend of a RealID friend",
    },
    ["GetShapeshiftForm"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "index",
                ["Desc"] = "Number - one of following:",
            },
        },
        ["Format"] = "",
        ["Arguments"] = {
            [1] = {
                ["Name"] = "flag",
                ["Desc"] = "Boolean (Optional) - True if return value is to be compared to a macro's conditional statement. This makes it always return zero for Presences and Auras. False or nil returns an index based on which button to highlight on the shapeshift/stance bar left to right starting at 1.",
            },
        },
        ["Desc"] = "",
    },
    ["GetNumDungeonMapLevels"] = {
        ["Format"] = "",
        ["Desc"] = "",
    },
    ["SelectGossipOption"] = {
        ["Desc"] = "Selects a gossip (conversation) option.",
        ["Format"] = "SelectGossipOption(index)",
    },
    ["GetQuestLogChoiceInfo"] = {
        ["Desc"] = "Returns a bunch of data about a quest reward choice from the quest log.",
        ["Format"] = "GetQuestLogChoiceInfo(itemNum);",
    },
    ["GetNumVoidTransferDeposit"] = {
        ["Desc"] = "Returns the number of items being deposited into the Void Storage [1]",
        ["Format"] = "numDeposits = GetNumVoidTransferDeposit()",
    },
    ["DoTradeSkill"] = {
        ["Desc"] = "Performs the tradeskill a specified # of times",
        ["Format"] = "DoTradeSkill(index, repeat)",
    },
    ["StartDuel"] = {
        ["Desc"] = "Invites the specified player to a duel.",
        ["Format"] = "StartDuel(\"playerName\")",
    },
    ["CloseSocketInfo"] = {
        ["Desc"] = "Stops considering the item for socketing, ignoring any tentative changes made.",
        ["Format"] = "CloseSocketInfo();",
    },
    ["CanReplaceGuildMaster"] = {
        ["Desc"] = "Returns whether you can impeach the Guild Master due to inactivity.",
        ["Format"] = "canReplace = CanReplaceGuildMaster()",
    },
    ["IsWindowsClient"] = {
        ["Desc"] = "Checks to see if client is running on Windows.",
        ["Format"] = "IsWindowsClient();",
    },
    ["EnableAllAddOns"] = {
        ["Returns"] = "nil",
        ["Format"] = "EnableAllAddOns()",
        ["Arguments"] = "()",
        ["Desc"] = "Enable all AddOns for subsequent sessions.",
    },
    ["GetAchievementNumCriteria"] = {
        ["Returns"] = {
            [1] = {
                ["Name"] = "numCriteria",
                ["Desc"] = "Integer - The number of criteria required for the given Achievement",
            },
        },
        ["Format"] = "numCriteria = GetAchievementNumCriteria(AchievementID)",
        ["Arguments"] = "(Integer AchievementID)",
        ["Desc"] = "Returns the number of criteria for the given Achievement.",
    },
}