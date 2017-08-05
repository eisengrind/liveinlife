
/*
    Filename:
        fn_doGiveMoney.sqf
    Author:
        Vincent Heins
    Description:
        Create the dialog to give money to a given unit. It also checks, if the given unit is valid.
    Params:
        (_this select 0) : _unit : <objNull> : unit to give money to
    Result:
        <bool> : was the money given?
*/

private _unit = param [0, objNull, [objNull]];

try {
    lilc_actions_target = _unit;
    if !([lilc_actions_target] call lilc_actions_fnc_canGiveMoney) throw false;

    createDialog "lilcm_actions_giveMoney";
    if (isNull (findDisplay 1550)) throw false;

    ctrlSetText [1551, format["Betrag an %1:", (if ([lilc_actions_target] call lilc_login_fnc_unitIsKnown) then { format["%1 %2", ((lilc_actions_target getVariable ["lilc_identity", []]) select 1), ((lilc_actions_target getVariable ["lilc_identity", []]) select 2)]; } else { """Unbekannt"""; })]];
	throw true;
} catch {
    _exception;
};

// gender, firstname, lastname, plz, town, street, streetnumber, age, eyecolor, haircolor
