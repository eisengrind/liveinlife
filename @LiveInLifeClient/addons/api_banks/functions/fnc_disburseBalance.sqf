#include "..\script_component.hpp"

params [
    ["_accountID", 0, [0]],
    ["_profileID", 0, [0]],
    ["_value", 0, [0]]
];

if (_accountID <= 0) exitWith { []; };
if (_profileID <= 0) exitWith { []; };
if (_value <= 0) exitWith { []; };

[
    "banks/accounts/%1/disburse",
    [
        _accountID
    ],
    "POST",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    ["object", [
        ["profile_id", _profileID],
        ["value", _value]
    ]]
] call EFUNC(api,request);

