
private _unit = param [0, ObjNull, [ObjNull]];

try {
    if (isNull _unit) throw false;
    if ((_unit getVariable ["lilc_factionID", 0]) <= -1) throw false;
    private _accountID = _unit getVariable ["lilc_accountID", 0];
    if (_accountID <= 0) throw false;
    _unitUID = (getPlayerUID _unit);

    private _result = [];
    _result = [(format["SELECT RANKID FROM FACTION_PLAYER_DATA WHERE STEAM64ID = '%1' AND ACCOUNTID = '%2'", _unitUID, _accountID])] call lils_database_fnc_fetchObjects;
    if ((count _result) <= 0) then {
        _result = [[0]];
        [(format["INSERT INTO FACTION_PLAYER_DATA (ID, STEAM64ID, ACCOUNTID, EQUIPMENT, VEHICLES, PERMISSIONS, RANKID) VALUES (NULL, '%1', '%2', '""[]""', '""[]""', '""[]""', '0')", _unitUID, _accountID])] call lils_database_fnc_query;
    };
    if ((count (_result select 0)) != 1) throw false;

    _unit setVariable ["lilc_factionRankID", ((_result select 0) select 0), true];
} catch {
    _exception;
};
