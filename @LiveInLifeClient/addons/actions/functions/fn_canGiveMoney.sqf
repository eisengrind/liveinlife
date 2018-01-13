
/*
    Author(s):
        Vincent Heins
    
    Description:
        Checks if the given unit can receive money.

    Parameter(s):
        (_this select 0) : _unit : <objNull> : unit to give money to

    Result:
        <bool> : is unit a valid target to give money to?

    Example(s):
        (Example 1)
        private _canGiveMoney = ([player] call lilc_actinos_fnc_canGiveMoney);
*/

params [
    ["_unit", objNull, [objNull]]
];

(!(isNull _unit) && (isPlayer _unit));
