
/*
    Filename:
        fn_groupChat.sqf
    Author:
        Vincent Heins
    Description:
        Logs input message and modname to logfile. Timestamp will be added too (time since the mission itself is started).
    Param(s):
        (_this select 0) : message to log : <STRING>
		(optional)(_this select 1) : modname to log : <STRING>
		(optional)(_this select 2) : priority type - 0 = normal, 1 = warning, 2 = error : <SCALAR/INT>
    Result(s):
        -
*/

params [
    ["_message", "", [""]],
    ["_modName", "", [""]],
    ["_type", "NORMAL", [""]]
];

if !(_modName == "") then { _modName = format["[%1]", _modName]; };
private _user = (if (isDedicated && isServer) then { "LiveInLifeServer"; } else { "LiveInLifeClient"; });

player groupChat (format[
	"[%1]%2[%3][%4]: %5",
	_user,
	_modName,
	([(if (isMultiplayer) then { serverTime; } else { time; })] call BIS_fnc_secondsToString),
	_type,
	_message
]);
