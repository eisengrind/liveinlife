#include "..\script_component.hpp"

params [
    ["_factionProfileID", 0, [0]]
];

if (_factionProfileID <= 0) exitWith { []; };

[
    "factions/profiles/%1/vehicles",
    [
        _factionProfileID
    ],
    "GET",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token),
        QPROFILES_ACCESS_TOKEN_HEADER, EGVAR(api_profiles,token)
    ],
    []
] call EFUNC(api,request);
