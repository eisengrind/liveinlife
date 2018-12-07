#include "..\script_component.hpp"

params [
    ["_factionProfileID", 0, [0]],
    ["_permissionNames", [], [[]]]
];

if (_factionProfileID <= 0) exitWith { []; };
if (count _permissionNames <= 0) exitWith { []; };

[
    "factions/profiles/%1/permissions/have",
    [
        _factionProfileID
    ],
    "POST",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token),
        QPROFILES_ACCESS_TOKEN_HEADER, EGVAR(api_profiles,token)
    ],
    [
        "array",
        _permissionNames
    ]
] call EFUNC(api,request);
