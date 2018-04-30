
params [
    ["_unit", objNull, [objNull]],
    ["_rankID", 0, [0]]
];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if (_rankID <= 0) throw false;
    
    [(format["DELETE FROM FACTION_RANK_DATA WHERE ID = '%1' LIMIT 1", _rankID])] call lils_database_fnc_query;
    call lils_factionsInterface_fnc_broadcastRanks;
    sleep 0.5;
    [_unit] call lils_factionsInterface_fnc_getPlayers;
    throw true;
} catch {
    _exception;
};
