
params [
    ["_unit", objNull, [objNull]],
    ["_data", [], [[]]]
];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if ((count _data) != 10) throw false;
    
    [_unit] call lilc_login_fnc_addKnow;
    [true, _data] call lilc_pcard_fnc_watchPersonalcard;
} catch {
    _exception;
};
