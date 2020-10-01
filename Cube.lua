--========================================================--
--                Cube - InGame Dev Tools                 --
--                                                        --
-- Author      :  kurapica125@outlook.com                 --
-- Create Date :  2020/09/22                              --
--========================================================--

--========================================================--
Scorpio           "Cube"                                  ""
--========================================================--

-------------------------------------------
-- Logger
-------------------------------------------
local logger                    = Logger()
logger:AddHandler(print)

logger:SetPrefix(Logger.LogLevel.Trace, Color.GRAY   .. "[" .. _Locale["Trace"] .."]" .. Color.CLOSE)
logger:SetPrefix(Logger.LogLevel.Debug, Color.WHITE  .. "[" .. _Locale["Debug"] .."]" .. Color.CLOSE)
logger:SetPrefix(Logger.LogLevel.Info,  Color.GREEN  .. "[" .. _Locale["Info"] .."]"  .. Color.CLOSE)
logger:SetPrefix(Logger.LogLevel.Warn,  Color.ORANGE .. "[" .. _Locale["Warn"] .."]"  .. Color.CLOSE)
logger:SetPrefix(Logger.LogLevel.Error, Color.RED 	 .. "[" .. _Locale["Error"] .."]" .. Color.CLOSE)
logger:SetPrefix(Logger.LogLevel.Fatal, Color.DIMRED .. "[" .. _Locale["Fatal"] .."]" .. Color.CLOSE)

Trace                           = logger[Logger.LogLevel.Trace]
Debug                           = logger[Logger.LogLevel.Debug]
Info                            = logger[Logger.LogLevel.Info]
Warn                            = logger[Logger.LogLevel.Warn]
Error                           = logger[Logger.LogLevel.Error]
Fatal                           = logger[Logger.LogLevel.Fatal]

-------------------------------------------
-- Key Binding
-------------------------------------------
_G.BINDING_HEADER_CUBE 			= _Locale["Cube"]
_G.BINDING_NAME_CUBE_CODE 		= _Locale["Code Editor"]
_G.BINDING_NAME_CUBE_BUGLIST 	= _Locale["Bug List"]
_G.BINDING_NAME_CUBE_DEBUG 		= _Locale["Debug Tool"]

-------------------------------------------
-- Addon Events
-------------------------------------------
function OnLoad(self)
    _SVDB = SVManager("CubeSave")
end