#include "..\script_component.hpp"

params [
    ["_factionID", 0, [0]],
    ["_classnames", [], [[]]]
];

if (_factionID <= 0) exitWith { []; };

[
    "factions/%1/equipment",
    [
        _factionID
    ],
    "PATCH",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    [
        "array",
        _classnames
    ]
] call EFUNC(api,request);
