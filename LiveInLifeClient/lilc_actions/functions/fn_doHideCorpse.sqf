
/*
    Filename:
        fn_hideCorpse.sqf
    Author:
        Vincent Heins
    Description:
        Hides a given corpse with hideCorpse-command.
    Params:
        (_this select 0) : _corpse : <objNull> : corpse object
    Result:
        <bool> : whether the corpse was removed or not
*/

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
