#include "..\script_component.hpp"

params [
    ["_vehicleID", "", [""]],
    ["_opts", [], [[]]]
];

if (_vehicleID == "") exitWith { []; };
if (count _opts <= 0) exitWith { []; };

[
    "vehicles/%1",
    [
        _vehicleID
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
