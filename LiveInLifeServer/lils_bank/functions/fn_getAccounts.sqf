
private _unit = param [0, ObjNull, [ObjNull]];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    
    private _result = [];
    _result = [(format["SELECT QUOTE(HASH), NAME, AMOUNT, STATUS, ID FROM BANK_ACCOUNT_DATA WHERE ACCOUNTID = '%1' AND STEAM64ID = '%2'", (_unit getVariable ["lilc_accountID", 0]), (getPlayerUID _unit)])] call lils_database_fnc_fetchObjects;

    [[_result], "lilc_bank_fnc_setAccounts", _unit] call lilc_common_fnc_send;
} catch {
    _exception;
};
