#include "..\script_component.hpp"

params [
    ["_factionID", 0, [0]]
];

if (_factionID <= 0) exitWith { []; };

[
    "factions/%1/vehicles",
    [
        _factionID
    ],
    "GET",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token),
        QPROFILES_ACCESS_TOKEN_HEADER, EGVAR(api_profiles,token)
    ],
    []
] call EFUNC(api,request);
