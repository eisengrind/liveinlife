
private _unit = param [0, objNull, [objNull]];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if !(call lilc_pcard_fnc_havePersonalcard) throw false;
    if !([player] call lilc_common_fnc_isAlive) throw false;

    throw true;
} catch {
    _exception;
};
