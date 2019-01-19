#include "..\script_component.hpp"

params [
    ["_groupID", 0, [0]]
];

if (_groupID <= 0) exitWith { []; };

[
    "factions/groups/%1",
    [
        _groupID
    ],
    "DELETE",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token),
        QPROFILES_ACCESS_TOKEN_HEADER, EGVAR(api_profiles,toke)
    ],
    []
] call EFUNC(api,request);
