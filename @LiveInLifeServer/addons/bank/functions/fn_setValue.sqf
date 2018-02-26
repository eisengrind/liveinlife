
params [
    ["_bankAccountID", 0, [0]],
    ["_value", 0, [0]]
];

if (_bankAccountID <= 0) exitWith { false; };
if (_value < 0) exitWith { false; };

[format[
    "UPDATE BANK_ACCOUNT_DATA SET AMOUNT = %1 WHERE ID = %2",
    _value,
    _bankAccountID
]] call lils_database_fnc_query;
true;
