
params [
    ["_unit", ObjNull, [ObjNull]],
    ["_bankAccounts", [], [[]]]
];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if ((count _bankAccounts) <= 0) throw false;

    private _query = "";
    private _accountID = (_unit getVariable ["lilc_accountID", 0]);
    if (_accountID <= 0) throw false;
    
    {
        //QUOTE(HASH), NAME, AMOUNT, STATUS, ID
        _query = (_query + ([
            "BANK_ACCOUNT_DATA",
            [
                ["AMOUNT", (_x select 2)]
            ],
            [
                ["HASH", (_x select 0)],
                ["ID", (_x select 4)],
                ["ACCOUNTID", _accountID],
                ["NAME", (str (_x select 1))]
            ]
        ] call lils_database_fnc_generateUpdateQuery));
    } forEach _bankAccounts;

    if (isNil "_query") throw false;

    [_query] call lils_database_fnc_query;
} catch {
    _exception;
};
