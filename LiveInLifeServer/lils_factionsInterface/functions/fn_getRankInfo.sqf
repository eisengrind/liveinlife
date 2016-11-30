
params [
    ["_unit", ObjNull, [ObjNull]],
    ["_rankID", 0, [0]]
];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if !(alive _unit) throw false;

    if (_rankID <= 0) throw false;
    private _factionID = (_unit getVariable ["lilc_factionID", -1]);
    if (_factionID <= -1) throw false;

    private _result = [(format["SELECT PERMISSIONS, EQUIPMENT, VEHICLES FROM FACTION_RANK_DATA WHERE ID = '%1' AND FACTIONID = '%2'", _rankID, _factionID])] call lils_database_fnc_fetchObjects;
    _result = (_result select 0);

    [[_result], "lilc_factionsInterface_fnc_setRankInfo", _unit] call lilc_common_fnc_send;
} catch {
    _exception;
};
