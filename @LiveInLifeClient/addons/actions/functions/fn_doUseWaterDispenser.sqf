
/*
    Filename:
        fn_doUseWaterDispenser.sqf
    Author:
        Vincent Heins
    Description:
        Actual Function to use a declared water dispenser.
    Params:
        (_this select 0) : _thirstAmount : <objNull> : amount of thirst to remove
    Result:
        <bool> : was the thirst removed?
*/

private _thirstAmount = param [0, 0, [0]];

try
{
	if !(call lilc_actions_fnc_canUseWaterDispenser) throw false;
	if (_thirstAmount == 0) throw true;

	[_thirstAmount] call lilc_food_fnc_changeThirst;
	["Du hast einen Becher mit Wasser getrunken."] call lilc_ui_fnc_hint; //STR_lilc_actions_ScriptText_dispenseredWater

	throw true;
}
catch
{
	_exception;
};
