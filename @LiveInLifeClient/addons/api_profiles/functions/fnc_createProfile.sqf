#include "..\script_component.hpp"

params [
    ["_userID", 0, [0]],
    ["_firstname", "", [""]],
    ["_middlename", "", [""]],
    ["_lastname", "", [""]],
    ["_birthday", "", [""]],
    ["_originLocode", "", [""]],
    ["_face", "", [""]],
    ["_sex", 0, [0]]
];

if (_userID <= 0) exitWith { []; };
if (_firstname == "") exitWith { []; };
if (_lastname == "") exitWith { []; };
if (_face == "") exitWith { []; };
if (_sex != 1 && _sex != 0) exitWith { []; };

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
            ["origin_locode", _originLocode],
            ["face", _face],
            ["sex", _sex]
        ]
    ]
] call EFUNC(api,request);
