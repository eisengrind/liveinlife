#include "..\script_component.hpp"

params [
    ["_factionID", 0, [0]],
    ["_profileID", 0, [0]]
];

if (_factionID <= 0) exitWith { []; };
if (_profileID <= 0) exitWith { []; };

[
    "factions/profiles/exists",
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
            ["profile_id", _profileID]
        ]
    ]
] call EFUNC(api,request);
