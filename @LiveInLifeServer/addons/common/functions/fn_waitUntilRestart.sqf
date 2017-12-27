
scriptName "\x\lils\addons\common\functions\waitUntilServerStop";
private _restartTimeout = (["restartTimeout", "NUMBER", 0] call lilc_common_fnc_getSetting);
if (_restartTimeout <= 0) exitWith {};
_restartTimeout = (time + _restartTimeout);

[
	lils_common_fnc_stopServer,
	0,
	_restartTimeout
] call CBA_fnc_waitAndExecute;
