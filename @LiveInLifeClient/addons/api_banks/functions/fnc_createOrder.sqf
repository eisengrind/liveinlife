#include "..\script_component.hpp"

/*
    AccountID    accounts.AccountID    `json:"account_id"`
    TargetAccountID    accounts.AccountID    `json:"target_account_id"`
    Value        float32            `json:"value"`
    Description    string            `json:"description"`
    Interval    uint64            `json:"interval"`
    Repeats        int64            `json:"repeats"`
*/
params [
    ["_accountID", 0, [0]],
    ["_targetAccountID", 0, [0]],
    ["_value", 0, [0]],
    ["_description", "", [""]],
    ["_interval", 0, [0]],
    ["_repeats", 0, [0]]
];

if (_accountID <= 0) exitWith { []; };
if (_targetAccountID <= 0) exitWith { []; };
if (_value <= 0) exitWith { []; };
if (_description == "") exitWith { []; };
if (_interval <= 0) exitWith { []; };
if (_repeats == 0 || _repeats < -1) exitWith { []; };

[
    "banks/orders",
    [],
    "POST",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token),
        QPROFILES_ACCESS_TOKEN_HEADER, EGVAR(api_profiles,token)
    ],
    [
        "object",
        [
            ["account_id", _accountID],
            ["target_account_id", _targetAccountID],
            ["value", _value],
            ["description", _description],
            ["interval", _interval],
            ["repeats", _repeats]
        ]
    ]
] call EFUNC(api,request);
