
params [
    ["_accountID", 0, [0]],
    ["_bank", "", [""]]
];

if (_accountID <= 0) exitWith { []; };
if (isNull ([_bank] call lilc_bank_fnc_getBankConfig)) exitWith { []; };

private _result = [];
_result = [format[
    "SELECT ID, NAME, AMOUNT, ACCOUNTID, STATUS, QUOTE(HASH) FROM BANK_ACCOUNT_DATA WHERE ACCOUNTID = %1 AND NAME = '%2'",
    _accountID,
    (str _bank)
]] call lils_database_fnc_fetchObjects;

if (_result isEqualType false) exitWith { []; };
if ((count _result) <= 0) exitWith { []; };
(_result select 0);
