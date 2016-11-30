
params [
    ["_unit", ObjNull, [ObjNull]],
    ["_balance", 0, [0]]
];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if (_balance <= 0) throw false;

    [_unit, _balance] call lilc_cash_fnc_add;

    _unitNameInfo = [_unit] call lilc_login_fnc_getNameInfo;
    hint parseText format["Du hast %1 %2 <t color='#26EB29'>%3%4</t> gegeben!", (_unitNameInfo select 0), (_unitNameInfo select 1), _balance, lilc_cash_fnc_sign];
} catch {
    _exception;
};
