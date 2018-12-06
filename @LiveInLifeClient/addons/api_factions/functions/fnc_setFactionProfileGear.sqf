#include "..\script_component.hpp"

params [
    ["_factionProfileID", 0, [0]],
    ["_gear", "", [""]]
];

if (_factionProfileID <= 0) exitWith { []; };
if (_gear == "") exitWith { []; };

[
    "factions/profiles/%1/gear",
    [
        _factionProfileID
    ],
    "PATCH",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    [
        "object",
        [
            ["gear", _gear]
        ]
    ]
] call EFUNC(api,request);
