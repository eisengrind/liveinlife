
/*
    Filename:
        fn_canUseWaterDispenser.sqf
    Author:
        Vincent Heins
    Description:
        Checks if the player is able to use a water dispenser (or any object).
    Params:
        (_this select 0) : _object : <objNull> : object to check for water "dispension"
    Result:
        <bool> : can the object be used as water dispenser?
*/

private _object = param [0, objNull, [objNull]];

try
{
	if (isNull _object) throw false;
	if !(simulationEnabled _object) throw false;
	if !(["lilc_waterDispenserActive", "BOOL", true] call lilc_common_fnc_getSetting) throw false;

	throw true;
}
catch
{
	_exception;
};
