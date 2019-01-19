#include "..\script_component.hpp"

params [
    ["_alias", "", [""]]
];

if (_alias == "") exitWith { []; };

[
    "factions/alias/%1",
    [
        _alias
    ],
    "GET",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    []
] call EFUNC(api,request);
