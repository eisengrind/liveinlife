
params [
    ["_unit", ObjNull, [ObjNull]],
    ["_accountID", ObjNull, [ObjNull]]
];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if (_accountID <= 0) throw false;
    if (_accountID != (player getVariable ["lilc_accountID", 0])) throw false;

    private _result = [];
    _result = [(format["SELECT TOWNCODE, TOWN, STREET, STREETNUMBER, AGE, EYECOLOR, HAIRCOLOR FROM PERSONALCARD_DATA WHERE STEAM64ID = '%1' AND ACCOUNTID = '%1'", (getPlayerUID _unit), _accountID])] call lils_database_fnc_fetchObjects;

    [[_result], "lilc_pcard_fnc_set", _unit] call lilc_common_fnc_send;
    throw true;
} catch {
    _exception;
};
