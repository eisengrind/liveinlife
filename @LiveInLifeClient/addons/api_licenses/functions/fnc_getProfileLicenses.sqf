#include "..\script_component.hpp"

params [
    ["_profileID", 0, [0]]
];

if (_profileID <= 0) exitWith { []; };

[
    "licenses/profiles/%1",
    [
        _profileID
    ],
    "GET",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token),
        QPROFILES_ACCESS_TOKEN_HEADER, EGVAR(api_profiles,token),
        QFACTION_PROFILES_ACCESS_TOKEN_HEADER, EGVAR(api_factions,token)
    ],
    []
] call EFUNC(api,request);
