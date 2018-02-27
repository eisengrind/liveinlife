
params [
    ["_unit", objNull, [objNull]],
    ["_bankAccountID", 0, [0]],
    ["_value", 0, [0]]
];

try {
    if (isNull _unit) throw false;
    if (_bankAccountID <= 0) throw false;
    if (_value == 0) throw true;

    if !([_bankAccountID, _value] call lils_bank_fnc_removeValue) throw false;

    throw true;
} catch {
    [[_exception, _value], "lilc_atm_fnc_callback_disburse", _unit] call lilc_common_fnc_send;
};
