#include "..\script_component.hpp"

params [
    ["_profileID", 0, [0]],
    ["_storeID", 0, [0]],
    ["_balance", 0, [0]],
    ["_active", false, [false]]
];

if (_profileID <= 0) exitWith { []; };
if (_storeID <= 0) exitWith { []; };
if (_balance < 0) exitWith { []; };

[
    "exchange/accounts",
    [],
    "POST",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    []
] call EFUNC(api,request);
