#include "..\script_component.hpp"

params [
    ["_steamid64", "", [""]]
];

if (_steamid64 == "") exitWith { []; };

[
    "users/steamid64/%1",
    [
        _steamid64
    ],
    "GET",
    [
        QUSERS_ACCESS_TOKEN_HEADER, GVAR(token)
    ],
    []
] call EFUNC(api,request);
