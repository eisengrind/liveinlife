#include "..\script_component.hpp"

params [
    ["_groupID", 0, [0]],
    ["_opts", [], [[]]]
];

if (_groupID <= 0) exitWith { []; };
if (count _opts <= 0) exitWith { []; };

[
    "factions/groups/%1",
    [
        _groupID
    ],
    "PATCH",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token),
        QPROFILES_ACCESS_TOKEN_HEADER, EGVAR(api_profiles,token)
    ],
    [
        "object",
        _opts
    ]
] call EFUNC(api,request);
