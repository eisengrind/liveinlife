
params [
    ["_factionID", -1, [0]],
    ["_rankName", "", [""]],
    ["_rankTag", "", [""]],
    ["_rankInsignia", "", [""]],
    ["_rankPaycheck", 0, [0]],
    ["_rankItems", [], [[]]],
    ["_rankPermissions", [], [[]]],
    ["_rankVehicles", [], [[]]]
];

if (_factionID <= -1) exitWith {};

[[
    "faction_ranks",
    [
        ["fid", _factionID],
        ["name", str _rankName],
        ["tag", str _rankTag],
        ["description", """"""],
        ["vehicles", [_rankVehicles] call lils_common_fnc_arrayEncode],
        ["items", [_rankItems] call lils_common_fnc_arrayEncode],
        ["permissions", [_rankPermissions] call lils_common_fnc_arrayEncode],
        ["insignia", str _rankInsignia],
        ["paycheck", _rankPaycheck],
        ["timestamp_add", "UNIX_TIMESTAMP(NOW())", false],
        ["timestamp_update", "UNIX_TIMESTAMP(NOW())", false]
    ]
] call lils_database_fnc_generateInsertQuery] call lils_database_fnc_fetchObjects;

//[_rankID, _rankName, _rankTag, _rankPaycheck, _rankInsignia, _rankPermissions, _rankItems, _rankVehicles]
private _rank = [format[
    "SELECT rid FROM faction_ranks WHERE fid = %1 AND name = '%2' AND tag = '%3' AND insignia = '%4' ORDER BY rid DESC LIMIT 1",
    _factionID,
    str _rankName,
    str _rankTag,
    str _rankInsignia
]] call lils_database_fnc_fetchObjects;

if ((count _rank) <= 0) exitWith {};
_rank = _rank select 0;

if ((count _rank) != 1) exitWith {};
private _rankID = _rank select 0;

private _rankVariable = format["lilc_factions_interface_ranks_%1", _rankID];
missionNamespace setVariable [_rankVariable, [_rankID, _rankName, _rankTag, _rankPaycheck, _rankInsignia, _rankPermissions, _rankItems, _rankVehicles]];
publicVariable _rankVariable;
