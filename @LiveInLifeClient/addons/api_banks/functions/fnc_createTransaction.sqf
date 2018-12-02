#include "..\script_component.hpp"

params [
    ["_accountID", 0, [0]],
    ["_targetAccountID", 0, [0]],
    ["_value", 0, [0]],
    ["_description", "", [""]]
];

if (_accountID <= 0) exitWith { []; };
if (_targetAccountID <= 0) exitWith { []; };
if (_value <= 0) exitWith { []; };
if (_description == "") exitWith { []; };

[
    "banks/transactions",
    [],
    "POST",
    [
        "Authorization", EGVAR(api_users,token),
        "ProfileAuthorization", EGVAR(api_profiles,token)
    ],
    [
        "object",
        [
            ["account_id", _accountID],
            ["target_account_id", _targetAccountID],
            ["value", _value],
            ["description", _description]
        ]
    ]
] call EFUNC(api,request);
