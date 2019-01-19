#include "..\script_component.hpp"

params [
    ["_storeID", 0, [0]]
];

if (_storeID <= 0) exitWith { []; };

[
    "exchange/stores/%1",
    [
        _storeID
    ],
    "GET",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    []
] call EFUNC(api,request);
