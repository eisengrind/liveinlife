#include "..\script_component.hpp"

params [
    ["_userID", 0, [0]],
    ["_firstname", "", [""]],
    ["_lastname", "", [""]]
];

if (_userID <= 0) exitWith { []; };
if (_firstname == "") exitWith { []; };
if (_lastname == "") exitWith { []; };

[
    "profiles",
    [],
    "POST",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    [
        "object",
        [
            ["user_id", _userID],
            ["firstname", _firstname],
            ["lastname", _lastname]
        ]
    ]
] call EFUNC(api,request);
