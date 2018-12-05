#include "..\script_component.hpp"

params [
    ["_accountID", 0, [0]]
];

if (_accountID <= 0) exitWith { []; };

[
    "exchange/accounts/%1",
    [
        _accountID
    ],
    "DELETE",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api,request)
    ],
    []
] call EFUNC(api,request);
