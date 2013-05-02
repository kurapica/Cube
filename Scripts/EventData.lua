IGAS:NewAddon("Cube")

Event_Data = {
	ACHIEVEMENT_EARNED = {
	    Description = [[Fires when the player earns an achievement]],
	    Signature = [[achievementID]],
	    [[achievementID  - The ID of the achievement earned (number) ]],
	},
	ACTIONBAR_HIDEGRID = {
	    Description = [[Fires when an item, spell or other entity that can be placed into an action bar slot is removed from the cursor. In the default UI, this event causes the grid of empty action bar slots to be hidden. (This grid only appears when something that can be dragged to an action bar slot is picked up, unless the "Always show action bars" option is enabled.)]],
	},
	ACTIONBAR_PAGE_CHANGED = {
	    Description = [[Fires when the main action bar changes pages]],
	},
	ACTIONBAR_SHOWGRID = {
	    Description = [[Fires when an item, spell or other entity that can be placed into an action bar slot is picked up onto the cursor. In the default UI, this event causes the grid of empty action bar slots to be shown. (This grid only appears when something that can be dragged to an action bar slot is picked up, unless the "Always show action bars" option is enabled.)]],
	},
	ACTIONBAR_SLOT_CHANGED = {
	    Description = [[Fires when the contents of an action bar slot change]],
	    Signature = [[slot]],
	    [[slot  - The action id of the slot that needs to be updated or 0 if all slots need to be updated. (number) ]],
	},
	ACTIONBAR_UPDATE_COOLDOWN = {
	    Description = [[Fires when the cooldown for an action bar item begins or ends]],
	},
	ACTIONBAR_UPDATE_STATE = {
	    Description = [[Fires when the state of an action bar item changes. State changes include the action becoming the current or active action.]],
	},
	ACTIONBAR_UPDATE_USABLE = {
	    Description = [[Fires when an action becomes usable or unusable. For example, an action may become unusable if it contains a spell for which the player does not have enough mana.]],
	},
	ACTIVE_TALENT_GROUP_CHANGED = {
	    Description = [[Fires when the player (with Dual Talent Specialization enabled) switches talent builds]],
	},
	ADDON_ACTION_BLOCKED = {
	    Description = [[Fires when a non-Blizzard addon attempts to use a protected API]],
	},
	ADDON_ACTION_FORBIDDEN = {
	    Description = [[Fires when a non-Blizzard addon attempts to use a protected API. In the default UI, this event triggers a dialog box providing the name of the addon and offering to disable it and reload the UI.]],
	    Signature = [[culprit]],
	    [[culprit  - The name of the addon that called the forbidden function (string) ]],
	},
	ADDON_LOADED = {
	    Description = [[Fires when an addon and its saved variables are loaded. Fires once for each addon (i.e. an addon loaded early in sequence will see ADDON_LOADED events for all addons loaded later).]],
	    Signature = [[name]],
	    [[name  - The name of the addon that has been loaded (string) ]],
	},
	ARCHAEOLOGY_CLOSED = {
	    Description = [[Fires when the archeology panel is closed.]],
	},
	ARCHAEOLOGY_TOGGLE = {
	    Description = [[Fires when the archeology panel is opened or closed.]],
	},
	AREA_SPIRIT_HEALER_IN_RANGE = {
	    Description = [[Fires when the player enters into the area of effect of a spirit healer that periodically resurrects nearby player units. Such spirit healers are found in Battlegrounds and certain other PvP areas.]],
	},
	AREA_SPIRIT_HEALER_OUT_OF_RANGE = {
	    Description = [[Fires when the player enters leaves the area of effect of a spirit healer that periodically resurrects nearby player units. Such spirit healers are found in Battlegrounds and certain other PvP areas.]],
	},
	ARENA_OPPONENT_UPDATE = {
	    Description = [[Fires when the availability of information about an arena opponent changes]],
	},
	ARENA_PREP_OPPONENT_SPECIALIZATIONS = {
	    Description = [[Fires when the availability of information about an arena opponent specialization change. Used by pre-arena specialization detection UI.]],
	},
	ARENA_SEASON_WORLD_STATE = {
	    Description = [[Fires when the arena season changes]],
	},
	ARENA_TEAM_INVITE_REQUEST = {
	    Description = [[Fires when the player is invited to join an arena team]],
	    Signature = [[source, team]],
	    [[source  - The name of the player that invited you to join a team. (string) ]],
	    [[team  - The name of the team that you have been invited to join. (string) ]],
	},
	ARENA_TEAM_ROSTER_UPDATE = {
	    Description = [[Fires when roster detail information for one of the player's arena teams becomes available]],
	    Signature = [[unknown]],
	    [[unknown  - Appears to be a boolean value to determin if updated information is available or not. (boolean) ]],
	},
	ARENA_TEAM_UPDATE = {
	    Description = [[Fires when the player joins or leaves an arena team]],
	},
	ARTIFACT_COMPLETE = {
	    Description = [[Fires when an artifact is completed (solved project)]],
	    Signature = [[name]],
	    [[name  - Name of the completed artifact (string) ]],
	},
	ARTIFACT_DIG_SITE_UPDATED = {
	    Description = [[Fires when a new archaeology digsite appears on the map, or an old one disappears]],
	},
	ARTIFACT_HISTORY_READY = {
	    Description = [[Fires when the created artifact listing data of the player becomes available.. This event fires in response to a call to the RequestArtifactCompletionHistory function.]],
	},
	ARTIFACT_UPDATE = {
	    Description = [[Fires when the artifact display should be updated. This fires when a keystone is added or removed to a project or when the project is solved.]],
	},
	AUCTION_BIDDER_LIST_UPDATE = {
	    Description = [[Fires when information becomes available or changes for the list of auctions bid on by the player ]],
	},
	AUCTION_HOUSE_CLOSED = {
	    Description = [[Fires when the player ends interaction with an auction house]],
	},
	AUCTION_HOUSE_DISABLED = {
	    Description = [[Fires when the server refuses to give the player access to the auction house because it is disabled]],
	},
	AUCTION_HOUSE_SHOW = {
	    Description = [[Fires when the player begins interaction with an auction house]],
	},
	AUCTION_ITEM_LIST_UPDATE = {
	    Description = [[Fires when the information becomes available for the list of auction browse/search results]],
	},
	AUCTION_MULTISELL_FAILURE = {
	    Description = [[Fires when an auction house multisell could not complete for any reason ]],
	},
	AUCTION_MULTISELL_START = {
	    Description = [[Fires when the player starts a multisell in the auction house]],
	    Signature = [[amount]],
	    [[amount  - Amount of items in total to put on the auction house (number) ]],
	},
	AUCTION_MULTISELL_UPDATE = {
	    Description = [[Fires when one of the auctions in an auction house multisell has successfully been created]],
	    Signature = [[createdAmount, amount]],
	    [[createdAmount  - Amount of auctions that have successfully been created (number) ]],
	    [[amount  - Amount of auctions to create in total (number) ]],
	},
	AUCTION_OWNED_LIST_UPDATE = {
	    Description = [[Fires when information becomes available or changes for the list of auctions placed by the player]],
	},
	AUTOEQUIP_BIND_CONFIRM = {
	    Description = [[Fires when the player attempts to equip an item which will become soulbound in the process]],
	    Signature = [[slot]],
	    [[slot  - The slot of the item that you are attempting to equip. (number) ]],
	},
	AUTOFOLLOW_BEGIN = {
	    Description = [[Fires when the player starts following another character]],
	    Signature = [[following]],
	    [[following  - The unit that you are following. (number) ]],
	},
	AUTOFOLLOW_END = {
	    Description = [[Fires when the player stops following another character]],
	},
	BAG_CLOSED = {
	    Description = [[Fires when one of the player's containers is closed]],
	    Signature = [[bagID]],
	    [[bagID  - The ID of the bag that closed. (number) ]],
	},
	BAG_OPEN = {
	    Description = [[Fires when one of the player's containers is opened]],
	    Signature = [[bagID]],
	    [[bagID  - The ID of the bag that opened. (number) ]],
	},
	BAG_UPDATE = {
	    Description = [[Fires when the contents of one of the player's containers change. Container contents may change due to obtaining an item, consuming an item, moving an item between or within bags, etc. Note that containers also include the keyring, bank and bank bags.]],
	    Signature = [[bagID]],
	    [[bagID  - The id of the bag that is receiving an update. (number, containerID) ]],
	},
	BAG_UPDATE_COOLDOWN = {
	    Description = [[Fires when the cooldown begins or ends for an item in one of the player's containers]],
	},
	BANKFRAME_CLOSED = {
	    Description = [[Fires when the player ends interaction with a bank]],
	},
	BANKFRAME_OPENED = {
	    Description = [[Fires when the player begins interaction with a bank]],
	},
	BARBER_SHOP_CLOSE = {
	    Description = [[Fires when the player ends interaction with a barber shop]],
	},
	BARBER_SHOP_OPEN = {
	    Description = [[Fires when the player begins interaction with a barber shop]],
	},
	BATTLEFIELDS_CLOSED = {
	    Description = [[Fires when the UI is no longer available for queueing for an arena or specific battleground instance]],
	},
	BATTLEFIELDS_SHOW = {
	    Description = [[Fires when the UI becomes available for queueing for an arena or specific battleground instance]],
	},
	BATTLEFIELD_MGR_EJECTED = {
	    Description = [[Fires when the player has been removed from a queued world PvP zone (e.g. Wintergrasp)]],
	},
	BATTLEFIELD_MGR_EJECT_PENDING = {
	    Description = [[Fires when the player will be removed from or cannot yet enter a queued world PvP zone (e.g. Wintergrasp)]],
	},
	BATTLEFIELD_MGR_ENTERED = {
	    Description = [[Fires when the player has been accepted into a queued world PvP zone (e.g. Wintergrasp)]],
	},
	BATTLEFIELD_MGR_ENTRY_INVITE = {
	    Description = [[Fires when the player is invited to enter a queued world PvP zone (e.g. Wintergrasp)]],
	},
	BATTLEFIELD_MGR_QUEUE_INVITE = {
	    Description = [[Fires when the player is invited to queue for a world PvP zone (e.g. Wintergrasp)]],
	},
	BATTLEFIELD_QUEUE_TIMEOUT = {
	    Description = [[Fires when a battleground queue expires]],
	},
	BILLING_NAG_DIALOG = {
	    Description = [[Fires when a message should be shown about the player's paid game time expiring soon]],
	    Signature = [[remaining]],
	    [[remaining  - The number in minuites until your play time runs out. (number) ]],
	},
	BIND_ENCHANT = {
	    Description = [[Fires when the player attempts to an enchant an item which will become soulbound in the process]],
	},
	BN_CONNECTED = {
	    Description = [[Fires when the player connects to Battle.net]],
	},
	BN_CUSTOM_MESSAGE_CHANGED = {
	    Description = [[Fires when the player's Battle.net custom message (broadcast) is changed]],
	},
	BN_DISCONNECTED = {
	    Description = [[Fires when the player disconnects from Battle.net]],
	},
	BN_FRIEND_ACCOUNT_OFFLINE = {
	    Description = [[Fires when one of your RealID friends logs off]],
	    Signature = [[presenceID]],
	    [[presenceID  - You can send this to BNGetFriendInfoByID (number) ]],
	},
	BN_FRIEND_ACCOUNT_ONLINE = {
	    Description = [[Fires when one of your RealID friends log on]],
	    Signature = [[presenceID]],
	    [[presenceID  - You can send this to BNGetFriendInfoByID (number) ]],
	},
	BN_MATURE_LANGUAGE_FILTER = {
	    Description = [[Fires whenever the battle.net mature language filter setting is changed.]],
	},
	CALENDAR_ACTION_PENDING = {
	    Description = [[Fires when a change to the calendar is in progress]],
	},
	CALENDAR_CLOSE_EVENT = {
	    Description = [[Fires when the player ends viewing or editing details of a calendar event]],
	},
	CALENDAR_EVENT_ALARM = {
	    Description = [[Fires when a calendar event is soon to begin. Causes the default UI to display a message in the chat window 15 minutes prior to the event's scheduled time.]],
	},
	CALENDAR_NEW_EVENT = {
	    Description = [[Fires when an event created by the player is added to the calendar]],
	},
	CALENDAR_OPEN_EVENT = {
	    Description = [[Fires when the player begins viewing or editing details of a calendar event]],
	},
	CALENDAR_UPDATE_ERROR = {
	    Description = [[Fires when a calendar-related error message should be displayed]],
	},
	CALENDAR_UPDATE_EVENT = {
	    Description = [[Fires when details become available for the event being viewed or edited]],
	},
	CALENDAR_UPDATE_EVENT_LIST = {
	    Description = [[Fires when the list of events visible on the calendar changes]],
	},
	CALENDAR_UPDATE_INVITE_LIST = {
	    Description = [[Fires when the invite/signup list is updated for the event being viewed or edited]],
	},
	CALENDAR_UPDATE_PENDING_INVITES = {
	    Description = [[Fires when the player receives new calendar event invitations]],
	},
	CANCEL_LOOT_ROLL = {
	    Description = [[Fires when the player cancels a loot roll. Can occur after the player is requested to confirm rolling for an item which Binds on Pickup.]],
	    Signature = [[rollID]],
	    [[rollID  - The id of the roll that was cancled. (number) ]],
	},
	CANCEL_SUMMON = {
	    Description = [[Fires when a summons offered to the player is canceled]],
	},
	CHANNEL_COUNT_UPDATE = {
	    Description = [[Fires when the number of members in a world or custom chat channel changes]],
	    Signature = [[id, count]],
	    [[id  - The id of the chat channel thats getting updated. (number) ]],
	    [[count  - The number of members in the channel. (number) ]],
	},
	CHANNEL_FLAGS_UPDATED = {
	    Description = [[Fires when information about a channel for the channel list display changes]],
	    Signature = [[id]],
	    [[id  - The id of the channel that has updated data (number) ]],
	},
	CHANNEL_INVITE_REQUEST = {
	    Description = [[Fires when a player is invited into a chat channel]],
	    Signature = [[channelName, inviterName]],
	    [[channelName  - The name of the channel you have been invited to. (string) ]],
	    [[inviterName  - The name of the character that invited you. (string) ]],
	},
	CHANNEL_PASSWORD_REQUEST = {
	    Description = [[Fires when the player attempts to join a password protected channel]],
	    Signature = [[channelName]],
	    [[channelName  - The name of the channel you are attempting to join. (string) ]],
	},
	CHANNEL_ROSTER_UPDATE = {
	    Description = [[Fires when the list of members in a channel changes]],
	    Signature = [[id]],
	    [[id  - The id of the channel that has updated information. (number) ]],
	},
	CHANNEL_UI_UPDATE = {
	    Description = [[Fires when information for the channel list display changes]],
	},
	CHANNEL_VOICE_UPDATE = {
	    Description = [[Fires when a member in a voice chat channel starts or stops speaking]],
	    Signature = [[id, enabled, active]],
	    [[id  - The id of the speaker who has changed. (number) ]],
	    [[enabled  - If voice chat is enabled. (boolean) ]],
	    [[active  - If the player is speaking at this moment. (boolean) ]],
	},
	CHARACTER_POINTS_CHANGED = {
	    Description = [[Fires when the player's amount of available talent points changes. Note that since the introduction of Death Knights, who gain 46 of their talent points through questing, this event can fire without the player gaining a character level.]],
	    Signature = [[count, levels]],
	    [[count  - The number of talent points gained or lost. Positive numbers are gains negative numbers are expenditures. (number) ]],
	    [[levels  - The number of levels gained in association to this change. Is 0 if there is no level change. (number) ]],
	},
	CHAT_MSG_ACHIEVEMENT = {
	    Description = [[Fires when a nearby character earns an achievement]],
	},
	CHAT_MSG_ADDON = {
	    Description = [[Fires when an addon communication message is received (see SendAddonMessage()). The local client receives any messages it sends; thus, this event fires for messages sent by the local client as well as those receives from others.]],
	    Signature = [[prefix, message, channel, sender]],
	    [[prefix  - The prefix declared from SendAddonMessage. (string) ]],
	    [[message  - The message from SendAddonMessage. (string) ]],
	    [[channel  - The message channel used for this message.  Possible values include PARTY, RAID, GUILD, BATTLEGROUND, or WHISPER. (string) ]],
	    [[sender  - The username of the sender. (string) ]],
	},
	CHAT_MSG_AFK = {
	    Description = [[Fires when an automatic AFK response is received. When the player attempts to whisper or invite a character whose status is AFK, an automatic response is returned containing either a custom message set by that character or the default message, "Away From Keyboard"]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter, senderGUID]],
	    [[message  - The response message (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - counter of chat events that the client recieves. (number) ]],
	    [[senderGUID  - The sender's GUID (string) ]],
	},
	CHAT_MSG_BG_SYSTEM_ALLIANCE = {
	    Description = [[Fires when an Alliance-related battleground system message is received. Faction-related messages include flags picked up, bases assaulted, etc.]],
	    Signature = [[message]],
	    [[message  - The message received. (string) ]],
	},
	CHAT_MSG_BG_SYSTEM_HORDE = {
	    Description = [[Fires when a Horde-related battleground system message is received. Faction-related messages include flags picked up, bases assaulted, etc.]],
	    Signature = [[message]],
	    [[message  - The message received. (string) ]],
	},
	CHAT_MSG_BG_SYSTEM_NEUTRAL = {
	    Description = [[Fires when a general battleground, zone or world message is received. General battleground messages include those indicating that the match has ended or will begin soon. Also includes scripted events in certain zones (e.g. a warning to players entering Zul'Gurub) and occasional messages broadcast to all players in the realm, such as during major server events (e.g. "The wrath of Neptulon has subsided...").]],
	    Signature = [[message]],
	    [[message  - The message received. (string) ]],
	},
	CHAT_MSG_BN_CONVERSATION = {
	    Description = [[Fires when you type a message in chat or when you recive a message from another player using Battle.Net]],
	    Signature = [[message, sender, unknown, channelString, unknown, unknown, unknown, channelNumber, unknown, unknown, counter, unknown, presenceID, unknown]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's RealID name. (i.e 'John Doe') (string) ]],
	    [[unknown  - unknown (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[unknown  - unknown (string) ]],
	    [[unknown  - unknown (string) ]],
	    [[unknown  - unknown (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (The UI adds +10 to the number) (number) ]],
	    [[unknown  - unknown (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be sequential number that the client recieves. (number) ]],
	    [[unknown  - unknown (string) ]],
	    [[presenceID  - this is the presenceID of the sender. (number, presenceID) ]],
	    [[unknown  - this seems to always be false (boolean) ]],
	},
	CHAT_MSG_BN_CONVERSATION_NOTICE = {
	    Description = [[Fires when you join a conversation channel (private channel for you and your friends) on Battle.Net]],
	    Signature = [[message/status, sender, unknown, channelString, unknown, unknown, unknown, channelNumber, unknown, unknown, counter, unknown, presenceID, unknown]],
	    [[message/status  - The message thats received or a statuscode like YOU_ JOINED_ CONVERSATION, YOU_ LEFT_ CONVERSATION, MEMBER_ LEFT. (string) ]],
	    [[sender  - The sender's RealID name. (i.e 'John Doe') or sometimes your own wow characters name. (looks like it will use the wow-character name when you are chatting, but will contain realid when other clients send messages) (string) ]],
	    [[unknown  - unknown (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[unknown  - unknown (string) ]],
	    [[unknown  - unknown (string) ]],
	    [[unknown  - unknown (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (The UI adds +10 to the number) (number) ]],
	    [[unknown  - unknown (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be sequential number that the client recieves. (number) ]],
	    [[unknown  - unknown (string) ]],
	    [[presenceID  - presenceID of the channel owner (number, presenceID) ]],
	    [[unknown  - this seems to always be false (boolean) ]],
	},
	CHAT_MSG_BN_INLINE_TOAST_BROADCAST = {
	    Description = [[Fires whenever a user changes their broadcast message on Battle.Net]],
	    Signature = [[message, sender, unknown, unknown, unknown, unknown, unknown, unknown, unknown, unknown, counter, unknown, presenceID, unknown]],
	    [[message  - The broadcast message. (string) ]],
	    [[sender  - The sender's RealID name. (i.e 'John Doe') (string) ]],
	    [[unknown  - unknown (string) ]],
	    [[unknown  - unknown (string) ]],
	    [[unknown  - unknown (string) ]],
	    [[unknown  - unknown (string) ]],
	    [[unknown  - unknown (number) ]],
	    [[unknown  - unknown (number) ]],
	    [[unknown  - unknown (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be sequential number that the client recieves. (number) ]],
	    [[unknown  - unknown (string) ]],
	    [[presenceID  - presenceID of the player sending the boadcast message (number, presenceID) ]],
	    [[unknown  - this seems to always be false (boolean) ]],
	},
	CHAT_MSG_BN_INLINE_TOAST_BROADCAST_INFORM = {
	    Description = [[Fires when the player sends a new broadcast (online message)]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter, guid]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	    [[guid  - GUID of the person who sent this message. Always empty for RealID events. (string) ]],
	},
	CHAT_MSG_BN_WHISPER = {
	    Description = [[Fires when you receive a whisper though Battle.net]],
	    Signature = [[message, sender, unknown, unknown, unknown, unknown, unknown, unknown, unknown, unknown, counter, unknown, presenceID, unknown]],
	    [[message  - The message received (string) ]],
	    [[sender  - The sender's Real ID name. (i.e 'John Doe') or sometimes your own WoW character's name. (Looks like it will use the WoW character name when you are chatting, but will contain Real ID when other clients send messages) (string) ]],
	    [[unknown  - unknown (string) ]],
	    [[unknown  - unknown (string) ]],
	    [[unknown  - unknown (string) ]],
	    [[unknown  - unknown (string) ]],
	    [[unknown  - unknown (number) ]],
	    [[unknown  - unknown (number) ]],
	    [[unknown  - unknown (string) ]],
	    [[unknown  - Seems to be always 0. (number) ]],
	    [[counter  - A sequential integer assigned to each whisper (local to the client). (number) ]],
	    [[unknown  - unknown (string) ]],
	    [[presenceID  - presenceID of the sender (number, presenceID) ]],
	    [[unknown  - Seems to be always false (boolean) ]],
	},
	CHAT_MSG_BN_WHISPER_INFORM = {
	    Description = [[Fires when you send a whisper though Battle.net (arguments are similar to CHAT_MSG_BN_WHISPER)]],
	},
	CHAT_MSG_CHANNEL = {
	    Description = [[Fires when a message is received in a world or custom chat channel. Used for numbered chat channels (e.g. Trade, General, and player-created channels).]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter, guid]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	    [[guid  - GUID of the person who sent this message. (string) ]],
	},
	CHAT_MSG_CHANNEL_JOIN = {
	    Description = [[Fires when another character joins a world or custom chat channel monitored by the player. Used for numbered chat channels (e.g. Trade, General, and player-created channels). Only used for other characters joining a channel -- when the player joins a channel, CHAT_MSG_CHANNEL_NOTICE fires.]],
	    Signature = [[unkown, sender, unknown, channelString, unknown, unknown, unknown, channelNumber, channelName, unknown, unknown]],
	    [[unkown  - empty string (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[unknown  - empty string (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[unknown  - empty string (string) ]],
	    [[unknown  - empty string (string) ]],
	    [[unknown  - 0 (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - 0 (number) ]],
	    [[unknown  - 800 (number) ]],
	},
	CHAT_MSG_CHANNEL_LEAVE = {
	    Description = [[Fires when another character leaves a world or custom chat channel monitored by the player. Used for numbered chat channels (e.g. Trade, General, and player-created channels). Only used for other characters leaving the channel -- when the player leaves the channel, CHAT_MSG_CHANNEL_NOTICE fires.]],
	    Signature = [[unkown, sender, unknown, channelString, unknown, unknown, unknown, channelNumber, channelName, unknown, unknown]],
	    [[unkown  - empty string (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[unknown  - empty string (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[unknown  - empty string (string) ]],
	    [[unknown  - empty string (string) ]],
	    [[unknown  - 0 (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - 0 (number) ]],
	    [[unknown  - 852 (number) ]],
	},
	CHAT_MSG_CHANNEL_LIST = {
	    Description = [[Fires in response to a channel list query (e.g. /chatlist). If the channel contains many characters, the event fires multiple times to list them all.]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CHAT_MSG_CHANNEL_NOTICE = {
	    Description = [[Fires when certain actions happen on a world or custom chat channel. Examples of actions causing notice messages include when the player joins or leaves a channel, when the player attempts to send a chat message in a channel in which the player is silenced, or when a zone-specific channel (e.g. General, LocalDefense) changes as the player moves between zones.]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[message  - The message thats received (as a globalstring name) (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CHAT_MSG_CHANNEL_NOTICE_USER = {
	    Description = [[Fires when certain actions pertaining to specific members happen on a world or custom chat channel. Examples of member-specific actions include a member enabling the channel for voice chat, a member becoming the channel owner, or one member kicking or banning another from the channel.]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CHAT_MSG_COMBAT_FACTION_CHANGE = {
	    Description = [[Fires when the player gains or loses reputation with a faction]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CHAT_MSG_COMBAT_GUILD_XP_GAIN = {
	    Description = [[Fires when a guild experience gain message appears in chat]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CHAT_MSG_COMBAT_HONOR_GAIN = {
	    Description = [[Fires when the player gains honor points]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CHAT_MSG_COMBAT_MISC_INFO = {
	    Description = [[Fires for miscellaneous messages to be displayed in the combat log, such as loss of equipment durability upon death]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CHAT_MSG_COMBAT_XP_GAIN = {
	    Description = [[Fires when the player gains experience points]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CHAT_MSG_DND = {
	    Description = [[Fires when an automatic DND response is received. When the player attempts to whisper or invite a character whose status is DND, an automatic response is returned containing either a custom message set by that character or the default message, "Do Not Disturb"]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CHAT_MSG_EMOTE = {
	    Description = [[Fires when a custom emote message is received.. Custom emote messages are those sent by typing /emote followed by some text; see CHAT_MSG_TEXT_EMOTE for standard emotes such as /dance and /flirt.]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CHAT_MSG_FILTERED = {
	    Description = [[Fires when the player attempts to send a chat message which is blocked by the spam filter]],
	},
	CHAT_MSG_GUILD = {
	    Description = [[Fires when a message is received in the guild chat channel]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CHAT_MSG_GUILD_ACHIEVEMENT = {
	    Description = [[Fires when a member of the player's guild earns an achievement]],
	    Signature = [[message, sender]],
	    [[message  - The message displayed to guild members (string) ]],
	    [[sender  - The name of the guild member who earned the achievement (string) ]],
	},
	CHAT_MSG_IGNORED = {
	    Description = [[Fires when an automatic response is received after whispering or inviting a character who is ignoring the player]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CHAT_MSG_LOOT = {
	    Description = [[Fires when receiving notice that the player or a member of the player's group has looted an item]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CHAT_MSG_MONEY = {
	    Description = [[Fires when the player receives money as loot]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CHAT_MSG_MONSTER_EMOTE = {
	    Description = [[Fires when a nearby NPC performs emote text. e.g. Cro Threadstrong crushes an apple under his boot.]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CHAT_MSG_MONSTER_PARTY = {
	    Description = [[Fires when an NPC speaks to the player's party chat channel]],
	},
	CHAT_MSG_MONSTER_SAY = {
	    Description = [[Fires when a nearby NPC speaks (visible only to players in the immediate area). e.g. Granny smith says: What is that poor orc yelling about? Someone should see what is going on.]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CHAT_MSG_MONSTER_WHISPER = {
	    Description = [[Fires when an NPC whispers to the player]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CHAT_MSG_MONSTER_YELL = {
	    Description = [[Fires when an NPC yells (visible to players in a wide area or the entire zone). e.g. Doom Lord Kazzak yells, All mortals will perish!]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CHAT_MSG_OFFICER = {
	    Description = [[Fires when a message is received in officer chat.]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CHAT_MSG_OPENING = {
	    Description = [[Fires for messages about the player "opening" a world object. Used for some, but not all "openable" world objects (e.g. treasure chests, quest objects). Messages sent via this event are displayed in the default UI's combat log by default.]],
	},
	CHAT_MSG_PARTY = {
	    Description = [[Fires when a message is received in the party chat channel]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CHAT_MSG_PARTY_LEADER = {
	    Description = [[Fires when a Party Leader types in chat. Message in the channel you're in that's fired when the Party Leader sends a chat in Party Channel]],
	},
	CHAT_MSG_PET_BATTLE_COMBAT_LOG = {
	    Description = [[Fires during combat in pet battles.. This event fires for all combat events visible to the player for pet battles.]],
	},
	CHAT_MSG_PET_INFO = {
	    Description = [[Fires for pet-related messages normally displayed in the combat log (e.g. summoning or dismissing a pet)]],
	},
	CHAT_MSG_RAID = {
	    Description = [[Fires when a message is received in the raid chat channel]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CHAT_MSG_RAID_BOSS_EMOTE = {
	    Description = [[Fires when a raid boss performs emote text. In the default UI, emotes from a raid boss are displayed in large text in the center of the screen.]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CHAT_MSG_RAID_BOSS_WHISPER = {
	    Description = [[Fires when a raid boss whispers to the player. In the default UI, whispers from a raid boss are displayed in large text in the center of the screen.]],
	},
	CHAT_MSG_RAID_LEADER = {
	    Description = [[Fires when a message is received in the raid chat channel from the raid leader]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CHAT_MSG_RAID_WARNING = {
	    Description = [[Fires when a raid warning message is received. These messages can be sent by the raid leader or a raid assistant; in the default UI, they appear in large text in the center of the screen.]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CHAT_MSG_RESTRICTED = {
	    Description = [[Fires when the player attempts to send a chat message which is disallowed because the player is on a trial account]],
	},
	CHAT_MSG_SAY = {
	    Description = [[Fires when the player or a nearby character speaks (visible to other nearby characters)]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CHAT_MSG_SKILL = {
	    Description = [[Fires when skill related messages are received.. e.g. "Your skill in Unarmed has increased to 357."]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CHAT_MSG_SYSTEM = {
	    Description = [[Fires when a system message is received. System messages are a catch-all category for messages received in via the chat system. Examples:]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[The server message which appears upon login (e.g. "Welcome to Patch 3.4! If you encounter interface problems, please disable your addons and delete your WTF folder.")]],
	    [[The feedback message which appears when the player enters AFK or DND status]],
	    [[Results from a /who query, if the query has three or fewer results]],
	    [[Notification that a friend or guild member has logged in or gone offline]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CHAT_MSG_TARGETICONS = {
	    Description = [[Fires when a target icon message is sent in chat.]],
	},
	CHAT_MSG_TEXT_EMOTE = {
	    Description = [[Fires when the player receives a standard emote (e.g. /dance, /flirt) message. For custom emote messages (those sent by typing /emote followed by some text), see CHAT_MSG_EMOTE.]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CHAT_MSG_TRADESKILLS = {
	    Description = [[Fires when the player or a nearby character performs a trade skill recipe]],
	},
	CHAT_MSG_WHISPER = {
	    Description = [[Fires when the player receives a whisper from a player character]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter, guid]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	    [[guid  - This variable appears to contain the globally unique ID for the player character who whispered you (guid) ]],
	},
	CHAT_MSG_WHISPER_INFORM = {
	    Description = [[Fires when the player sends a whisper to a player character]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CHAT_MSG_YELL = {
	    Description = [[Fires when the player or another player character yells (visible to other characters in a wide area) ]],
	    Signature = [[message, sender, language, channelString, target, flags, unknown, channelNumber, channelName, unknown, counter]],
	    [[message  - The message thats received (string) ]],
	    [[sender  - The sender's username. (string) ]],
	    [[language  - The language the message is in. (string) ]],
	    [[channelString  - The full name of the channel, including number. (string) ]],
	    [[target  - The username of the target of the action.  Not used by all events. (string) ]],
	    [[flags  - The various chat flags.  Like, DND or AFK. (string) ]],
	    [[unknown  - This variable has an unkown purpose, although it may be some sort of internal channel id.  That however is not confirmed. (number) ]],
	    [[channelNumber  - The numeric ID of the channel. (number) ]],
	    [[channelName  - The full name of the channel, does not include the number. (string) ]],
	    [[unknown  - This variable has an unkown purpose although it always seems to be 0. (number) ]],
	    [[counter  - This variable appears to be a counter of chat events that the client recieves. (number) ]],
	},
	CINEMATIC_START = {
	    Description = [[Fires when an in-game-engine cinematic begins to play. Used primarily for the introductory cinematic which plays upon logging into a newly created character, but can also appear at other times.]],
	},
	CINEMATIC_STOP = {
	    Description = [[Fires when an in-game-engine cinematic stops playing. Used primarily for the introductory cinematic which plays upon logging into a newly created character, but can also appear at other times.]],
	},
	CLOSE_INBOX_ITEM = {
	    Description = [[Fires when the mail message being viewed is no longer available. Occurs when the player takes all items attached to the currently viewed message, causing it to be deleted.]],
	    Signature = [[id]],
	    [[id  - The id of the mail slot you took the item from (number) ]],
	},
	CLOSE_TABARD_FRAME = {
	    Description = [[Fires when the player ends interaction with a tabard designer]],
	},
	CLOSE_WORLD_MAP = {
	    Description = [[Fires when the world map should be hidden in response to external conditions. Such conditions include being teleported by a GM while the world map is open. Does not fire when the player closes the world map manually.]],
	},
	COMBAT_LOG_EVENT = {
	    Description = [[Fires when an event to be displayed in the combat log is received. This event fires only for combat log events which match the currently defined filters; COMBAT_LOG_EVENT_UNFILTERED fires for all combat events visible to the player.]],
	},
	COMBAT_LOG_EVENT_UNFILTERED = {
	    Description = [[Fires when a combat log event is received. This event fires for all combat events visible to the player; COMBAT_LOG_EVENT fires only for combat log events which match the currently defined filters.]],
	},
	COMBAT_RATING_UPDATE = {
	    Description = [[Fires when the player's combat rating statistics change]],
	},
	COMBAT_TEXT_UPDATE = {
	    Description = [[Fires when a message is received which can be displayed by the default UI's floating combat text feature]],
	    Signature = [[type, desc1, desc2]],
	    [[type  - Token identifying the type of message (string) ]],
	    [[desc1  - This field varies depending on the type of message.  See the chart for details (varies) ]],
	    [[desc2  - This field varies depending on the type of message.  See the chart for details (varies) ]],
	},
	COMPANION_LEARNED = {
	    Description = [[Fires when the player learns to summon a new mount or non-combat pet]],
	},
	COMPANION_UNLEARNED = {
	    Description = [[Fires when the player unlearns a mount or a companion. This will pretty much never happen, unless a Game Master gets involved.]],
	},
	COMPANION_UPDATE = {
	    Description = [[Fires when new information about the player's mounts and non-combat pets is available]],
	},
	CONFIRM_BINDER = {
	    Description = [[Fires when the player attempts to set a new Hearthstone location]],
	    Signature = [[newHome]],
	    [[newHome  - Name of the new Hearthstone location (string) ]],
	},
	CONFIRM_DISENCHANT_ROLL = {
	    Description = [[Fires when the player attempts to roll disenchant for an item which Binds on Pickup]],
	},
	CONFIRM_LOOT_ROLL = {
	    Description = [[Fires when the player attempts to roll for a loot item which Binds on Pickup]],
	    Signature = [[id, rolltype]],
	    [[id  - The slot id that you're rolling for (number) ]],
	    [[rolltype  - The numeric representing the type of roll you are doing.  Pass: 0, Need: 1, Greed: 2. (number) ]],
	},
	CONFIRM_SUMMON = {
	    Description = [[Fires when a summons is offered to the player]],
	},
	CONFIRM_TALENT_WIPE = {
	    Description = [[Fires when the player attempts to unlearn talents]],
	    Signature = [[cost]],
	    [[cost  - The amount in copper that it will cost you to untrain your talents. (number) ]],
	},
	CONFIRM_XP_LOSS = {
	    Description = [[Fires when the player attempts to resurrect at a graveyard spirit healer. Early in WoW's development, resurrecting at a spirit healer caused a loss of experience points. The change to a loss of item durability was made before the initial public release of World of Warcraft, but the name of this event was never changed.]],
	},
	CORPSE_IN_INSTANCE = {
	    Description = [[Fires when the player (dead, in spirit form) approaches the entrance to the instance in which his corpse is located]],
	},
	CORPSE_IN_RANGE = {
	    Description = [[Fires when the player (dead, in spirit form) approaches near enough to his corpse to return to life]],
	},
	CORPSE_OUT_OF_RANGE = {
	    Description = [[Fires when the player (dead, in spirit form) moves too far away from his corpse to resurrect]],
	},
	CRITERIA_UPDATE = {
	    Description = [[Fires when information about achievement criteria or player statistics becomes available]],
	},
	CURRENCY_DISPLAY_UPDATE = {
	    Description = [[Fires when new information for the currency list is available]],
	},
	CURRENT_SPELL_CAST_CHANGED = {
	    Description = [[Fires when the player starts or stops (cancels or finishes) casting a spell]],
	},
	CURSOR_UPDATE = {
	    Description = [[Fires when the mouse cursor image or contents is changed]],
	},
	CVAR_UPDATE = {
	    Description = [[Fires when the value of a configuration variable is updated. Fires regardless of whether the variable's value has changed.]],
	    Signature = [[glStr, value]],
	    [[glStr  - Global string related to the given CVAR (like "ENABLEBGSOUND" for "SoundEnableSoundWhenGameIsInBG" CVAR). (string) ]],
	    [[value  - The updated value assigned to the CVAR. Note: For boolean values this is a string of 0 or 1. (string) ]],
	},
	DELETE_ITEM_CONFIRM = {
	    Description = [[Fires when the player attempts to delete an item]],
	    Signature = [[itemName, itemQuality]],
	    [[itemName  - The name of the item you are attempting to delete (string) ]],
	    [[itemQuality  - The numeric index representing the items quality. (number) ]],
	},
	DISABLE_TAXI_BENCHMARK = {
	    Description = [[Fires when a flight path benchmarking session ends or is canceled]],
	},
	DISABLE_XP_GAIN = {
	    Description = [[Fires when the player disables experience point gains]],
	},
	DISPLAY_SIZE_CHANGED = {
	    Description = [[Fires when the screen resolution changes]],
	},
	DUEL_FINISHED = {
	    Description = [[Fires when a duel in which the player is participating ends. Can fire due to the duel being won or forfeit.]],
	},
	DUEL_INBOUNDS = {
	    Description = [[Fires when the player reenters the duel area after leaving its boundaries]],
	},
	DUEL_OUTOFBOUNDS = {
	    Description = [[Fires when the player begins to move outside the boundaries of a duel area. If the player remains outside the duel area for more than 10 seconds, he or she will forfeit the duel.]],
	},
	DUEL_REQUESTED = {
	    Description = [[Fires when the player is challenged to a duel. No event (other than the associated system message) fires when the player challenges another to a duel.]],
	    Signature = [[challenger]],
	    [[challenger  - The challenger's username (string) ]],
	},
	ENABLE_TAXI_BENCHMARK = {
	    Description = [[Fires when taxi benchmarking mode is enabled]],
	},
	ENABLE_XP_GAIN = {
	    Description = [[Fires when the player re-enabled experience point gain after disabling it]],
	},
	END_BOUND_TRADEABLE = {
	    Description = [[Fires when the player attempts an action which will make a looted Bind on Pickup item no longer tradeable. A Bind on Pickup item looted by the player can still be traded to other players (though only those who were eligible to loot it originally) for several minutes after looting, but certain actions can cancel this period early.]],
	},
	EQUIPMENT_SETS_CHANGED = {
	    Description = [[Fires when the player's list of equipment sets changes]],
	},
	EQUIPMENT_SWAP_FINISHED = {
	    Description = [[Fires when the process of switching equipment sets is complete. Many other events fire as the equipment swap takes place (each piece of equipment being equipped or placed into the character's bags, the character's combat attributes changing due to the new equipment, etc). An addon may not need to monitor each event that happens as part of this process, so it can unregister those events when EQUIPMENT_SWAP_PENDING fires and re-register for them when EQUIPMENT_SWAP_FINISHED fires.]],
	},
	EQUIPMENT_SWAP_PENDING = {
	    Description = [[Fires when the player begins to switch equipment sets. Many other events fire as the equipment swap takes place (each piece of equipment being equipped or placed into the character's bags, the character's combat attributes changing due to the new equipment, etc). An addon may not need to monitor each event that happens as part of this process, so it can unregister those events when EQUIPMENT_SWAP_PENDING fires and re-register for them when EQUIPMENT_SWAP_FINISHED fires.]],
	},
	EQUIP_BIND_CONFIRM = {
	    Description = [[Fires when the player attempts to equip an item which will become soulbound in the process]],
	    Signature = [[slot]],
	    [[slot  - The slot you are equiping into. (number) ]],
	},
	EXECUTE_CHAT_LINE = {
	    Description = [[Fires when a chat message is encountered in a running macro]],
	},
	FORGE_MASTER_CLOSED = {
	    Description = [[Fires when the reforging panel has been changed]],
	},
	FORGE_MASTER_ITEM_CHANGED = {
	    Description = [[Fires when the active item in the reforging panel changes]],
	},
	FORGE_MASTER_OPENED = {
	    Description = [[Fires when the reforging panel has been opened]],
	},
	FORGE_MASTER_SET_ITEM = {
	    Description = [[Fires when the player adds an item to the reforging panel]],
	},
	FRIENDLIST_UPDATE = {
	    Description = [[Fires when the content of the player's friends list becomes available or changes]],
	},
	GET_ITEM_INFO_RECEIVED = {
	    Description = [[Fires when item info requested by GetItemInfo() becomes available, if it wasn't already, through a disk seek or a net request]],
	},
	GLYPH_ADDED = {
	    Description = [[Fires when a glyph is inscribed into the player's spellbook]],
	},
	GLYPH_DISABLED = {
	    Description = [[Fires when a glyph slot is no longer available. Currently, glyph slots are enabled as the player gains levels (at levels 15, 30, 50, 70, and 80) and are never disabled, but this event may be used should disabling of slots become possible.]],
	},
	GLYPH_ENABLED = {
	    Description = [[Fires when a glyph slot becomes available. New glyph slots become available as the player gains levels.]],
	},
	GLYPH_REMOVED = {
	    Description = [[Fires when the player removes an inscribed glyph]],
	},
	GLYPH_UPDATED = {
	    Description = [[Fires when information about the player's inscribed glyphs becomes available]],
	},
	GMRESPONSE_RECEIVED = {
	    Description = [[Fires when the player receives a response to a GM ticket. Used for non-interactive responses, not GM conversations.]],
	},
	GMSURVEY_DISPLAY = {
	    Description = [[Fires when the player is invited to participate in a GM feedback survey]],
	},
	GOSSIP_CLOSED = {
	    Description = [[Fires when an NPC gossip interaction ends. Many NPCs provide a single gossip option leading into another type of interaction (e.g. a flight master offering a greeting) -- in this case, the gossip interaction still happens but is automatically skipped by the default UI, so this event still fires.]],
	},
	GOSSIP_CONFIRM = {
	    Description = [[Fires when the player is requested to confirm a gossip choice. Used when a gossip interaction involves a warning, such as for spending a large amount of money (e.g. purchasing Dual Talent Specialization).]],
	    Signature = [[index, message, cost]],
	    [[index  - The numeric index of the gossip option you're confirming (number) ]],
	    [[message  - The message to display for the confirmation (string) ]],
	    [[cost  - The cost of the action you're confirming.  Will be 0 if there is no cost. (number) ]],
	},
	GOSSIP_CONFIRM_CANCEL = {
	    Description = [[Fires when an attempt to confirm a gossip choice is canceled]],
	},
	GOSSIP_ENTER_CODE = {
	    Description = [[Fires when the player attempts a gossip choice which requires entering a code. Used for NPCs offering the ability to claim items such as Blizzcon special pets or loot cards from the WoW trading card game.]],
	    Signature = [[id]],
	    [[id  - The id of the gossip action you are attempting. (number) ]],
	},
	GOSSIP_SHOW = {
	    Description = [[Fires when an NPC gossip interaction begins]],
	},
	GROUP_ROSTER_UPDATE = {
	    Description = [[Fires when composition of party change.]],
	},
	GUILDBANKBAGSLOTS_CHANGED = {
	    Description = [[Fires when information about the contents of guild bank item slots changes or becomes available]],
	},
	GUILDBANKFRAME_CLOSED = {
	    Description = [[Fires when the player ends interaction with the guild bank]],
	},
	GUILDBANKFRAME_OPENED = {
	    Description = [[Fires when the player begins interaction with the guild bank]],
	},
	GUILDBANKLOG_UPDATE = {
	    Description = [[Fires when information for the guild bank transaction or money log becomes available]],
	},
	GUILDBANK_ITEM_LOCK_CHANGED = {
	    Description = [[Fires when an item in the guild bank is locked for moving or unlocked afterward]],
	},
	GUILDBANK_TEXT_CHANGED = {
	    Description = [[Fires when the text associated with a guild bank tab is changed]],
	},
	GUILDBANK_UPDATE_MONEY = {
	    Description = [[Fires when the amount of money in the guild bank changes]],
	},
	GUILDBANK_UPDATE_TABS = {
	    Description = [[Fires when information about guild bank tabs becomes available]],
	},
	GUILDBANK_UPDATE_TEXT = {
	    Description = [[Fires when text associated with a guild bank tab becomes available]],
	},
	GUILDBANK_UPDATE_WITHDRAWMONEY = {
	    Description = [[Fires when the amount of money the player can withdraw from the guild bank changes. Also fires when the player deposits money.]],
	},
	GUILDTABARD_UPDATE = {
	    Description = [[Fires when the player's guild tabard design changes.]],
	},
	GUILD_EVENT_LOG_UPDATE = {
	    Description = [[Fires when information for the guild event log becomes available]],
	},
	GUILD_INVITE_CANCEL = {
	    Description = [[Fires when an invitation to join a guild is no longer available. Can occur when the player declines an invitation or when the invitation expires after a period of time.]],
	},
	GUILD_INVITE_REQUEST = {
	    Description = [[Fires when the player is invited to join a guild]],
	    Signature = [[from, guildname]],
	    [[from  - The username of the player who invited you to their guild (string) ]],
	    [[guildname  - The name of the guild you are being invited to (string) ]],
	},
	GUILD_MOTD = {
	    Description = [[Fires when the guild message of the day is updated. Also fires during the login process so that the player can see the existing message.]],
	    Signature = [[message]],
	    [[message  - The new guild message. (string) ]],
	},
	GUILD_NEWS_UPDATE = {
	    Description = [[Fires when the Guild News are updated. This event may fire several times the first time the guild panel is opened.]],
	},
	GUILD_PARTY_STATE_UPDATED = {
	    Description = [[Fires when the guild state of the current dungeon changes. The guild state is whether or not the current dungeon is a guild run.]],
	},
	GUILD_PERK_UPDATE = {
	    Description = [[Fires when the guild gains or loses a perk]],
	},
	GUILD_RANKS_UPDATE = {
	    Description = [[Fires when unit is promoted or demoted within the guild. This event fires when unit is promoted or demoted within the guild. GUILD_ROSTER_UPDATE is fired at the same time.]],
	    Signature = [[unit]],
	    [[unit  - The unit that was promoted or demoted (string, unitId) ]],
	},
	GUILD_REGISTRAR_CLOSED = {
	    Description = [[Fires when the player ends interaction with a guild registrar]],
	},
	GUILD_REGISTRAR_SHOW = {
	    Description = [[Fires when the player begins interaction with a guild registrar]],
	},
	GUILD_ROSTER_UPDATE = {
	    Description = [[Fires when new information about the contents of the guild roster is available]],
	    Signature = [[update]],
	    [[update  - Wether or not the guild roster actually changes.  Typically indicates if a player has joined or left your guild. (boolean) ]],
	},
	GUILD_XP_UPDATE = {
	    Description = [[Fires when the Guild XP is updated]],
	},
	IGNORELIST_UPDATE = {
	    Description = [[Fires when the content of the player's ignore list becomes available or changes ]],
	},
	IGR_BILLING_NAG_DIALOG = {
	    Description = [[Fires when a message should be shown about the player's paid-per-hour game time expiring soon. Only used in locales where World of Warcraft is played via paid-per-hour Internet Game Rooms (e.g. Korea).]],
	},
	INCOMING_RESURRECT_CHANGED = {
	    Description = [[Fires when a resurrection spell is cast. Guaranteed to always have a return, whether "target", "raid20", or "party1", etc.]],
	    Signature = [[unitID]],
	    [[unitID  - The unit that was affected. (string) ]],
	},
	INSPECT_ACHIEVEMENT_READY = {
	    Description = [[Fires after the player attempts to compare achievements with another character, indicating that achievement information for the other unit has become available]],
	},
	INSPECT_HONOR_UPDATE = {
	    Description = [[Fires when information about the inspected unit's PvP activities becomes available]],
	},
	INSPECT_READY = {
	    Description = [[Fires when inspect information not readily available is now ready. Used for information such as PvP or Guild info.]],
	},
	INSTANCE_BOOT_START = {
	    Description = [[Fires when the player will soon be ejected from an instance. Occurs when the player leaves the group to which the instance belongs and has not yet exited the instance -- some time after this event provides a warning, the player will be teleported to the nearest graveyard.]],
	},
	INSTANCE_BOOT_STOP = {
	    Description = [[Fires when the warning countdown for ejecting the player from an instance is canceled. The player can avoid being ejected from an instance by re-joining the group to which the instance belongs or leaving the instance via other means.]],
	},
	INSTANCE_ENCOUNTER_ENGAGE_UNIT = {
	    Description = [[Fires when a boss has been engaged in an instance. Does not fire for every boss fights, as it is used to add the boss unit to the UI.]],
	},
	INSTANCE_LOCK_START = {
	    Description = [[Fires when the player will soon be saved to an instance. If the player enters an instance to which other group members are saved, this event provides a warning allowing the player an opportunity to leave before also becoming saved to the instance.]],
	},
	INSTANCE_LOCK_STOP = {
	    Description = [[Fires when the warning countdown for saving the player to an instance is canceled. The countdown is stopped when the player either leaves the instance or accepts being saved to it.]],
	},
	ITEM_LOCKED = {
	    Description = [[Fires when an item in the player's bags or equipped inventory is locked for moving]],
	},
	ITEM_LOCK_CHANGED = {
	    Description = [[Fires when an item in the player's bags or equipped inventory is locked for moving or unlocked afterward]],
	    Signature = [[bagID, slotID]],
	    [[bagID  - The bag id that the slot is in. (number) ]],
	    [[slotID  - The slot id that's lock is changing. (number) ]],
	},
	ITEM_PUSH = {
	    Description = [[Fires when the player receives an item. This event fires in addition to others which may indicate the item's origin (e.g. QUEST_ACCEPTED or CHAT_MSG_LOOT); in the default UI, this event triggers an "item falling into bag" animation displayed above the bag icons.]],
	    Signature = [[bagID, icon]],
	    [[bagID  - The id of the bag that the item is going into. (number) ]],
	    [[icon  - The icon file for the item being received. (string) ]],
	},
	ITEM_TEXT_BEGIN = {
	    Description = [[Fires when the player begins interaction with a readable item or world object. Readable items include books, scrolls, and saved copies of mail messages; readable world objects include plaques, gravestones and books on tables.]],
	},
	ITEM_TEXT_CLOSED = {
	    Description = [[Fires when the player ends interaction with a readable item or world object. Readable items include books, scrolls, and saved copies of mail messages; readable world objects include plaques, gravestones and books on tables.]],
	},
	ITEM_TEXT_READY = {
	    Description = [[Fires when text changes or becomes available for the readable item or world object with which the player is interacting. Also fires when turning pages in a multi-page text item.]],
	},
	ITEM_TEXT_TRANSLATION = {
	    Description = [[Fires when a "translation" progress bar should be displayed while the player interacts with a readable item or world object. Such a UI element indicates the player character's progress in translating the text to a readable in-game language; this feature is generally not used in the current version of WoW.]],
	    Signature = [[maxvalue]],
	    [[maxvalue  - The max value (number) ]],
	},
	ITEM_UNLOCKED = {
	    Description = [[Fires when an item in the player's bags or equipped inventory is unlocked after moving]],
	},
	KNOWLEDGE_BASE_ARTICLE_LOAD_FAILURE = {
	    Description = [[Fires when a knowledge base article fails to load]],
	},
	KNOWLEDGE_BASE_ARTICLE_LOAD_SUCCESS = {
	    Description = [[Fires when the contents of a successfully loaded knowledge base article become available]],
	},
	KNOWLEDGE_BASE_QUERY_LOAD_FAILURE = {
	    Description = [[Fires when a knowledge base query fails]],
	},
	KNOWLEDGE_BASE_QUERY_LOAD_SUCCESS = {
	    Description = [[Fires when results of a successful knowledge base query become available]],
	},
	KNOWLEDGE_BASE_SERVER_MESSAGE = {
	    Description = [[Fires when the knowledge base server message changes or becomes available]],
	},
	KNOWLEDGE_BASE_SETUP_LOAD_FAILURE = {
	    Description = [[Fires when the knowledge base's default listing fails to load]],
	},
	KNOWLEDGE_BASE_SETUP_LOAD_SUCCESS = {
	    Description = [[Fires when the knowledge base's default listing becomes available]],
	},
	KNOWLEDGE_BASE_SYSTEM_MOTD_UPDATED = {
	    Description = [[Fires when the knowledge base system's message of the day changes or becomes available]],
	},
	KNOWN_TITLES_UPDATE = {
	    Description = [[Fires when the number of titles available to the player changes]],
	},
	LANGUAGE_LIST_CHANGED = {
	    Description = [[Fires when the list of known languages changes.]],
	},
	LEARNED_SPELL_IN_TAB = {
	    Description = [[Fires when a spell is learned inside of a given spell book tab, including when spells are learned upon changing the active talent spec.]],
	    Signature = [[spellID, tabID]],
	    [[spellID  - The spell id of the spell that was learned. (number) ]],
	    [[tabID  - The id of the tab that has the updated item. (number) ]],
	},
	LEVEL_GRANT_PROPOSED = {
	    Description = [[Fires when the player is offered to instantly gain a level thanks to a Recruit-A-Friend partner]],
	},
	LFG_COMPLETION_REWARD = {
	    Description = [[Fires when the player receives the completion reward for a randoms LFG dungeon]],
	},
	LFG_LOCK_INFO_RECEIVED = {
	    Description = [[Fires when LFR information is available. Fires when LFR boss kill information is available to be queried using GetLFGDungeonNumEncounters() and GetLFGDungeonEncounterInfo()]],
	},
	LFG_PROPOSAL_SHOW = {
	    Description = [[Fires when the LFD system has found a possible group. Fires when the LFD system has found a possible group, and is seeking confirmation to enter the instance (via a call to AcceptProposal).]],
	},
	LFG_PROPOSAL_SUCCEEDED = {
	    Description = [[Fires when an LFD group was successfully formed. Fires when an LFD group was successfully formed and the party is being created]],
	},
	LFG_PROPOSAL_UPDATE = {
	    Description = [[Fires when a potential group member accepts or declines the LFD offer. Fires when a potential group member accepts or declines the LFD offer.]],
	},
	LFG_UPDATE = {
	    Description = [[Fires when information about the player's LFG system settings changes or becomes available]],
	},
	LFG_UPDATE_RANDOM_INFO = {
	    Description = [[Fires when instance information is available for populating the LFD frame]],
	},
	LOCALPLAYER_PET_RENAMED = {
	    Description = [[Fires when the player's pet is renamed. Primarily applies to hunter pets.]],
	},
	LOGOUT_CANCEL = {
	    Description = [[Fires when the logout countdown is aborted. The player is required to wait several seconds before logging out or quitting if not in an inn, major city or other "resting" area -- this method fires if the player attempts to log out or quit, starting the countdown, and then performs an action which aborts it.]],
	},
	LOOT_BIND_CONFIRM = {
	    Description = [[Fires when the player attempts to loot a Bind on Pickup item]],
	    Signature = [[slotID]],
	    [[slotID  - The id of the loot slot in question. (number) ]],
	},
	LOOT_CLOSED = {
	    Description = [[Fires when the player ends interaction with a lootable corpse or object. Fires regardless of whether looting ended by closing the default UI's loot window, looting all of its contents, or moving too far away from the corpse or object.]],
	},
	LOOT_OPENED = {
	    Description = [[Fires when the player begins interaction with a lootable corpse or object]],
	    Signature = [[autoLoot]],
	    [[autoLoot  - Specifies if the target should be autolooted or not. (boolean) ]],
	},
	LOOT_SLOT_CLEARED = {
	    Description = [[Fires when the contents of a loot slot are removed. Can fire due to the player looting the slot's contents or due to them being taken by another group member.]],
	    Signature = [[slotID]],
	    [[slotID  - The numeric id of the slot that was looted. (number) ]],
	},
	MACRO_ACTION_BLOCKED = {
	    Description = [[Fires when a macro script attempts to use a protected API ]],
	},
	MACRO_ACTION_FORBIDDEN = {
	    Description = [[Fires when a macro script attempts to use a protected API ]],
	},
	MAIL_CLOSED = {
	    Description = [[Fires when the player ends interaction with a mailbox]],
	},
	MAIL_FAILED = {
	    Description = [[Fires when an outgoing mail message fails to send. Can occur when the player attempts to send mail to an unknown recipient, or trying to send Bind on Account items to a character not on the player's account.]],
	},
	MAIL_INBOX_UPDATE = {
	    Description = [[Fires when information about the contents of the player's inbox changes or becomes available]],
	},
	MAIL_SEND_INFO_UPDATE = {
	    Description = [[Fires when information about the outgoing mail message's attachments changes]],
	},
	MAIL_SEND_SUCCESS = {
	    Description = [[Fires when an outgoing message is successfully sent]],
	},
	MAIL_SHOW = {
	    Description = [[Fires when the player begins interaction with a mailbox]],
	},
	MASTERY_UPDATE = {
	    Description = [[Fires when the player's mastery rating is updated]],
	},
	MERCHANT_CLOSED = {
	    Description = [[Fires when the player ends interaction with a vendor]],
	},
	MERCHANT_SHOW = {
	    Description = [[Fires when the player begins interaction with a vendor]],
	},
	MERCHANT_UPDATE = {
	    Description = [[Fires when information about a vendor's available items changes or becomes available. This event is most meaningful when it fires in response to the player purchasing an item for which the vendor has a limited supply, but it also fires in response to any other vendor transaction.]],
	},
	MINIGAME_UPDATE = {
	    Description = [[Unused. Minigames are not implemented in the current version of the WoW client.]],
	},
	MINIMAP_PING = {
	    Description = [[Fires when the player or a group member "pings" a point on the minimap to share its location with the group]],
	    Signature = [[unit, x, y]],
	    [[unit  - The unit of the player that was the source of said event (string) ]],
	    [[x  - The x coordinate.  0 is the center point going out to .5 to the right and -.5 to the left. (number) ]],
	    [[y  - The y coordinate.  0 is the center point going out to .5 to the top and -.5 to the bottom. (number) ]],
	},
	MINIMAP_UPDATE_TRACKING = {
	    Description = [[Fires when the player's currently active tracking ability changes. Applies to both tracking spells (such as a hunter's Track Beasts or a miner's Find Minerals) and UI tracking abilities provided to all players (such as finding Repair vendors or Low Level Quests).]],
	},
	MINIMAP_UPDATE_ZOOM = {
	    Description = [[Fires when the minimap zoom type changes. The client stores separate zoom level settings for both indoor and outdoor areas; this event fires so that the minimap's zoom level can be changed when the player moves between such areas. It does not fire when directly setting the minimap's zoom level.]],
	},
	MIRROR_TIMER_PAUSE = {
	    Description = [[Fires when a special countdown timer is paused. Mirror timers are used for breath and fatigue when swimming and for the hunter Feign Death ability.]],
	    Signature = [[duration]],
	    [[duration  - How long the timers should be paused. (number) ]],
	},
	MIRROR_TIMER_START = {
	    Description = [[Fires when a special countdown timer starts. Mirror timers are used for breath and fatigue when swimming and for the hunter Feign Death ability.]],
	    Signature = [[name, value, maxvalue, step, pause, label]],
	    [[name  - The name of the timer that is starting. (string) ]],
	    [[value  - The current value of the timer. (number) ]],
	    [[maxvalue  - The max value of the timer. (number) ]],
	    [[step  - The step that the value moves. (number) ]],
	    [[pause  - Signifies whether the timer is paused. (number) ]],
	    [[label  - The label for the timer. (string) ]],
	},
	MIRROR_TIMER_STOP = {
	    Description = [[Fires when a special countdown timer stops. Mirror timers are used for breath and fatigue when swimming and for the hunter Feign Death ability.]],
	    Signature = [[name]],
	    [[name  - The name associated with the timer that stopped. (string) ]],
	},
	MODIFIER_STATE_CHANGED = {
	    Description = [[Fires when a modifier key is pressed or released.]],
	    Signature = [[key, state]],
	    [[key  - The name of the key that you pressed.  Possible values are LSHIFT, RSHIFT, LCTRL, RCTRL, LALT, and RALT. (string) ]],
	    [[state  - The state the key has entered. 1 means that the the key has been pressed.  0 means that the key has been released. (number) ]],
	},
	MOVIE_COMPRESSING_PROGRESS = {
	    Description = [[Fires when compression of a movie recording starts]],
	},
	MOVIE_RECORDING_PROGRESS = {
	    Description = [[Fires when movie recording starts]],
	},
	MOVIE_UNCOMPRESSED_MOVIE = {
	    Description = [[Fires when the client prompts the player to allow compression of a movie recording]],
	    Signature = [[filename]],
	    [[filename  - The filename of the movie to compress (string) ]],
	},
	MUTELIST_UPDATE = {
	    Description = [[Fires when the content of the player's muted list becomes available or changes]],
	},
	NEUTRAL_FACTION_SELECT_RESULT = {
	    Description = [[Fires when Pandarian player will choose his side (Alliance/Horde).]],
	},
	NEW_AUCTION_UPDATE = {
	    Description = [[Fires when the content of the auction house's Create Auction item slot changes]],
	},
	NEW_TITLE_EARNED = {
	    Description = [[Fires when the player earns a new title]],
	    Signature = [[title]],
	    [[title  - The name of the title (string) ]],
	},
	NEW_WMO_CHUNK = {
	    Description = [[Fires when stepping off of a world map object. Appears to fire whenever the player has moved off of a structure such as a bridge or building and onto terrain or another object.]],
	},
	NPC_PVPQUEUE_ANYWHERE = {
	    Description = [[Fires when the player begins interaction with an NPC which can queue the player for any battleground]],
	},
	OLD_TITLE_LOST = {
	    Description = [[Fires when one of the player's titles is no longer available]],
	    Signature = [[title]],
	    [[title  - The name of the title you've lost (string) ]],
	},
	OPEN_MASTER_LOOT_LIST = {
	    Description = [[Fires when the list of master loot candidates becomes available]],
	},
	OPEN_TABARD_FRAME = {
	    Description = [[Fires when the player begins interaction with a tabard designer]],
	},
	PARTY_CONVERTED_TO_RAID = {
	    Description = [[Fires when the player's party becomes a raid group]],
	},
	PARTY_INVITE_CANCEL = {
	    Description = [[Fires when a pending invitation to join a group is no longer available]],
	},
	PARTY_INVITE_REQUEST = {
	    Description = [[Fires when the player is invited to join a group]],
	    Signature = [[sender]],
	    [[sender  - The name of the person who sent the invite. (string) ]],
	},
	PARTY_LEADER_CHANGED = {
	    Description = [[Fires when information about the leadership of the player's party changes or becomes available]],
	},
	PARTY_LOOT_METHOD_CHANGED = {
	    Description = [[Fires when information about the loot rules for the player's party changes or becomes available]],
	},
	PARTY_MEMBERS_CHANGED = {
	    Description = [[Fires when information about the membership of the player's party changes or becomes available]],
	},
	PARTY_MEMBER_DISABLE = {
	    Description = [[Fires when a party member goes offline]],
	    Signature = [[id]],
	    [[id  - The party id of the player disabled. (number) ]],
	},
	PARTY_MEMBER_ENABLE = {
	    Description = [[Fires when an offline party member comes back online]],
	    Signature = [[id]],
	    [[id  - The id of the effected party member (number) ]],
	},
	PETITION_CLOSED = {
	    Description = [[Fires when the player ends interaction with a guild or arena team charter]],
	},
	PETITION_SHOW = {
	    Description = [[Fires when a guild or arena team charter is presented to the player]],
	},
	PETITION_VENDOR_CLOSED = {
	    Description = [[Fires when the player ends interaction with an arena registrar]],
	},
	PETITION_VENDOR_SHOW = {
	    Description = [[Fires when the player begins interaction with an arena registrar]],
	},
	PETITION_VENDOR_UPDATE = {
	    Description = [[Fires when information about available options at an arena registrar becomes available]],
	},
	PET_ATTACK_START = {
	    Description = [[Fires when the player's pet starts auto-attacking]],
	},
	PET_ATTACK_STOP = {
	    Description = [[Fires when the player's pet stops auto-attacking]],
	},
	PET_BAR_HIDE = {
	    Description = [[Fires when the pet action bar should be hidden. Does not fire in all cases where the default UI automatically hides the pet bar if inapplicable.]],
	},
	PET_BAR_HIDEGRID = {
	    Description = [[Fires when a pet ability is removed from the cursor. In the default UI, this event causes the grid of empty pet action bar slots to be hidden. (This grid only appears when something that can be dragged to the pet action bar slot is picked up.)]],
	},
	PET_BAR_SHOWGRID = {
	    Description = [[Fires when a pet ability is picked up onto the cursor. In the default UI, this event causes the grid of empty pet action bar slots to be shown. (This grid only appears when something that can be dragged to the pet action bar slot is picked up.)]],
	},
	PET_BAR_UPDATE = {
	    Description = [[Fires when information about the content of the pet action bar changes or becomes available]],
	},
	PET_BAR_UPDATE_COOLDOWN = {
	    Description = [[Fires when the cooldown begins or ends for an ability on the pet action bar]],
	},
	PET_BATTLE_AURA_APPLIED = {
	    Description = [[Fires when an aura is applied to a pet in a pet battle]],
	},
	PET_BATTLE_CLOSE = {
	    Description = [[Fired when the pet battle interface closes at the end of a battle]],
	},
	PET_BATTLE_OPENING_DONE = {
	    Description = [[Fires when the opening sequence of a pet battle ends]],
	},
	PET_BATTLE_OPENING_START = {
	    Description = [[Fires when the opening sequence of a pet battle begins]],
	},
	PET_DISMISS_START = {
	    Description = [[Fires when the player's pet is dismissed. Applies to warlock minions, mind controlled units, quest-related pets, etc., but not to hunter pets.]],
	},
	PET_FORCE_NAME_DECLENSION = {
	    Description = [[Fires when the player is prompted to provide Russian declensions for a pet's name. Only applies in the Russian client.]],
	},
	PET_RENAMEABLE = {
	    Description = [[Fires when the player is prompted to rename a pet which has been renamed before. A hunter's pet can normally only be named once, but a Certificate of Ownership can be used to rename a pet which has been renamed before.]],
	},
	PET_STABLE_CLOSED = {
	    Description = [[Fires when the player ends interaction with the pet stables]],
	},
	PET_STABLE_SHOW = {
	    Description = [[Fires when the player begins interaction with the pet stables]],
	},
	PET_STABLE_UPDATE = {
	    Description = [[Fires when information about the pet stables' content changes or becomes available]],
	},
	PET_STABLE_UPDATE_PAPERDOLL = {
	    Description = [[Fires when information about 3D models used in the pet stables becomes available. Generally, this information is available on PET_STABLE_UPDATE, but this event may fire if model information needed to be retrieved from the server.]],
	},
	PET_UI_CLOSE = {
	    Description = [[Fires when information about the player's pet is no longer available. Used in the default UI to determine whether the Pet section of the Character window should be shown; most often, this is determined in response to other events (e.g. UNIT_PET), but this event may fire in some cases where the player switches pets.]],
	},
	PET_UI_UPDATE = {
	    Description = [[Fires when information about the player's pet changes or becomes available]],
	},
	PLAYERBANKBAGSLOTS_CHANGED = {
	    Description = [[Fires when the number of bank bag slots purchased by the player changes]],
	},
	PLAYERBANKSLOTS_CHANGED = {
	    Description = [[Fires when the contents of a bank slot or bank bag slot are changed]],
	    Signature = [[slotID]],
	    [[slotID  - The slot id that changes.  1-28 is the bank slots.  29-35 are the bank bags. (number) ]],
	},
	PLAYER_ALIVE = {
	    Description = [[Fires when the player's spirit is released after death or when the player accepts a resurrection without releasing]],
	},
	PLAYER_AURAS_CHANGED = {
	    Description = [[Fires when the player gains or loses a buff or debuff. Removed in patch 3.02. Use UNIT_AURA instead.]],
	},
	PLAYER_AVG_ITEM_LEVEL_READY = {
	    Description = [[Fires when the average item level of the player has been received from the server.]],
	},
	PLAYER_CAMPING = {
	    Description = [[Fires when the player attempts to log out while not in a major city, inn, or other "resting" area]],
	},
	PLAYER_CONTROL_GAINED = {
	    Description = [[Fires when the player regains control of his or her character. Occurs when a fear, mind control, or similar effect wears off or when the player arrives at the end of an automated flight path.]],
	},
	PLAYER_CONTROL_LOST = {
	    Description = [[Fires when the player loses control of his or her character. Occurs when the player is afflicted by a fear, mind control, or similar effect or when the player takes an automated flight path.]],
	},
	PLAYER_DAMAGE_DONE_MODS = {
	    Description = [[Fires when an effect changes the player's spell bonus damage]],
	    Signature = [[unit]],
	    [[unit  - Is always 'player' (string) ]],
	},
	PLAYER_DEAD = {
	    Description = [[Fires when the player dies]],
	},
	PLAYER_ENTERING_BATTLEGROUND = {
	    Description = [[Fires when the player enters a battleground instance. Otherwise equivalent to PLAYER_ENTERING_WORLD.]],
	},
	PLAYER_ENTERING_WORLD = {
	    Description = [[Fired when the player enters the world, reloads the UI, enters/leaves an instance or battleground, or respawns at a graveyard. Also fires any other time the player sees a loading screen]],
	},
	PLAYER_ENTER_COMBAT = {
	    Description = [[Fires when the player begins melee auto-attack mode. This event cannot be used to detect when the player is entering a combat situation (i.e. when targeted by a hostile creature); for such cases, see PLAYER_REGEN_DISABLED.]],
	},
	PLAYER_EQUIPMENT_CHANGED = {
	    Description = [[Fires when the player equips or unequips an item]],
	    Signature = [[slot, hasItem]],
	    [[slot  - The inventory slot affected by the equipment change. (number, inventoryID) ]],
	    [[hasItem  - 1 if the slot contains an item, otherwise nil. (1nil) ]],
	},
	PLAYER_FARSIGHT_FOCUS_CHANGED = {
	    Description = [[Fires when the player's viewpoint changes. Examples include spells such as Far Sight, Mind Vision, Eye of Kilrogg and various quest-related effects.]],
	},
	PLAYER_FLAGS_CHANGED = {
	    Description = [[Fires when a unit's AFK or DND status changes]],
	    Signature = [[unitID]],
	    [[unitID  - The unit of the affected player. (string) ]],
	},
	PLAYER_FOCUS_CHANGED = {
	    Description = [[Fires when the player's focus unit changes]],
	},
	PLAYER_GAINS_VEHICLE_DATA = {
	    Description = [[Fires when the player gains vehicle-related attributes without necessarily entering a vehicle. This can occur when the player uses a multi-passenger mount -- like all other mounts it is considered an extension of the player rather than a separate vehicle unit, but it has vehicle-related attributes such as a seat diagram and passenger controls for exiting.]],
	},
	PLAYER_GUILD_UPDATE = {
	    Description = [[Fires when information about the player's guild membership changes]],
	    Signature = [[unitID]],
	    [[unitID  - The unit of the player effect.  Most of the time this will be player, however sometimes it will be nil. (string) ]],
	},
	PLAYER_LEAVE_COMBAT = {
	    Description = [[Fires when the player stops melee auto-attack mode. This event cannot be used to detect when the player is exiting a combat situation (i.e. after defeating for fleeing from a hostile creature); for such cases, see PLAYER_REGEN_ENABLED.]],
	},
	PLAYER_LEAVING_WORLD = {
	    Description = [[Fires when the player logs out or exits a world area. Can occur when leaving an instance or leaving one continent (or other separated world area) for another.]],
	},
	PLAYER_LEVEL_UP = {
	    Description = [[Fires when the player gains a character level. Ding!]],
	    Signature = [[level, hp, mp, talentPoints, strength, agility, stamina, intellect, spirit]],
	    [[level  - The new player level. More accurate than UnitLevel at that time. (string) ]],
	    [[hp  - Hit points gained. (number) ]],
	    [[mp  - Mana points gained. (number) ]],
	    [[talentPoints  - Talent points gained. (number) ]],
	    [[strength  - Strength points gained. (number) ]],
	    [[agility  - Agility points gained. (number) ]],
	    [[stamina  - Stamina points gained. (number) ]],
	    [[intellect  - Intellect points gained. (number) ]],
	    [[spirit  - Spirit points gained. (number) ]],
	},
	PLAYER_LOGIN = {
	    Description = [[Fires immediately before PLAYER_ENTERING_WORLD on login and UI reload. But unlike PLAYER_ENTERING_WORLD, this event ONLY fires for login/reload.]],
	},
	PLAYER_LOGOUT = {
	    Description = [[Fires immediately before the player is logged out of the game. Unlike PLAYER_LEAVING_WORLD, this event only fires upon logout and not when moving to different areas.]],
	},
	PLAYER_LOSES_VEHICLE_DATA = {
	    Description = [[Fires when the player loses vehicle-related attributes without necessarily having been in a vehicle. This can occur when the player uses a multi-passenger mount -- like all other mounts it is considered an extension of the player rather than a separate vehicle unit, but it has vehicle-related attributes such as a seat diagram and passenger controls for exiting.]],
	},
	PLAYER_MONEY = {
	    Description = [[Fires when the player gains or spends money]],
	},
	PLAYER_PVP_KILLS_CHANGED = {
	    Description = [[Fires whenever a player's number of Honorable Kills changes]],
	},
	PLAYER_PVP_RANK_CHANGED = {
	    Description = [[Fires when the player's PvP rank changes. Related to the old PvP rewards system from before WoW Patch 2.0; no longer used.]],
	},
	PLAYER_QUITING = {
	    Description = [[Fires when the player attempts to exit WoW while not in a major city, inn, or other "resting" area]],
	},
	PLAYER_REGEN_DISABLED = {
	    Description = [[Fires when the player enters combat status. When in combat, normal health and mana regeneration is disabled.]],
	},
	PLAYER_REGEN_ENABLED = {
	    Description = [[Fires when the player leaves combat status. When in combat, normal health and mana regeneration is disabled.]],
	},
	PLAYER_SKINNED = {
	    Description = [[Fires when another character takes the insignia from the player's corpse in a battleground or world PvP zone. The player can no longer resurrect by returning to his or her corpse once it has been looted.]],
	},
	PLAYER_SPECIALIZATION_CHANGED = {
	    Description = [[Fires when the player, group member or raid member switches specialization.]],
	},
	PLAYER_TALENT_UPDATE = {
	    Description = [[Fires when the player gains or spends talent points]],
	},
	PLAYER_TARGET_CHANGED = {
	    Description = [[Fires when the player changes targets]],
	    Signature = [[cause]],
	    [[cause  - a token indicating the cause of the target change (string) LeftButton - selected the target using static frames in the UI]],
	    [[NIL - target moved out of range and was lost]],
	    [[down - pressed Escape to clear the target selection]],
	    [[up - clicked a unit directly]],
	},
	PLAYER_TOTEM_UPDATE = {
	    Description = [[Fires when information about the player's placed totems changes or becomes available. Also used for ghouls summoned by a Death Knight's Raise Dead ability (if the ghoul is not made a controllable pet by the Master of Ghouls talent).]],
	},
	PLAYER_TRADE_MONEY = {
	    Description = [[Fires when the amount of money offered for trade by the player changes]],
	},
	PLAYER_UNGHOST = {
	    Description = [[Fires when a player resurrects after being in spirit form]],
	},
	PLAYER_UPDATE_RESTING = {
	    Description = [[Fires when the player enters or leaves a major city, inn or other "resting" area]],
	},
	PLAYER_XP_UPDATE = {
	    Description = [[Fires when the player's amount of accrued experience points changes]],
	},
	PLAYTIME_CHANGED = {
	    Description = [[Fires when changes to the player's limited play time status take effect. Only used in locales where the length of play sessions is restricted (e.g. mainland China).]],
	},
	PLAY_MOVIE = {
	    Description = [[Fires when an in-game movie should be played. Currently used only for the video in the Wrathgate quest event.]],
	},
	PREVIEW_TALENT_POINTS_CHANGED = {
	    Description = [[Fires when the player spends or unspends talent points in preview mode]],
	},
	PVPQUEUE_ANYWHERE_SHOW = {
	    Description = [[Fires when the player begins interacting with the UI feature allowing battleground queueing from any location]],
	},
	PVPQUEUE_ANYWHERE_UPDATE_AVAILABLE = {
	    Description = [[Fires when information for the any-battleground queueing UI changes or becomes available]],
	},
	PVP_RATED_STATS_UPDATE = {
	    Description = [[Fires when GetPersonalRatedBGInfo() return variables changes or becomes available.]],
	},
	PVP_REWARDS_UPDATE = {
	    Description = [[Fires when information about Conquest Points cap changes or becomes available]],
	},
	QUEST_ACCEPTED = {
	    Description = [[Fires when a new quest is added to the player's quest log (which is what happens after a player accepts a quest).]],
	    Signature = [[questIndex]],
	    [[questIndex  - Index where the accepted quest was placed in the quest log (between 1 and GetNumQuestLogEntries()) (number) ]],
	},
	QUEST_ACCEPT_CONFIRM = {
	    Description = [[Fires when certain kinds of quests (e.g. NPC escort quests) are started by another member of the player's group]],
	    Signature = [[name, quest]],
	    [[name  - The name of the user who started the quest. (string) ]],
	    [[quest  - The name of the quest that was started. (string) ]],
	},
	QUEST_AUTOCOMPLETE = {
	    Description = [[Fires when a quest is automatically completed (remote handin available)]],
	    Signature = [[questId]],
	    [[questId  - The ID of the quest completed (blizzid) ]],
	},
	QUEST_COMPLETE = {
	    Description = [[Fires when the player is looking at the "Complete" page for a quest, at a questgiver.. This is the portion of a questgiver dialog in which the player is offered to choose a reward (or accept the only reward) and sees the "Complete" button available. This event does NOT fire when they actually complete the quest, it fires when they SEE the "Complete" button and are offered the ability to complete the quest, and has nothing to do with whether they actually turned in the quest or not.]],
	},
	QUEST_DETAIL = {
	    Description = [[Fires when details of an available quest are presented by a questgiver. Fires for the portion of a questgiver dialog in which the the quest is described and the player is offered to accept the quest, sometimes after choosing the available quest from a greeting dialog.]],
	},
	QUEST_FINISHED = {
	    Description = [[Fires when the player ends interaction with a questgiver or ends a stage of the questgiver dialog. A typical dialogue with a questgiver is presented in four stages (though some stages may be skipped for some quests):]],
	},
	QUEST_GREETING = {
	    Description = [[Fires when a questgiver presents a greeting along with a list of active or available quests. Used only for a few questgivers; most questgivers offering multiple quests or other dialog options use the Gossip APIs instead (with GOSSIP_SHOW being the equivalent to this event).]],
	},
	QUEST_ITEM_UPDATE = {
	    Description = [[Fires when information about items in a questgiver dialog is updated. Only fires if information about quest items is retrieved from the server after the quest dialog is presented (via QUEST_DETAIL, QUEST_PROGRESS, QUEST_COMPLETE).]],
	},
	QUEST_LOG_UPDATE = {
	    Description = [[Fires when the game client receives updates relating to the player's quest log (this event is not just related to the quests inside it). There are a LOT of various things that cause the server to send quest log information to the player's client, such as: Logging into the game world, zoning between servers (anytime you see a loading screen), accepting quests, deleting/abandoning quests, completing quests, quest progress updates (achieving whole or partial objective updates for a quest), when dailies reset (the "You can only complete 25 more daily quests today" event), and whenever something regarding the DISPLAY of the quest log VISUALLY changes (such as when you collapse or expand headers in the quest log; with headers being the lines such as "Terokkar Forest", that separate the quests into groups).]],
	},
	QUEST_PROGRESS = {
	    Description = [[Fires when interacting with a questgiver about an active quest. This is the portion of a questgiver dialog in which the questgiver verifies the player's progress on the quest (e.g. "Have you brought me all 20 gnoll ears yet?"), generally after choosing the active quest from a greeting dialog and before turning in the completed quest.]],
	},
	QUEST_WATCH_UPDATE = {
	    Description = [[Fires when the player's status regarding a quest's objectives changes, for instance picking up a required object or killing a mob for that quest. All forms of (quest objective) progress changes will trigger this event.]],
	    Signature = [[questIndex]],
	    [[questIndex  - Index of the affected quest in the quest log (between 1 and GetNumQuestLogEntries()) (number) ]],
	},
	RAID_INSTANCE_WELCOME = {
	    Description = [[Fires when the player enters an instance that has a reset timer]],
	    Signature = [[name, ttl]],
	    [[name  - The name of the instance you're entering (string) ]],
	    [[ttl  - The time till the instance resets, in seconds. (number) ]],
	},
	RAID_ROSTER_UPDATE = {
	    Description = [[Fires when the raid roster changes. This occurs when a raid is formed or disbanded, if members join or leave or are moved between raid subgroups, if the loot policy or loot master is changed, or if raid leader, assistant, main tank or main assist attributes are changed.]],
	},
	RAID_TARGET_UPDATE = {
	    Description = [[Fires when raid target icons are assigned or cleared]],
	},
	RAISED_AS_GHOUL = {
	    Description = [[Fires when the player is raised as a ghoul by a friendly death knight]],
	},
	READY_CHECK = {
	    Description = [[Fires when a ready check is triggered]],
	    Signature = [[name]],
	    [[name  - The username of the person who triggered the ready check (string) ]],
	},
	READY_CHECK_CONFIRM = {
	    Description = [[Fires when a unit responds to a ready check]],
	    Signature = [[id, response]],
	    [[id  - The unitid without raid or party prefix (number) ]],
	    [[response  - true if the unit is ready, otherwise false. (boolean) ]],
	},
	READY_CHECK_FINISHED = {
	    Description = [[Fires when a ready check ends]],
	},
	RECEIVED_ACHIEVEMENT_MEMBER_LIST = {
	    Description = [[Fires when the list of players that earned an achievement is received. This is used with guild achievements that are earned with a specific amount of members, such as dungeon runs.]],
	},
	REPLACE_ENCHANT = {
	    Description = [[Fires when the player attempts to enchant an item which is already enchanted]],
	    Signature = [[current, new]],
	    [[current  - The name of the current enchant. (string) ]],
	    [[new  - The name of the proposed enchant. (string) ]],
	},
	RESURRECT_REQUEST = {
	    Description = [[Fires when another character offers to resurrect the player]],
	    Signature = [[name]],
	    [[name  - The name of the user who is attempting to ressurect you/ (string) ]],
	},
	RUNE_TYPE_UPDATE = {
	    Description = [[Fires when the type of one of the player's rune resources changes]],
	    Signature = [[runeIndex]],
	    [[runeIndex  - the runeIndex that was affected. (number) ]],
	},
	SCREENSHOT_FAILED = {
	    Description = [[Fires if an attempt to take a screenshot fails]],
	},
	SCREENSHOT_SUCCEEDED = {
	    Description = [[Fires when a screenshot is successfully taken]],
	},
	SEND_MAIL_COD_CHANGED = {
	    Description = [[Fires when the Cash On Delivery cost assigned for the outgoing mail message changes]],
	},
	SEND_MAIL_MONEY_CHANGED = {
	    Description = [[Fires when the amount of money attached to the outgoing mail message changes]],
	},
	SKILL_LINES_CHANGED = {
	    Description = [[Fires when the content of the player's skill list changes. Applies only to major changes to the list -- e.g. learning a new skill or raising one's level (such as from Journeyman to Master) in a trade skill -- not to skill rank increases.]],
	},
	SOCKET_INFO_CLOSE = {
	    Description = [[Fires when the player ends interaction with the item socketing UI]],
	},
	SOCKET_INFO_UPDATE = {
	    Description = [[Fires when information about the contents of the item socketing UI changes or becomes available]],
	},
	SOUND_DEVICE_UPDATE = {
	    Description = [[Fires when information about sound input/output devices changes or becomes available]],
	},
	SPELLS_CHANGED = {
	    Description = [[Fires when information about the contents of the player's spellbook changes or becomes available. Applies to both new content (e.g. learning a new spell or tradeskill) and changes which should cause the spellbook display to change (e.g. equipping a different main hand weapon, thus changing the icon for the Attack spell).]],
	},
	SPELL_ACTIVATION_OVERLAY_GLOW_SHOW = {
	    Description = [[Fires when a reactive spell becomes active. Used for proc-like spells, such as Deep Freeze.]],
	    Signature = [[spellId]],
	    [[spellId  - The ID of the spell activated (number) ]],
	},
	SPELL_ACTIVATION_OVERLAY_SHOW = {
	    Description = [[Fires when the player receives a reactive buff that should appear on the screen overlay. Positions can be simple:]],
	    Signature = [[spellID, texture, positions, scale, r, g, b]],
	    [[CENTER]],
	    [[LEFT]],
	    [[RIGHT]],
	    [[TOP]],
	    [[TOPRIGHT]],
	    [[TOPLEFT]],
	    [[BOTTOMRIGHT]],
	    [[BOTTOMLEFT]],
	    [[RIGHT (FLIPPED)]],
	    [[BOTTOM (FLIPPED)]],
	    [[LEFT + RIGHT (FLIPPED)]],
	    [[TOP + BOTTOM (FLIPPED)]],
	    [[spellID  - The ID of the Achievement earned (number) ]],
	    [[texture  - Full path to the texture file that should appear on screen (string) ]],
	    [[positions  - Positions of the texture in the overlay (string) ]],
	    [[scale  - Scale of the texture (number) ]],
	    [[r  - Red value (number) ]],
	    [[g  - Green value (number) ]],
	    [[b  - Blue value (number) ]],
	},
	SPELL_PUSHED_TO_ACTIONBAR = {
	    Description = [[When you learn a spell and it's placed on the actionbar, this event fires and tells the IconIntroAnimation frame to animate the icon and place it on the actionbar slot.]],
	},
	SPELL_UPDATE_COOLDOWN = {
	    Description = [[Fires when the cooldown on one of the player's spells begins or ends. Only fires while something is being cast (i.e. beginning of cast, end of cast.) ]],
	},
	SPELL_UPDATE_USABLE = {
	    Description = [[Fires when a spell becomes usable or unusable. Includes when spells become unusable due to the global cooldown.]],
	},
	START_AUTOREPEAT_SPELL = {
	    Description = [[Fires when the player casts a spell which automatically repeats. Used by (for example) Shoot for wand users.]],
	},
	START_LOOT_ROLL = {
	    Description = [[Fires when an item becomes available for group loot rolling]],
	    Signature = [[id, time]],
	    [[id  - The id for this roll (number) ]],
	    [[time  - How long the roll will last (number) ]],
	},
	START_MINIGAME = {
	    Description = [[Unused. Minigames are not implemented in the current version of the WoW client.]],
	},
	START_TIMER = {
	    Description = [[Tells TimerFrame what timebar to create, informs about the current time left and the original value it started to countdown from.]],
	},
	STOP_AUTOREPEAT_SPELL = {
	    Description = [[Fires when the player stops repetition of an automatically repeating spell. Used by (for example) Shoot for wand users.]],
	},
	STREAMING_ICON = {
	    Description = [[Fires when the game starts or stops downloading or patching content that is not yet ready]],
	},
	SYNCHRONIZE_SETTINGS = {
	    Description = [[Fires when game options are manually synchronized with those saved on the server]],
	},
	TABARD_CANSAVE_CHANGED = {
	    Description = [[Fires when information about the player's ability to save a guild tabard design changes or becomes available]],
	},
	TABARD_SAVE_PENDING = {
	    Description = [[Fires when the player attempts to save a guild tabard design]],
	},
	TALENTS_INVOLUNTARILY_RESET = {
	    Description = [[Fires when the player's talents have undergone a forced reset. This usually happens after a major patch or on test realms.]],
	},
	TAXIMAP_CLOSED = {
	    Description = [[Fires when the player begins interaction with a flight master]],
	},
	TAXIMAP_OPENED = {
	    Description = [[Fires when the player ends interaction with a flight master]],
	},
	TIME_PLAYED_MSG = {
	    Description = [[Fires when information about the player's total time played becomes available. Such information is normally requested via the /played command.]],
	    Signature = [[total, level]],
	    [[total  - The ammount of time played total, in seconds. (number) ]],
	    [[level  - The ammount of time played this level, in seconds. (number) ]],
	},
	TRACKED_ACHIEVEMENT_UPDATE = {
	    Description = [[Fires when the player's progress changes on an achievement marked for watching in the objectives tracker]],
	    Signature = [[achievementId]],
	    [[achievementId  - The ID of the Achievement tracked (number) ]],
	},
	TRADE_ACCEPT_UPDATE = {
	    Description = [[Fires when the player or trade target signals acceptance (or cancels acceptance) of the trade]],
	    Signature = [[player, target]],
	    [[player  - Your accepted status. 1 for yes, 0 for no. (number) ]],
	    [[target  - Your target's accepted status. 1 for yes, 0 for no. (number) ]],
	},
	TRADE_CLOSED = {
	    Description = [[Fires when a trade with another player ends or is canceled]],
	},
	TRADE_MONEY_CHANGED = {
	    Description = [[Fires when the amount of money offered by the trade target changes]],
	},
	TRADE_PLAYER_ITEM_CHANGED = {
	    Description = [[Fires when the set of items offered for trade by the player changes]],
	    Signature = [[slotID]],
	    [[slotID  - The slot id of the item you are trading (1-7). (number) ]],
	},
	TRADE_REPLACE_ENCHANT = {
	    Description = [[Fires if the player attempts to enchant an item offered by the trade target which is already enchanted]],
	    Signature = [[current, new]],
	    [[current  - The current item enchant (string) ]],
	    [[new  - The name of the new proposed item enchant (string) ]],
	},
	TRADE_REQUEST = {
	    Description = [[Unused. Was once used for presenting the player with a confirmation dialog before initiating a trade offered by another character.]],
	},
	TRADE_REQUEST_CANCEL = {
	    Description = [[Unused. Was once used for canceling a confirmation dialog which would appear before initiating a trade offered by another character.]],
	},
	TRADE_SHOW = {
	    Description = [[Fires when a trade interaction with another character begins]],
	},
	TRADE_SKILL_CLOSE = {
	    Description = [[Fires when the player ends interaction with a trade skill recipe list]],
	},
	TRADE_SKILL_FILTER_UPDATE = {
	    Description = [[Fires when the search filter for a trade skill recipe list changes]],
	},
	TRADE_SKILL_SHOW = {
	    Description = [[Fires when the player begins interaction with a trade skill recipe list]],
	},
	TRADE_SKILL_UPDATE = {
	    Description = [[Fires when information about the contents of a trade skill recipe list changes or becomes available]],
	},
	TRADE_TARGET_ITEM_CHANGED = {
	    Description = [[Fires when the set of items offered for trade by the target changes]],
	    Signature = [[slotID]],
	    [[slotID  - The slot's ID that changed (1-7). (number) ]],
	},
	TRADE_UPDATE = {
	    Description = [[Fires when new information becomes available about a trade process underway with another character. Not used for most changes to the trade process (see other TRADE events for changes to items and money offered for trade by either party).]],
	},
	TRAINER_CLOSED = {
	    Description = [[Fires when the player ends interaction with a class or skill trainer]],
	},
	TRAINER_DESCRIPTION_UPDATE = {
	    Description = [[Fires when description information for the selected trainer service changes or becomes available]],
	},
	TRAINER_SHOW = {
	    Description = [[Fires when the player begins interaction with a class or skill trainer]],
	},
	TRAINER_UPDATE = {
	    Description = [[Fires when information about the contents of the trainer service list changes or becomes available]],
	},
	TUTORIAL_TRIGGER = {
	    Description = [[Fires when a contextual tutorial should be shown]],
	    Signature = [[id]],
	    [[id  - The id for the tutorial that needs to show. Valid values are between 1 and 51. (number) ]],
	},
	UI_ERROR_MESSAGE = {
	    Description = [[Fires when a game error message should be displayed. e.g. "You cannot attack that target", "Your pet is dead", "Your inventory is full"]],
	    Signature = [[message]],
	    [[message  - The message thats to be displayed. (string) ]],
	},
	UI_INFO_MESSAGE = {
	    Description = [[Fires when an informative message should be displayed. e.g. "No fish are hooked", "You must be at least level 80 and in a raid group to enter this instance"]],
	    Signature = [[message]],
	    [[message  - The message that needs to be displayed (string) ]],
	},
	UI_SCALE_CHANGED = {
	    Description = [[Fires when the UI scale changes]],
	},
	UNIT_ATTACK = {
	    Description = [[Fires when a unit's weapon (or standard melee attack damage) changes]],
	    Signature = [[unitID]],
	    [[unitID  - The unit that was affected. (string) ]],
	},
	UNIT_ATTACK_POWER = {
	    Description = [[Fires when a unit's attack power changes]],
	    Signature = [[unitID]],
	    [[unitID  - The unit that was affected. (string) ]],
	},
	UNIT_ATTACK_SPEED = {
	    Description = [[Fires when a unit's attack speed changes]],
	    Signature = [[unitID]],
	    [[unitID  - The unit that was affected. (string) ]],
	},
	UNIT_AURA = {
	    Description = [[Fires when a unit loses or gains a buff or debuff.. This event fires before the effect of the buff can be seen on the character. For example if the unit gains the Mark of the Wild buff, at the time this even fires their stats may not have updated to reflect the gain from the buff. If you wish to be notified when the buff effect is gained or lost, register for the event that tracks the attribute being affected (e.g. UNIT_STATS, UNIT_ATTACK_POWER).]],
	    Signature = [[unitID]],
	    [[unitID  - The unit that was affected. (string) ]],
	},
	UNIT_CLASSIFICATION_CHANGED = {
	    Description = [[Fires when a unit changes classification (e.g. if an elite unit becomes non-elite)]],
	    Signature = [[unitID]],
	    [[unitID  - The unit that was affected. (string) ]],
	},
	UNIT_COMBAT = {
	    Description = [[Fires when a unit takes or recovers from damage due to a combat effect]],
	    Signature = [[unitID, action, descriptor, damage, damageType]],
	    [[unitID  - The unit that was affected. (string) ]],
	    [[action  - The action type that happened, i.e. WOUND, DODGE, HEAL (string) ]],
	    [[descriptor  - A descriptor that describes the action, i.e. CRITICAL, CRUSHING (string) ]],
	    [[damage  - The ammount of damage or healing received (number) ]],
	    [[damageType  - The type of damage dealt.  Is 0(physical) for healing. (number) ]],
	},
	UNIT_COMBO_POINTS = {
	    Description = [[Fires when a unit scores combo points on its target]],
	},
	UNIT_CONNECTION = {
	    Description = [[Fires when the connection status for a unit has changed.]],
	    Signature = [[unitID, hasConnected]],
	    [[unitID  - The unit that was affected. (string) ]],
	    [[hasConnected  - Whether or not the unit has connected. (bool) ]],
	},
	UNIT_DAMAGE = {
	    Description = [[Fires when a unit's weapon damage changes.]],
	    Signature = [[unitID]],
	    [[unitID  - The unit that was affected. (string) ]],
	},
	UNIT_DEFENSE = {
	    Description = [[Fires when a unit's defense changes.]],
	    Signature = [[unitID]],
	    [[unitID  - The unit that was affected. (string) ]],
	},
	UNIT_DISPLAYPOWER = {
	    Description = [[Fires when a unit's primary power type (e.g. rage, energy, mana) changes. Occurs when a druid shapeshifts as well as in certain other cases.]],
	    Signature = [[unitID]],
	    [[unitID  - The unit that was affected. (string) ]],
	},
	UNIT_DYNAMIC_FLAGS = {
	    Description = [[Fires when certain unit attributes change. Attribute changes covered by this event include UnitIsCorpse() and UnitIsTapped().]],
	},
	UNIT_ENTERED_VEHICLE = {
	    Description = [[Fires when a unit has entered a vehicle]],
	},
	UNIT_ENTERING_VEHICLE = {
	    Description = [[Fires when a unit begins entering a vehicle. See UNIT_ENTERED_VEHICLE for when the vehicle boarding animation finishes.]],
	},
	UNIT_EXITED_VEHICLE = {
	    Description = [[Fires when a unit has exited a vehicle]],
	},
	UNIT_EXITING_VEHICLE = {
	    Description = [[Fires when a unit begins exiting a vehicle. See UNIT_EXITED_VEHICLE for when the vehicle exiting animation finishes.]],
	},
	UNIT_FACTION = {
	    Description = [[Fires when a unit's PvP status changes]],
	    Signature = [[unitID]],
	    [[unitID  - The unit that was affected. (string) ]],
	},
	UNIT_FLAGS = {
	    Description = [[Fires when certain combat statuses for a unit change (e.g. stunned, feared)]],
	    Signature = [[unit]],
	    [[unit  - The id of the affected unit. (string) ]],
	},
	UNIT_HEALTH = {
	    Description = [[Fires when a unit's health level changes]],
	    Signature = [[unitID]],
	    [[unitID  - The unit that was affected. (string) ]],
	},
	UNIT_INVENTORY_CHANGED = {
	    Description = [[Fires when the player (or inspected unit) equips or unequips items]],
	    Signature = [[unitID]],
	    [[unitID  - The unit that was affected. (string) ]],
	},
	UNIT_LEVEL = {
	    Description = [[Fires when a unit's character level changes]],
	    Signature = [[unitID]],
	    [[unitID  - The unit that was affected. (string) ]],
	},
	UNIT_MANA = {
	    Description = [[Fires when a unit's mana level changes]],
	    Signature = [[unitID]],
	    [[unitID  - The unit that was affected. (string) ]],
	},
	UNIT_MAXHEALTH = {
	    Description = [[Fires when a unit's maximum health changes]],
	    Signature = [[unitID]],
	    [[unitID  - The unit that was affected. (string) ]],
	},
	UNIT_MAXPOWER = {
	    Description = [[Fires when the max power of a unit changes]],
	},
	UNIT_MODEL_CHANGED = {
	    Description = [[Fires when a unit's 3D model changes (e.g. due to shapeshifting, being polymorphed, or equipping gear)]],
	    Signature = [[unitID]],
	    [[unitID  - The unit that was affected. (string) ]],
	},
	UNIT_NAME_UPDATE = {
	    Description = [[Fires when a unit's name is changed. Also fires when the client is first notified of a unit's name.]],
	    Signature = [[unitID]],
	    [[unitID  - The unit that was affected. (string) ]],
	},
	UNIT_PET = {
	    Description = [[Fires when a unit gains or loses a pet]],
	    Signature = [[unitID]],
	    [[unitID  - The unit that was affected. (string) ]],
	},
	UNIT_PET_EXPERIENCE = {
	    Description = [[Fires when the player's pet gains experience points]],
	},
	UNIT_PHASE = {
	    Description = [[Fires when a unit's phasing status changes. Used to know whether party members are not in the same phase as the player.]],
	},
	UNIT_PORTRAIT_UPDATE = {
	    Description = [[Fires when a unit's portrait changes (e.g. due to shapeshifting, being polymorphed, or equipping gear). Also fires when a unit's portrait changes from a generic race/gender image to one based on the unit's 3D model.]],
	    Signature = [[unitID]],
	    [[unitID  - The unit that was affected. (string) ]],
	},
	UNIT_POWER = {
	    Description = [[Fires when a unit's power level changes.]],
	    Signature = [[unitID, powerType]],
	    [[unitID  - The unit that was affected. (string) ]],
	    [[powerType  - 'MANA', 'RAGE', 'ENERGY', 'FOCUS', 'HAPPINESS', 'RUNIC&#95;POWER', 'HOLY&#95;POWER'. (string) ]],
	},
	UNIT_QUEST_LOG_CHANGED = {
	    Description = [[Fires when a unit's quests change (accepted/objective progress/abandoned/completed). This event will trigger both for your status changes, and that of others (when in a party/raid), and signifies that something has changed regarding the unit's current quests. This event triggering means that one of the following has occured: Accepted a new quest, abandoned an existing quest, achieved progress on the objectives of a quest, or completed (turned in) a quest.]],
	    Signature = [[unitID]],
	    [[unitID will be "player" when the event relates to you. This event is VERY reliable for players, and is the preferred event when you ONLY care about changes relating to the player's quests and don't care about all the other triggerings that come with using the player-only QUEST_LOG_UPDATE (that event should really only be used if you are writing a Quest Log replacement addon, as it triggers on many, many non-quest related things).]],
	    [[unitID will be partyX/raidX when the event relates to a party or raid member. However, this event is EXTREMELY unreliable for party and raid members, as it will ONLY trigger if you are at a very close range to them; and it will only trigger when they GAIN a quest (accepting) or LOSE a quest (abandon/turn in), meaning that you can't expect to use this event to monitor the quest status of other units, as you may be out of range when they accept or finish a quest (and then your client won't trigger this event and you won't know that they have a new quest/no longer has a certain quest). Also, even if they ARE in range it won't trigger for PROGRESS updates (such as finishing or achieving progress on certain objectives). It's best to just completely ignore that this event claims to be for other units, as its range limitation makes it useless for keeping an accurate look at other unit's quest state.]],
	    [[unitID  - The unit that was affected. (string) ]],
	},
	UNIT_RANGEDDAMAGE = {
	    Description = [[Fires when a unit's ranged attack damage changes. Also fires when a unit's ranged attack speed changes.]],
	    Signature = [[unitID]],
	    [[unitID  - The unit that was affected. (string) ]],
	},
	UNIT_RANGED_ATTACK_POWER = {
	    Description = [[Fires when a unit's ranged attack power changes]],
	    Signature = [[unitID]],
	    [[unitID  - The unit that was affected. (string) ]],
	},
	UNIT_RESISTANCES = {
	    Description = [[Fires when a unit's magic resistances change. Also seems to fire when a unit's armor value changes.]],
	    Signature = [[unitID]],
	    [[unitID  - The unit that was affected. (string) ]],
	},
	UNIT_SPELLCAST_CHANNEL_START = {
	    Description = [[Fires when a unit starts channeling a spell]],
	    Signature = [[unitID, spell, rank, lineID, spellID]],
	    [[unitID  - The unit that's casting. (string) ]],
	    [[spell  - The name of the spell that's being casted. (string) ]],
	    [[rank  - The rank of the spell that's being casted. (string) ]],
	    [[lineID  - Spell lineID counter. This number is always 0 for channels. (number) ]],
	    [[spellID  - The id of the spell that's being casted. (number, spellID) ]],
	},
	UNIT_SPELLCAST_CHANNEL_STOP = {
	    Description = [[Fires when a unit stops or cancels a channeled spell]],
	    Signature = [[unitID, spell, rank, lineID, spellID]],
	    [[unitID  - The unit that's casting. (string) ]],
	    [[spell  - The name of the spell that's being casted. (string) ]],
	    [[rank  - The rank of the spell that's being casted. (string) ]],
	    [[lineID  - Spell lineID counter. This number is always 0 for channels. (number) ]],
	    [[spellID  - The id of the spell that's being casted. (number, spellID) ]],
	},
	UNIT_SPELLCAST_CHANNEL_UPDATE = {
	    Description = [[Fires when a unit's channeled spell is interrupted or delayed]],
	    Signature = [[unitID, spell, rank, lineID, spellID]],
	    [[unitID  - The unit that's casting. (string) ]],
	    [[spell  - The name of the spell that's being casted. (string) ]],
	    [[rank  - The rank of the spell that's being casted. (string) ]],
	    [[lineID  - Spell lineID counter. This number is always 0 for channels. (number) ]],
	    [[spellID  - The id of the spell that's being casted. (number, spellID) ]],
	},
	UNIT_SPELLCAST_DELAYED = {
	    Description = [[Fires when a unit's spell cast is delayed]],
	    Signature = [[unitID, spell, rank, lineID, spellID]],
	    [[unitID  - The unit that's casting. (string) ]],
	    [[spell  - The name of the spell that's being casted. (string) ]],
	    [[rank  - The rank of the spell that's being casted. (string) ]],
	    [[lineID  - Spell lineID counter. The Nth spell that UNIT_SPELLCAST events have fired for. Unique to each spell cast - UNIT_SPELLCAST_START and UNIT_SPELLCAST_SUCCESS events referring to the same cast will have the same lineID. Resets to 0 when the count reaches 255, but this number may just always be 0 for some spells. (number) ]],
	    [[spellID  - The id of the spell that's being casted. (number, spellID) ]],
	},
	UNIT_SPELLCAST_FAILED = {
	    Description = [[Fires when a unit's spell cast fails]],
	    Signature = [[unitID, spell, rank, lineID, spellID]],
	    [[unitID  - The unit that's casting. (string) ]],
	    [[spell  - The name of the spell that's being casted. (string) ]],
	    [[rank  - The rank of the spell that's being casted. (string) ]],
	    [[lineID  - Spell lineID counter. The Nth spell that UNIT_SPELLCAST events have fired for. Unique to each spell cast - UNIT_SPELLCAST_START and UNIT_SPELLCAST_SUCCESS events referring to the same cast will have the same lineID. Resets to 0 when the count reaches 255, but this number may just always be 0 for some spells. (number) ]],
	    [[spellID  - The id of the spell that's being casted. (number, spellID) ]],
	},
	UNIT_SPELLCAST_FAILED_QUIET = {
	    Description = [[Fires when a unit's spell cast fails and no error message should be displayed. The default UI displays an error message when UNIT_SPELLCAST_FAILED fires; in some situations (e.g. if the player attempts to cast while mind controlled), this event is used instead, preventing an error message from being displayed while still notifying interested scripts of the failure.]],
	    Signature = [[unitID, spell, rank, lineID, spellID]],
	    [[unitID  - The unit that's casting. (string) ]],
	    [[spell  - The name of the spell that's being casted. (string) ]],
	    [[rank  - The rank of the spell that's being casted. (string) ]],
	    [[lineID  - Spell lineID counter. The Nth spell that UNIT_SPELLCAST events have fired for. Unique to each spell cast - UNIT_SPELLCAST_START and UNIT_SPELLCAST_SUCCESS events referring to the same cast will have the same lineID. Resets to 0 when the count reaches 255, but this number may just always be 0 for some spells. (number) ]],
	    [[spellID  - The id of the spell that's being casted. (number, spellID) ]],
	},
	UNIT_SPELLCAST_INTERRUPTED = {
	    Description = [[Fires when a unit's spell cast is interrupted]],
	    Signature = [[unitID, spell, rank, lineID, spellID]],
	    [[unitID  - The unit that's casting. (string) ]],
	    [[spell  - The name of the spell that's being casted. (string) ]],
	    [[rank  - The rank of the spell that's being casted. (string) ]],
	    [[lineID  - Spell lineID counter. The Nth spell that UNIT_SPELLCAST events have fired for. Unique to each spell cast - UNIT_SPELLCAST_START and UNIT_SPELLCAST_SUCCESS events referring to the same cast will have the same lineID. Resets to 0 when the count reaches 255, but this number may just always be 0 for some spells. (number) ]],
	    [[spellID  - The id of the spell that's being casted. (number, spellID) ]],
	},
	UNIT_SPELLCAST_INTERRUPTIBLE = {
	    Description = [[Fires when a unit's spell cast becomes interruptible again]],
	    Signature = [[unitID]],
	    [[unitID  - The unit who's casted spell has become interruptible again. (string, unitID) ]],
	},
	UNIT_SPELLCAST_NOT_INTERRUPTIBLE = {
	    Description = [[Fires when a unit's spell cast becomes uninterruptible]],
	    Signature = [[unitID]],
	    [[unitID  - The unit who's currently casting spell has cannot be interrupted. (string, unitID) ]],
	},
	UNIT_SPELLCAST_SENT = {
	    Description = [[Fires when a request to cast a spell (on behalf of the player or a unit controlled by the player) is sent to the server]],
	    Signature = [[unitID, spell, rank, target, lineID]],
	    [[unitID  - The unit that's casting. (string) ]],
	    [[spell  - The name of the spell that's being casted. (string) ]],
	    [[rank  - The rank of the spell that's being casted. (string) ]],
	    [[target  - The name of the target of your spell. (string) ]],
	    [[lineID  - Spell lineID counter. The Nth spell that UNIT_SPELLCAST events have fired for. Unique to each spell cast - UNIT_SPELLCAST_START and UNIT_SPELLCAST_SUCCESS events referring to the same cast will have the same lineID. Resets to 0 when the count reaches 255, but this number may just always be 0 for some spells. (number) ]],
	},
	UNIT_SPELLCAST_START = {
	    Description = [[Fires when a unit begins casting a spell]],
	    Signature = [[unitID, spell, rank, lineID, spellID]],
	    [[unitID  - The unit that's casting. (string) ]],
	    [[spell  - The name of the spell that's being casted. (string) ]],
	    [[rank  - The rank of the spell that's being casted. (string) ]],
	    [[lineID  - Spell lineID counter. The Nth spell that UNIT_SPELLCAST events have fired for. Unique to each spell cast - UNIT_SPELLCAST_START and UNIT_SPELLCAST_SUCCESS events referring to the same cast will have the same lineID. Resets to 0 when the count reaches 255, but this number may just always be 0 for some spells. (number) ]],
	    [[spellID  - The id of the spell that's being casted. (number, spellID) ]],
	},
	UNIT_SPELLCAST_STOP = {
	    Description = [[Fires when a unit stops or cancels casting a spell]],
	    Signature = [[unitID, spell, rank, lineID, spellID]],
	    [[unitID  - The unit that's casting. (string) ]],
	    [[spell  - The name of the spell that's being casted. (string) ]],
	    [[rank  - The rank of the spell that's being casted. (string) ]],
	    [[lineID  - Spell lineID counter. The Nth spell that UNIT_SPELLCAST events have fired for. Unique to each spell cast - UNIT_SPELLCAST_START and UNIT_SPELLCAST_SUCCESS events referring to the same cast will have the same lineID. Resets to 0 when the count reaches 255, but this number may just always be 0 for some spells. (number) ]],
	    [[spellID  - The id of the spell that's being casted. (number, spellID) ]],
	},
	UNIT_SPELLCAST_SUCCEEDED = {
	    Description = [[Fires when a unit's spell cast succeeds]],
	    Signature = [[unitID, spell, rank, lineID, spellID]],
	    [[unitID  - The unit that's casting. (string) ]],
	    [[spell  - The name of the spell that's being casted. (string) ]],
	    [[rank  - The rank of the spell that's being casted. (string) ]],
	    [[lineID  - Spell lineID counter. The Nth spell that UNIT_SPELLCAST events have fired for. Unique to each spell cast - UNIT_SPELLCAST_START and UNIT_SPELLCAST_SUCCESS events referring to the same cast will have the same lineID. Resets to 0 when the count reaches 255, but this number may just always be 0 for some spells. (number) ]],
	    [[spellID  - The id of the spell that's being casted. (number, spellID) ]],
	},
	UNIT_STATS = {
	    Description = [[Fires when a unit's primary attributes change. Primary attributes are Strength, Stamina, Agility, Intellect, and Spirit.]],
	    Signature = [[unitID]],
	    [[unitID  - The unit that's being affected by the event. (string) ]],
	},
	UNIT_TARGET = {
	    Description = [[Fires when a unit's target changes]],
	    Signature = [[unitID]],
	    [[unitID  - The unit that's being affected by the event. (string) ]],
	},
	UNIT_TARGETABLE_CHANGED = {
	    Description = [[Fires when the targetable status of a unit changes]],
	},
	UNIT_THREAT_LIST_UPDATE = {
	    Description = [[Fires when a non-player unit's threat list is updated]],
	},
	UNIT_THREAT_SITUATION_UPDATE = {
	    Description = [[Fires when a unit's threat state changes. Only fires when changes in the unit's general threat state (see UnitThreatSituation()) occur, not due to changes in the underlying threat values.]],
	},
	UPDATE_BATTLEFIELD_SCORE = {
	    Description = [[Fires when information for the battleground scoreboard changes or becomes available]],
	},
	UPDATE_BATTLEFIELD_STATUS = {
	    Description = [[Fires when the player's status in a battleground or queue changes]],
	},
	UPDATE_BINDINGS = {
	    Description = [[Fires when information about the player's key binding settings changes or becomes available]],
	},
	UPDATE_BONUS_ACTIONBAR = {
	    Description = [[Fires when information about the bonus action bar changes or becomes available. The bonus action bar is used for state-dependent sets of actions, such as those used for warrior stances, druid shapeshift forms, rogue stealth, and possession of other units; this event fires when entering such states.]],
	},
	UPDATE_CHAT_COLOR = {
	    Description = [[Fires when the color settings for chat message types are updated]],
	    Signature = [[type, red, green, blue]],
	    [[type  - Chat message type for which the color setting has changed (string) ]],
	    [[red  - Red component of the color (0.0 - 1.0) (number) ]],
	    [[green  - Green component of the color (0.0 - 1.0) (number) ]],
	    [[blue  - Blue component of the color (0.0 - 1.0) (number) ]],
	},
	UPDATE_CHAT_COLOR_NAME_BY_CLASS = {
	    Description = [[Fires when settings for per-class color-coding of character names in chat are updated]],
	},
	UPDATE_CHAT_WINDOWS = {
	    Description = [[Fires when saved chat window settings are loaded]],
	},
	UPDATE_EXHAUSTION = {
	    Description = [[Fires when the player's rest state or amount of rested XP changes]],
	},
	UPDATE_FACTION = {
	    Description = [[Fires when the contents of the reputation listing change or become available. Fires both for changes to the listing as displayed in the reputation UI (i.e. expanding or collapsing headers, moving factions to the Inactive group, or changing at-war status) and for changes to the player's reputation with any faction.]],
	},
	UPDATE_FLOATING_CHAT_WINDOWS = {
	    Description = [[Fires when chat window layout should be updated]],
	},
	UPDATE_GM_STATUS = {
	    Description = [[Fires when the player's GM ticket status (or ability to submit tickets) changes]],
	    Signature = [[avilable]],
	    [[avilable  - Is 1 if the gms are available, 0 if they are not. (number) ]],
	},
	UPDATE_INSTANCE_INFO = {
	    Description = [[Fires when information about instances to which the player is saved changes or becomes available]],
	},
	UPDATE_INVENTORY_ALERTS = {
	    Description = [[Fires when an equipped item's durability alert status changes. Only fires for changes affecting durability alert status (conditions displayed as red or yellow on the default UI's durability warning frame); for other changes to item durability levels, see UPDATE_INVENTORY_DURABILITY.]],
	},
	UPDATE_INVENTORY_DURABILITY = {
	    Description = [[Fires when an equipped item's durability changes]],
	},
	UPDATE_LFG_LIST = {
	    Description = [[Fires when results of a Looking for More query become available]],
	},
	UPDATE_LFG_LIST_INCREMENTAL = {
	    Description = [[Fires when results of a Looking for More query are updated]],
	},
	UPDATE_LFG_TYPES = {
	    Description = [[Fires when information about possible Looking for Group settings changes or becomes available]],
	},
	UPDATE_MACROS = {
	    Description = [[Fires when information about the player's macros changes or becomes available]],
	},
	UPDATE_MASTER_LOOT_LIST = {
	    Description = [[Fires when the contents of the master loot candidate list change or become available]],
	},
	UPDATE_MOUSEOVER_UNIT = {
	    Description = [[Fires when the mouse cursor moves over a visible unit. Fires both when mousing over units in the 3D world or when mousing over secure frames whose unit attribute refers to a unit in the player's area of interest.]],
	},
	UPDATE_MULTI_CAST_ACTIONBAR = {
	    Description = [[Fires when the contents of the multi-cast action bar change or become available. This action bar is currently used only for allowing shaman characters to place multiple totems at once.]],
	},
	UPDATE_PENDING_MAIL = {
	    Description = [[Fires when information about newly received mail messages (not yet seen at a mailbox) becomes available]],
	},
	UPDATE_SHAPESHIFT_COOLDOWN = {
	    Description = [[Fires when the cooldown begins or ends for an action on the stance/shapeshift bar]],
	},
	UPDATE_SHAPESHIFT_FORM = {
	    Description = [[Fires when the player's shapeshift form changes. Unlike other shapeshift-related events, this function refers specifically to shapeshifting -- therefore including some abilities which are not presented via the stance/shapeshift bar and excluding some which are. For example, applies to shaman Ghost Wolf form, druid shapeshifts, and some quest-related shapeshifting, but not warrior stances, paladin auras, or rogue stealth. This does fire for Death Knight presences, however.]],
	},
	UPDATE_SHAPESHIFT_FORMS = {
	    Description = [[Fires when the contents of the stance/shapeshift bar change or become available]],
	},
	UPDATE_SHAPESHIFT_USABLE = {
	    Description = [[Fires when an ability on the stance/shapeshift bar becomes usable or unusable. For example, the availability of druid aquatic, travel, and flight forms can change as the player moves around, as those forms are only usable when the player is swimming, outside, or in an area that allows flight.]],
	},
	UPDATE_STEALTH = {
	    Description = [[Fires when the player uses or cancels a stealth ability]],
	},
	UPDATE_TICKET = {
	    Description = [[Fires when information about an active GM ticket changes or becomes available]],
	},
	UPDATE_TRADESKILL_RECAST = {
	    Description = [[Fires for each cast when performing multiple casts of a trade skill recipe. Fires before each cast and when casting is canceled.]],
	},
	UPDATE_WORLD_STATES = {
	    Description = [[Fires when information for world state UI elements changes or becomes available. World State UI elements include PvP, instance, and quest objective information (displayed at the top center of the screen in the default UI) as well as more specific information for "control point" style PvP objectives. Examples: the Horde/Alliance score in Arathi Basin, the tower status and capture progress bars in Hellfire Peninsula, the progress text in the Black Morass and Violet Hold instances, and the event status text for quests The Light of Dawn and The Battle For The Undercity.]],
	},
	USE_BIND_CONFIRM = {
	    Description = [[Fires when the player attempts to use an item which will become soulbound in the process]],
	},
	USE_GLYPH = {
	    Description = [[Fires when the player begins to use a glyph. In the default UI, this event causes the glyph interface to open when the player right-clicks a glyph item, allowing quick targeting of a socket for the glyph.]],
	},
	VARIABLES_LOADED = {
	    Description = [[Fires when non-addon-specific saved variables are loaded. Addons should generally use ADDON_LOADED to determine whether their saved variables have loaded.]],
	},
	VEHICLE_ANGLE_SHOW = {
	    Description = [[Fires when controls for vehicle weapon pitch should be displayed]],
	},
	VEHICLE_ANGLE_UPDATE = {
	    Description = [[Fires when the player's vehicle weapon pitch changes]],
	},
	VEHICLE_PASSENGERS_CHANGED = {
	    Description = [[Fires when the list of passengers in the player's vehicle changes]],
	},
	VEHICLE_POWER_SHOW = {
	    Description = [[Fires when controls for vehicle weapon power should be displayed ]],
	},
	VEHICLE_UPDATE = {
	    Description = [[Fires when information about the player's vehicle changes or becomes available]],
	},
	VOICE_CHANNEL_STATUS_UPDATE = {
	    Description = [[Fires when voice-related status of a chat channel changes]],
	},
	VOICE_CHAT_ENABLED_UPDATE = {
	    Description = [[Fires when the client's voice chat feature is enabled or disabled]],
	},
	VOICE_LEFT_SESSION = {
	    Description = [[Fires when a voice-enabled member leaves a chat channel]],
	},
	VOICE_PLATE_START = {
	    Description = [[Fires when a channel member begins speaking in voice chat]],
	    Signature = [[name, unit]],
	    [[name  - The username of the player thats talking (string) ]],
	    [[unit  - The unit of the player thats talking, i.e. party1. (string) ]],
	},
	VOICE_PLATE_STOP = {
	    Description = [[Fires when a channel member finishes speaking in voice chat]],
	    Signature = [[name, unit]],
	    [[name  - The username of the player thats talking (string) ]],
	    [[unit  - The unit of the player thats talking, i.e. party1. (string) ]],
	},
	VOICE_PUSH_TO_TALK_START = {
	    Description = [[Fires when the "Push to Talk" key binding is activated]],
	},
	VOICE_PUSH_TO_TALK_STOP = {
	    Description = [[Fires when the "Push to Talk" key binding is deactivated]],
	},
	VOICE_SELF_MUTE = {
	    Description = [[Fires when the player's self mute setting changes]],
	},
	VOICE_SESSIONS_UPDATE = {
	    Description = [[Fires when information about a voice chat session changes or becomes available]],
	},
	VOICE_START = {
	    Description = [[Fires when a channel member begins speaking in voice chat]],
	    Signature = [[unit]],
	    [[unit  - The unit of the player thats talking, i.e. party1. (string) ]],
	},
	VOICE_STATUS_UPDATE = {
	    Description = [[Fires when a member of the player's group changes voice chat status]],
	},
	VOICE_STOP = {
	    Description = [[Fires when a channel member finishes speaking in voice chat]],
	    Signature = [[unit]],
	    [[unit  - The unit of the player thats talking, i.e. party1. (string) ]],
	},
	VOTE_KICK_REASON_NEEDED = {
	    Description = [[Fires when the player attempts to vote-kick another player and the game requests a reason]],
	},
	WEAR_EQUIPMENT_SET = {
	    Description = [[Fires when the player's current equipment set changes. The firing of this event indicates the moment when the player's "current equipment set" state (as returned by GetEquipmentSetInfo()) changes -- at that time, the process of equipping/unequipping the set's items may not yet be complete. ]],
	},
	WHO_LIST_UPDATE = {
	    Description = [[Fires when results of a Who query become available. Only fires if there are more than three results or if SetWhoToUI(1) was called before performing the query.]],
	},
	WORLD_MAP_UPDATE = {
	    Description = [[Fires when the contents of the world map change or become available]],
	},
	WORLD_STATE_UI_TIMER_UPDATE = {
	    Description = [[Fires when the state of a timer world state UI element changes or becomes available. World State UI elements include PvP, instance, and quest objective information (displayed at the top center of the screen in the default UI) as well as more specific information for "control point" style PvP objectives. Timer world state elements include the countdown between battles in Wintergrasp, the countdown between periods in which the PvP objectives in Terokkar Forest are available, and timers shown for the quests The Light of Dawn and The Battle For The Undercity.]],
	},
	WOW_MOUSE_NOT_FOUND = {
	    Description = [[This event fires when a man buttoned WoW mouse is not found, in response to a DetectWowMouse() function call]],
	},
	ZONE_CHANGED = {
	    Description = [[Fires when the player moves between subzones or other named areas. Only fired if ZONE_CHANGED_INDOORS or ZONE_CHANGED_NEW_AREA does not fire.]],
	},
	ZONE_CHANGED_INDOORS = {
	    Description = [[Fires when the player moves between areas and the "indoors/outdoors" status may have changed]],
	},
	ZONE_CHANGED_NEW_AREA = {
	    Description = [[Fires when the player moves between major zones or enters/exits an instance]],
	},
}