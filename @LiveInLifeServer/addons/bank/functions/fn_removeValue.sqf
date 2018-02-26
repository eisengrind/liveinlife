
params [
    ["_bankAccountID", 0, [0]],
    ["_value", 0, [0]]
];

if (_bankAccountID <= 0) exitWith { false; };
if (_value < 0) exitWith { false; };

private _result = [];
_result = [format[
    "SELECT AMOUNT FROM BANK_ACCOUNT_DATA WHERE ID = %1",
    _bankAccountID
]] call lils_database_fnc_fetchObjects;

if ((count _result) <= 0) exitWith { false; };
_result = _result select 0;
if ((count _result) != 1) exitWith { false; };
private _amount = _result select 0;
if (_value > _amount) exitWith { false; };

[format[
    "UPDATE BANK_ACCOUNT_DATA SET AMOUNT = AMOUNT - %1 WHERE ID = %2 AND AMOUNT >= %1",
    _value,
    _bankAccountID
]] call lils_database_fnc_query;
true;
