
params [
    ["_rankID", 0, [0]],
    ["_rankName", "", [""]],
    ["_rankTag", "", [""]],
    ["_rankPriority", 0, [0]],
    ["_rankInsignia", "", [""]],
    ["_permissionList", [], [[]]],
    ["_equipmentList", [], [[]]],
    ["_vehicleList", [], [[]]]
];

try {
    if (_rankID <= 0) throw false;
    if (isNil "_rankName") throw false;

    [(format["UPDATE FACTION_RANK_DATA SET NAME = '%1', TAG = '%2', VEHICLES = '%3', EQUIPMENT = '%4', PERMISSIONS = '%5', PRIORITY = '%6', INSIGNIA = '%7' WHERE ID = '%8'", _rankName, _rankTag, ([_vehicleList] call lils_common_fnc_arrayEncode), ([_equipmentList] call lils_common_fnc_arrayEncode), ([_permissionList] call lils_common_fnc_arrayEncode), _rankInsignia, _rankID])] call lils_database_fnc_query;

    call lils_factionsInterface_fnc_broadcastRanks;
} catch {
    _exception;
};
