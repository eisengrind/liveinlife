/* ----------------------------------------------------------------------------
Function: lilc_actions_fnc_doGiveMoney
Scope: public

Description:
    Sends money to a target _unit.

Parameters:
    _unit - The unit to send money to. <OBJECT>

Returns:
    true or false wether the money was given to _unit <BOOL>

Examples:
    (begin example)
    (end)

Author:
    TheMysteriousVincent
---------------------------------------------------------------------------- */

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
