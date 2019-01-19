#include "..\script_component.hpp"

params [
    ["_groupID", 0, [0]],
    ["_classnames", [], [[]]]
];

if (_groupID <= 0) exitWith { []; };
if (count _classnames <= 0) exitWith { []; };

[
    "factions/groups/%1/vehicles",
    [
        _groupID
    ],
    "PATCH",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token),
        QPROFILES_ACCESS_TOKEN_HEADER, EGVAR(api_profiles,token)
    ],
    [
        "array",
        _classnames
    ]
] call EFUNC(api,request);
