#include "..\script_component.hpp"

params [
    ["_username", "", [""]],
    ["_passwordBase64", "", [""]]
];

if (_username == "") exitWith { []; };
if (_passwordBase64 == "") exitWith { []; };

[
    "users/auth",
    [],
    "POST",
    [],
    [
        "object",
        [
            ["username", _username],
            ["password", _passwordBase64]
        ]
    ]
] call EFUNC(api,request);
