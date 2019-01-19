#include "..\script_component.hpp"

params [
    ["_factionID", 0, [0]],
    ["_opts", [], [[]]]
];

if (_factionID <= 0) exitWith { []; };
if (count _opts <= 0) exitWith { []; };

[
    "factions/%1",
    [
        _factionID
    ],
    "PATCH",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    [
        "object",
        _opts
    ]
] call EFUNC(api,request);
