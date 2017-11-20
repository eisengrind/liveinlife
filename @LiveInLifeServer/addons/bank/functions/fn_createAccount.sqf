
/*
    Filename:
        fn_createAccount.sqf
    Author:
        Vincent Heins
    Description:
        Adds a bankaccount to player and database.
    Param(s):
        0 - the sender object - <objNull>
        1 - the bank-configname - <string>
        2 - the account type - <integer/scalar>(0-1)
    Result(s):
        -
        (sends accountinfo back to sender object)
*/

params [
    ["_unit", objNull, [objNull]],
    ["_bankName", "", [""]]
];

try {
    if (isNull _unit) throw [];
    if !(isPlayer _unit) throw [];

    private _bankConfig = ([_bankName] call lilc_bank_fnc_getBankConfig);
    if (isNull _bankConfig) throw [];

    private _unitUID = (getPlayerUID _unit);
    private _accountID = (_unit getVariable ["lilc_accountID", 0]);
    if (_accountID <= 0) throw [];

    private _startAmount = getNumber(_bankConfig >> "startAmountPersonal");
    private _hash = format["%1%2%3%4",
        getText(_bankConfig >> "hashPrefix"),
        ([2, false, false, true] call lilc_common_fnc_randomString),
        ([6, true, false, false] call lilc_common_fnc_randomString),
        ([([(str _accountID), 4] call KRON_StrRight), 4, "0"] call lilc_common_fnc_fillString)
    ];
    
    ([(format["INSERT INTO BANK_ACCOUNT_DATA (ID, NAME, AMOUNT, ACCOUNTID, STATUS, HASH) VALUES (NULL, '""%1""', '%2', '%3', '%4', '%5')", _bankName, _startAmount, _accountID, 1, _hash])] call lils_database_fnc_query);
    uiSleep 0.5;
    private _bankAccount = ([(format["SELECT QUOTE(HASH), NAME, AMOUNT, STATUS, ID FROM BANK_ACCOUNT_DATA WHERE ACCOUNTID = '%1' AND HASH = '%2'", _accountID, _hash])] call lils_database_fnc_fetchObjects);
    
    throw (_bankAccount select 0);
} catch {
    _exception;
};
