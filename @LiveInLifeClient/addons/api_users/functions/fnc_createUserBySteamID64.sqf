#include "..\script_component.hpp"

params [
    ["_steamID64", "", [""]]
];

if (_steamID64 == "") exitWith { []; };

[
    "users/auth/server/steam/signup/%1",
    [
        _steamID64
    ],
    "POST",
    [
        QUSERS_ACCESS_TOKEN_HEADER, GVAR(token)
    ],
    []
] call EFUNC(api,request);
