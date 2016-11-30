
private _unit = param [0, ObjNull, [ObjNull]];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit ) throw false;
    
    private _result = [];
    _result = [(format["SELECT ID, BANKID, AMOUNT, TYPE FROM BANKACCOUNT_DATA WHERE ACCOUNTID = '%1' AND STEAM64ID = '%2'", (_unit getVariable ["lilc_accountID", []]), (getPlayerUID _unit)])] call lils_database_fnc_fetchObjects;

    [[_result], "lilc_bank_fnc_setBankAccounts", _unit] call lilc_common_fnc_send;
} catch {
    _exception;
};
