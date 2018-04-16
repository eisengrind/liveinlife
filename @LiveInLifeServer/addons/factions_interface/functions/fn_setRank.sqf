
params [
    ["_rankID", 0, [0]],
    ["_rankName", "", [""]],
    ["_rankTag", "", [""]],
    ["_rankInsignia", "", [""]],
    ["_rankPaycheck", 0, [0]],
    ["_rankItems", [], [[]]],
    ["_rankPermissions", [], [[]]],
    ["_rankVehicles", [], [[]]]
];

if (_rankID <= 0) exitWith {};
if (_rankPaycheck < 0) exitWith {};

private _rank = [[
    "faction_ranks",
    [
        ["rid"],
        ["name"],
        ["tag"],
        ["paycheck"],
        ["insignia"],
        ["permissions"],
        ["items"],
        ["vehicles"]
    ],
    [
        ["rid", _rankID]
    ]
] call lils_database_fnc_generateFetchQuery] call lils_database_fnc_fetchObjects;

if ((count _rank) <= 0) exitWith {};
_rank = _rank select 0;

_rank set [5, [_rank select 5] call lils_common_fnc_arrayDecode];
_rank set [6, [_rank select 6] call lils_common_fnc_arrayDecode];
_rank set [7, [_rank select 7] call lils_common_fnc_arrayDecode];

if (_rank isEqualTo [_rankID, _rankName, _rankTag, _rankPaycheck, _rankInsignia, _rankPermissions, _rankItems, _rankVehicles]) exitWith {};

[[
    "faction_ranks",
    [
        ["name", str _rankName],
        ["tag", str _rankTag],
        ["paycheck", str _rankPaycheck],
        ["insignia", str _rankInsignia],
        ["vehicles", [_rankVehicles] call lils_common_fnc_arrayEncode],
        ["items", [_rankItems] call lils_common_fnc_arrayEncode],
        ["permissions", [_rankPermissions] call lils_common_fnc_arrayEncode],
        ["timestamp_update", "UNIX_TIMESTAMP(NOW())", false]
    ],
    [
        ["rid", _rankID]
    ]
] call lils_database_fnc_generateUpdateQuery] call lils_database_fnc_query;

private _rankVariable = format["lilc_factions_interface_ranks_%1", _rankID];
missionNamespace setVariable [_rankVariable, [_rankID, _rankName, _rankTag, _rankPaycheck, _rankInsignia, _rankPermissions, _rankItems, _rankVehicles]];
publicVariable _rankVariable;
