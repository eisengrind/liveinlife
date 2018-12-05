#include "..\script_component.hpp"

params [
    ["_offerID", 0, [0]],
    ["_accountID", 0, [0]],
    ["_amount", 0, [0]]
];

if (_offerID <= 0) exitWith { []; };
if (_accountID <= 0) exitWith { []; };
if (_amount <= 0) exitWith { []; };

[
    "exchange/offers/%1/buy",
    [
        _offerID
    ],
    "POST",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token),
        QPROFILES_ACCESS_TOKEN_HEADER, EGVAR(api_profiles,token)
    ],
    [
        "object",
        [
            ["exchange_account_id", _accountID],
            ["amount", _amount]
        ]
    ]
] call EFUNC(api,request);
