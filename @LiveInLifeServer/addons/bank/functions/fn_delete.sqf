
params [
    ["_unit", objNull, [objNull]],
    ["_bankAccountID", 0, 0]
];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if (_bankAccountID <= 0) throw false;

    [(format["DELETE FROM BANK_ACCOUNT_DATA WHERE ACCOUNTID = '%1' AND STEAM64ID = '%2' AND ID = '%3' LIMIT 1", (_unit getVariable ["lilc_accountID", 0]), (getPlayerUID _unit), _bankAccountID])] call lils_database_fnc_query;
    throw true;
} catch {
    _exception;
};
