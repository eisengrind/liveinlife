#include "..\script_component.hpp"

params [
    ["_factionProfileID", 0, [0]]
];

if (_factionProfileID <= 0) exitWith { []; };

[
    "factions/profiles/%1/gear",
    [
        _factionProfileID
    ],
    "GET",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    []
] call EFUNC(api,request);
