#include "..\script_component.hpp"

params [
    ["_factionID", 0, [0]],
    ["_title", "", [""]],
    ["_tag", "", [""]]
];

if (_factionID <= 0) exitWith { []; };
if (_title == "") exitWith { []; };
if (_tag == "") exitWith { []; };

[
    "factions/groups",
    [],
    "POST",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token),
        QPROFILES_ACCESS_TOKEN_HEADER, EGVAR(api_profiles,token)
    ],
    [
        "object",
        [
            ["faction_id", _factionID],
            ["title", _title],
            ["tag", _tag]
        ]
    ]
] call EFUNC(api,request);
