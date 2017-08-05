
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
    player groupChat str _this;
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;

    private _bankConfig = ([_bankName] call lilc_bank_fnc_getBankConfig);
    if (isNull _bankConfig) throw false;

    private _unitUID = (getPlayerUID _unit);
    private _accountID = (_unit getVariable ["lilc_accountID", 0]);
    if (_accountID <= 0) throw false;

    private _startAmount = getNumber(_bankConfig >> "startAmountPersonal");
    //4, 4, 4, 4
    private _hash = format["%1%2%3%4",
        getText(_bankConfig >> "hashPrefix"),
        ([2, false, false, true] call lilc_common_fnc_randomString),
        ([6, true, false, false] call lilc_common_fnc_randomString),
        ([([(str _accountID), 4] call KRON_StrRight), 4, "0"] call lilc_common_fnc_fillString)
    ];
//= TRANSID<string>, BANK<string>, AMOUNT<int>, STATUS<bool>, ID<int>
    ([(format["INSERT INTO BANK_ACCOUNT_DATA (ID, NAME, AMOUNT, ACCOUNTID, STATUS, HASH) VALUES (NULL, '""%1""', '%2', '%3', '%4', '%5')", _bankName, _startAmount, _accountID, 1, _hash])] call lils_database_fnc_query);
    private _bankAccount = ([(format["SELECT HASH, NAME, AMOUNT, STATUS, ID  FROM BANK_ACCOUNT_DATA WHERE ACCOUNTID = '%1' AND AND HASH = '%2'", _accountID, _hash])] call lils_database_fnc_fetchObjects);
    
    systemChat str (_bankAccount select 0);
    [[(_bankAccount select 0)], "lilc_bank_fnc_addAccount", _unit] call lilc_common_fnc_send;
} catch {
    _exception;
};
