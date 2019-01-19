#include "..\script_component.hpp"

params [
    ["_profileID", 0, [0]],
    ["_balance", 0, [0]],
    ["_balanceCredit", 0, [0]],
    ["_bank", "", [""]],
    ["_bonusProfileID", 0, [0]]
];

if (_profileID <= 0) exitWith { []; };
if (_balance <= 0) exitWith { []; };
if (_balanceCredit <= 0) exitWith { []; };
if (_bank == "") exitWith { ""; };
if (_bonusProfileID <= 0) exitWith { []; };

[
    "banks/accounts/bonus",
    [],
    "POST",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    [
        "object",
        [
            ["profile_id", _profileID],
            ["balance", _balance],
            ["balance_credit", _balanceCredit],
            ["bank", _bank],
            ["bonus_profile_id", _bonusProfileID]
        ]
    ]
] call EFUNC(api,request);
