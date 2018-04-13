
params [
    ["_unit", objNull, [objNull]],
    ["_rankID", 0, [0]]
];

if (isNull _unit || _rankID <= 0) exitWith {};

private _factionID = _unit getVariable ["lilc_factionID", -1];
if (_factionID <= -1) exitWith {};

private _rankItems = [
    "faction_ranks",
    [
        ["items"]
    ],
    [
        ["rid", _rankID],
        ["fid", _factionID]
    ]
] call lils_database_fnc_fetchObjects;

try {
    if ((count _rankItems) <= 0) throw [];
    _rankItems = _rankItems select 0;
    _rankItems set [0, [_rankItems select 0] call lils_common_fnc_arrayEncode];

    throw _rankItems select 0;
} catch {
    [[_exception], "lilc_factions_interface_fnc_setRankItems", _unit] call lilc_common_fnc_send;
};
