#include "..\script_component.hpp"

params [
    ["_vehicleID", "", [""]]
];

if (_vehicleID == "") exitWith { []; };

[
    "vehicles/%1",
    [
        _vehicleID
    ],
    "DELETE",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    []
] call EFUNC(api,request);
