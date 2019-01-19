#include "..\script_component.hpp"

params [
    ["_licenseID", 0, [0]]
];

if (_licenseID <= 0) exitWith { []; };

[
    "licenses/%1",
    [
        _licenseID
    ],
    "GET",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    []
] call EFUNC(api,request);
