#include "..\script_component.hpp"

params [
    ["_accountID", 0, [0]],
    ["_balance", 0, [0]]
];

if (_accountID <= 0) exitWith { []; };
if (_balance <= 0) exitWith { []; };

[
    "banks/accounts/%1/balance?value=%2",
    [
        _accountID,
        _balance
    ],
    "POST",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    []
] call EFUNC(api,request);
