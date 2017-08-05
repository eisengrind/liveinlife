
scriptName "\x\lils\addons\common\functions\waitUntilRestart";
private _restartTimeout = (["restartTimeout", "NUMBER", 0] call lilc_common_fnc_getSetting);
if (_restartTimeout <= 0) exitWith {};
_restartTimeout = (time + _restartTimeout);

waitUntil { (_restartTimeout < time) };
call lils_common_fnc_restartServer;
