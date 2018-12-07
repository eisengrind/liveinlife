#include "..\script_component.hpp"

params [
    ["_groupdID", 0, [0]]
];

if (_groupdID <= 0) exitWith { []; };

[
    "factions/groups/%1/vehicles",
    [
        _groupdID
    ],
    "GET",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token),
        QPROFILES_ACCESS_TOKEN_HEADER, EGVAR(api_profiles,token)
    ],
    []
] call EFUNC(api,request);
