#include "..\script_component.hpp"

params [
    ["_factionID", 0, [0]]
];

if (_factionID <= 0) exitWith { []; };

[
    "factions/%1",
    [
        _factionID
    ],
    "GET",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    []
] call EFUNC(api,request);
