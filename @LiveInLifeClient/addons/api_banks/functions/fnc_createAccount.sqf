#include "..\script_component.hpp"

params [
    ["_profileID", 0, [0]],
    ["_type", 0, [0]],
    ["_balance", 0, [0]],
    ["_balanceCredit", 0, [0]],
    ["_bank", "", [""]]
];

if (_profileID <= 0) exitWith { []; };
if (_type != 0) exitWith { []; };
if (_balance <= 0) exitWith { []; };
if (_balanceCredit <= 0) exitWith { []; };
if (_bank == "") exitWith { ""; };

[
    "banks/accounts",
    [],
    "POST",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    [
        "object",
        [
            ["profile_id", _profileID],
            ["type", _type],
            ["balance", _balance],
            ["balance_credit", _balanceCredit],
            ["bank", _bank]
        ]
    ]
] call EFUNC(api,request);
