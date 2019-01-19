#include "..\script_component.hpp"

params [
    ["_userID", 0, [0]],
    ["_opts", [], [[]]]
];

if (_userID <= 0) exitWith { []; };
if ((count _opts) <= 0) exitWith { []; };

[
    "users/%1",
    [
        _userID
    ],
    "PATCH",
    [
        QUSERS_ACCESS_TOKEN_HEADER, GVAR(token)
    ],
    [
        "object",
        _opts
    ]
] call EFUNC(api,request);
