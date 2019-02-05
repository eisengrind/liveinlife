#include "..\script_component.hpp"

params [
    ["_classname", "", [""]],
    ["_profile_id", 0, [0]]
];

if (_classname == "") exitWith { []; };
if (_profile_id <= 0) exitWith { []; };

[
    "vehicles",
    [],
    "POST",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    [
        "object",
        [
            ["classname", _classname],
            ["profile_id", _profile_id]
        ]
    ]
] call EFUNC(api,request);
