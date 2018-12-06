#include "..\script_component.hpp"

params [
    ["_profileID", 0, [0]],
    ["_factionID", 0, [0]]
];

if (_profileID <= 0) exitWith { []; };
if (_factionID <= 0) exitWith { []; };

[
    "factions/profiles",
    [],
    "POST",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token),
        QPROFILES_ACCESS_TOKEN_HEADER, EGVAR(api_profiles,token)
    ],
    [
        "object",
        [
            ["profile_id", _profileID],
            ["faction_id", _factionID]
        ]
    ]
] call EFUNC(api,request);
