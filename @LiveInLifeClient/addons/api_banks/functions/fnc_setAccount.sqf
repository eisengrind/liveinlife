#include "..\script_component.hpp"

params [
    ["_accountID", 0, [0]]
];

if (_accountID <= 0) exitWith { []; };

private _opts = _this select [1, (count _this) - 1];

[
    "banks/accounts/%1",
    [
        _accountID
    ],
    "PATCH",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    [
        "object",
        _opts
    ]
] call EFUNC(api,request);
