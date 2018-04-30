
params [
    ["_unit", objNull, [objNull]],
    ["_bankAccountID", 0, 0]
];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if (_bankAccountID <= 0) throw false;

    [(format["DELETE FROM BANK_ACCOUNT_DATA WHERE steamid64 = '%1' AND ID = '%2' LIMIT 1", (getPlayerUID _unit), _bankAccountID])] call lils_database_fnc_query;
    throw true;
} catch {
    _exception;
};
