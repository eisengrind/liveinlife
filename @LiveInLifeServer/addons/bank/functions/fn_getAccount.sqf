
params [
    ["_accountID", 0, [0]],
    ["_bank", "", [""]]
];

if (_accountID <= 0) exitWith { []; };
if (isNull ([_bank] call lilc_bank_fnc_getBankConfig)) exitWith { []; };

private _result = [];
_result = [format[
    "SELECT * FROM BANK_ACCOUNT_DATA WHERE ACCOUNTID = %1 AND NAME = %2",
    _accountID,
    _bank
]] call lils_database_fnc_fetchObjects;

if ((count _result) <= 0) exitWith { []; };
_result = _result select 0;
if ((count _result) <= 0) exitWith { []; };
(_result select 0);
