
params [
    ["_unit", ObjNull, [ObjNull]],
    ["_bankAccounts", [], [[]]]
];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if ((count _bankAccounts) <= 0) throw false;

    private _unitUID = (getPlayerUID _unit);
    private _query = "";
    private _accountID = (_unit getVariable ["lilc_accountID", 0]);
    if (_accountID <= 0) throw false;
    
    {
        _query = (_query + (format["UPDATE BANKACCOUNT_DATA SET AMOUNT = '%1' WHERE BANKID = '%1' AND ID = '%2', AND STEAM64ID = '%3' AND ACCOUNTID = '%4'; ",  (_x select 1), (_x select 0), _unitUID, _accountID]));
    } forEach _bankAccounts;

    if (isNil "_query") throw false;

    [_query] call lils_database_fnc_query;
} catch {
    _exception;
};
