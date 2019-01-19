#include "..\script_component.hpp"

params [
    ["_accountID", 0, [0]],
    ["_price", 0, [0]],
    ["_classname", "", [""]],
    ["_amount", 0, [0]]
];

if (_accountID <= 0) exitWith { []; };
if (_price <= 0) exitWith { []; };
if (_classname == "") exitWith { []; };
if (_amount <= 0) exitWith { []; };

[
    "exchange/offers/sell",
    [],
    "POST",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token),
        QPROFILES_ACCESS_TOKEN_HEADER, EGVAR(api_profiles,token)
    ],
    [
        "object",
        [
            ["exchange_account_id", _accountID],
            ["price", _price],
            ["classname", _classname],
            ["amount", _amount]
        ]
    ]
] call EFUNC(api,request);
