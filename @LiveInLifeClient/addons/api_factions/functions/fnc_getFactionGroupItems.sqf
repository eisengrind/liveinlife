#include "..\script_component.hpp"

params [
    ["_groupID", 0, [0]]
];

if (_groupID <= 0) exitWith { []; };
if (count _classnames <= 0) exitWith { []; };

[
    "factions/groups/%1/items",
    [
        _groupID
    ],
    "GET",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token),
        QPROFILES_ACCESS_TOKEN_HEADER, EGVAR(api_profiles,token)
    ],
    []
] call EFUNC(api,request);
