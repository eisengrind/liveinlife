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
        "Authorization", EGVAR(api_users,token),
        "ProfileAuthorization", EGVAR(api_profiles,token)
    ],
    []
] call EFUNC(api,request);
