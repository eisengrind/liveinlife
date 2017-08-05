
/*
    Filename:
        fn_canGiveMoney.sqf
    Author:
        Vincent Heins
    Description:
        Checks if the given unit can receive money.
    Params:
        (_this select 0) : _unit : <objNull> : unit to give money to
    Result:
        <bool> : is unit a valid target to give money to?
*/

private _unit = param [0, objNull, [objNull]];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;

    throw true;
} catch {
    _exception;
};
