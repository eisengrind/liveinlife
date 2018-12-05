#include "..\script_component.hpp"

params [
    ["_accountID", 0, [0]],
    ["_classname", "", [""]],
    ["_amount", 0, [0]]
];

if (_accountID <= 0) exitWith { []; };
if (_classname == "") exitWith { []; };
if (_amount <= 0) exitWith { []; };

[
    "exchange/accounts/%1/inventory",
    [
        _accountID
    ],
    "DELETE",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    [
        "object",
        [
            ["classname", _classname],
            ["_amount", _amount]
        ]
    ]
] call EFUNC(api,request);
