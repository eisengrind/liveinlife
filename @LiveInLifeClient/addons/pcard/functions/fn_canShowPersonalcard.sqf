
private _unit = param [0, objNull, [objNull]];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if !(call lilc_pcard_fnc_havePersonalcard) throw false;

    throw true;
} catch {
    _exception;
};
