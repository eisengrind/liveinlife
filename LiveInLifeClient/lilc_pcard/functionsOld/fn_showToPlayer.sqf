
private _unit = param [0, ObjNull, [ObjNull]];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;

    [[_unit], "lilc_pcard_fnc_show", _unit] call lilc_common_fnc_send;
} catch {
    _exception;
};
