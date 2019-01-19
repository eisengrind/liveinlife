#include "..\script_component.hpp"

params [
    ["_permissionID", 0, [0]]
];

if (_permissionID <= 0) exitWith { []; };

[
    "permissions/%1",
    [
        _permissionID
    ],
    "GET",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    []
] call EFUNC(api,request);
