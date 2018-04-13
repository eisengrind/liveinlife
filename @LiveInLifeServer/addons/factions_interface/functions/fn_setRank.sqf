
params [
    ["_unit", objNull, [objNull]],
    ["_rankID", 0, [0]],
    ["_rankName", "", [""]],
    ["_rankTag", "", [""]],
    ["_rankInsignia", "", [""]],
    ["_rankPaycheck", 0, [0]],
    ["_rankItems", [], [[]]],
    ["_rankPermissions", [], [[]]],
    ["_rankVehicles", [], [[]]]
];

if (isNull _unit) exitWith {};
if (_rankID <= 0) exitWith {};
if (_rankPaycheck < 0) exitWith {};

private _factionID = _unit getVariable ["lilc_factionID", -1];
if (_factionID <= -1) exitWith {};

//faction_ranks = rid, fid, name, tag, description, vehicles, items, permissions, paycheck, insignia
private _rank = [[
    "faction_ranks",
    [
        ["rid"],
        ["name"],
        ["tag"],
        ["paycheck"],
        ["insignia"],
        ["description"],
        ["vehicles"],
        ["items"],
        ["permissions"]
    ],
    [
        ["rid", _rankID]
    ]
] call lils_database_fnc_generateFetchQuery] call lils_database_fnc_fetchObjects;

if ((count _rank) <= 0) exitWith {};

_rank set [6, [_rank select 6] call lils_common_fnc_arrayDecode];
_rank set [7, [_rank select 7] call lils_common_fnc_arrayDecode];
_rank set [8, [_rank select 8] call lils_common_fnc_arrayDecode];

//rank = [<id>, <name>, <tag>, <paycheck>, <insignia>];
if ((_rank select [0, 5]) isEqualTo [_rankID, _rankName, _rankTag, _rankPaycheck, _rankInsignia]) exitWith {};

[[
    "faction_ranks",
    [
        ["name", str _rankName],
        ["tag", str _rankTag],
        ["paycheck", str _rankPaycheck],
        ["insignia", str _rankInsignia],
        ["vehicles", [_rankVehicles] call lils_common_fnc_arrayEncode],
        ["items", [_rankItems] call lils_common_fnc_arrayEncode],
        ["permissions", [_rankPermissions] call lils_common_fnc_arrayEncode]
    ],
    [
        ["rid", _rankID]
    ]
] call lils_database_fnc_generateUpdateQuery] call lils_database_fnc_query;

[_rankID, _rankName, _rankTag, _rankPaycheck, _rankInsignia] call lilc_factions_interface_fnc_setRank;
