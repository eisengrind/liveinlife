#include "..\script_component.hpp"

params [
    ["_username", "", [""]]
];

if (_username == "") exitWith { []; };

[
    "users/username/%1",
    [
        _username
    ],
    "GET",
    [
        QUSERS_ACCESS_TOKEN_HEADER, GVAR(token)
    ],
    []
] call EFUNC(api,request);
