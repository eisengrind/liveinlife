#include "..\script_component.hpp"

params [
    ["_orderID", 0, [0]]
];

if (_orderID <= 0) exitWith { []; };

[
    "banks/orders/%1",
    [
        _orderID
    ],
    "GET",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token),
        QPROFILES_ACCESS_TOKEN_HEADER, EGVAR(api_profiles,token)
    ],
    []
] call EFUNC(api,request);
