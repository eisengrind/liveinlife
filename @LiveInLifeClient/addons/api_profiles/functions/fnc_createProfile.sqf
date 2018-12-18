#include "..\script_component.hpp"

params [
    ["_userID", 0, [0]],
    ["_firstname", "", [""]],
    ["_middlename", "", [""]],
    ["_lastname", "", [""]],
    ["_birthday", "", [""]],
    ["_originLocode", "", [""]]
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
            ["lastname", _lastname],
            ["middlename", _middlename],
            ["birthday", _birthday],
            ["originLocode", _originLocode]
        ]
    ]
] call EFUNC(api,request);
