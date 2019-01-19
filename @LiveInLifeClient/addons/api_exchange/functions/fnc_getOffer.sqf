#include "..\script_component.hpp"

params [
    ["_offerID", 0, [0]]
];

if (_offerID <= 0) exitWith { []; };

[
    "exchange/offers/%1",
    [
        _offerID
    ],
    "GET",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    []
] call EFUNC(api,request);
