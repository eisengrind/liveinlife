
/*
    Filename:
        fn_setStaticPosition.sqf
    Author:
        Vincent Heins
    Description:
        Sets the player to a static position declared in CfgStaticPositions.
    Param(s):
        (_this select 0) : config name of the position : <STRING>
    Result(s):
        true = success; false != true : <BOOL>
*/

private _configName = param [0, "", [""]];

try {
	private _posDir = ([_configName] call lilc_common_fnc_getDynamicPosition);
	if ((count _posDir) != 2) throw false;
	
	player setPosASL (_posDir select 0);
	player setDir (_posDir select 1);
} catch {
	_exception;
};
