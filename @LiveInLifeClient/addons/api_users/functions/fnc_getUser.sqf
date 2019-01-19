#include "..\script_component.hpp"

params [
    ["_userID", 0, [0]]
];

if (_userID <= 0) exitWith { []; };

[
    "users/%1",
    [
        _userID
    ],
    "GET",
    [
        QUSERS_ACCESS_TOKEN_HEADER, GVAR(token)
    ],
    []
] call EFUNC(api,request);
