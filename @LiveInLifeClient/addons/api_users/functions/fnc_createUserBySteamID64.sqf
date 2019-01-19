#include "..\script_component.hpp"

params [
    ["_steamID64", "", [""]],
    ["_username", "", [""]],
    ["_password", "", [""]]
];

if (_steamID64 == "") exitWith { []; };
if (_username == "") exitWith { []; };
if (_password == "") exitWith { []; };

[
    "users/auth/server/steam/signup/%1",
    [
        _steamID64
    ],
    "POST",
    [
        QUSERS_ACCESS_TOKEN_HEADER, GVAR(token)
    ],
    [
        "object",
        [
            ["username", _username],
            ["password", _password]
        ]
    ]
] call EFUNC(api,request);
