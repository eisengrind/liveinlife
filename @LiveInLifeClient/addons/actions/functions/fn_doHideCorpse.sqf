/* ----------------------------------------------------------------------------
Function: lilc_actions_fnc_doHideCorpse
Scope: public

Description:
    Is literally just an alias to `hideBody` from ArmA 3.

Parameters:
    _corpse - The corpse which will shall be invisible. <OBJECT>

Returns:
    true or false whether the corpse was removed. <BOOL>

Examples:
    (begin example)
    (end)

Author:
    TheMysteriousVincent
---------------------------------------------------------------------------- */

private _corpse = param [0, ObjNull, [ObjNull]];

try {
    if (isNull _corpse) throw false;
    if (alive _corpse) throw false;
    if ((_corpse getVariable ["lilc_bodyHided", false])) throw false;

    //TODO: Insert animation for hiding the corpse...

    hideBody _corpse;
    _corpse setVariable ["lilc_bodyHided", true, true];
    throw true;
} catch {
    _exception;
};
