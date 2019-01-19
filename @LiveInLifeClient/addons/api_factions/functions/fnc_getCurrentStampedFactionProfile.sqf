#include "..\script_component.hpp"

params [
    ["_profileID", 0, [0]]
];

if (_profileID <= 0) exitWith { []; };

[
    "factions/stamper?profile_id=%1",
    [
        _profileID
    ],
    "GET",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    []
] call EFUNC(api,request);
