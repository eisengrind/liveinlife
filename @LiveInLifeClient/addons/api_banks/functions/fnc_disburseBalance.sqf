#include "..\script_component.hpp"

params [
    ["_accountID", 0, [0]],
    ["_value", 0, [0]]
];

if (_accountID <= 0) exitWith { []; };
if (_value <= 0) exitWith { []; };

[
    "banks/accounts/%1/disburse?value=%2",
    [
        _accountID,
        _value
    ],
    "POST",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token),
        QPROFILES_ACCESS_TOKEN_HEADER, EGVAR(api_profiles,token)
    ],
    []
] call EFUNC(api,request);

