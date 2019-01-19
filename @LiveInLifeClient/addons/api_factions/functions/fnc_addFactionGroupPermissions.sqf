#include "..\script_component.hpp"

params [
    ["_groupID", 0, [0]],
    ["_permissionIDs", [], [[]]]
];

if (_groupID <= 0) exitWith { []; };
if (count _permissionIDs <= 0) exitWith { []; };

[
    "factions/groups/%1/permissions",
    [
        _groupID
    ],
    "POST",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token),
        QPROFILES_ACCESS_TOKEN_HEADER, EGVAR(api_profiles,token)
    ],
    [
        "array",
        _permissionIDs
    ]
] call EFUNC(api,request);
