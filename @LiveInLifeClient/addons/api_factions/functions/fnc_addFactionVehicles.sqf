#include "..\script_component.hpp"

params [
    ["_factionID", 0, [0]],
    ["_classnames", [], [[]]]
];

if (_factionID <= 0) exitWith { []; };
if (count _classnames <= 0) exitWith { []; };

[
    "factions/%1/vehicles",
    [
        _factionID
    ],
    "POST",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    [
        "array",
        _classnames
    ]
] call EFUNC(api,request);
