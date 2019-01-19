#include "..\script_component.hpp"

params [
    ["_profileID", 0, [0]],
    ["_targetProfileID", 0, [0]],
    ["_value", 0, [0]]
];

if (_profileID <= 0) exitWith { []; };
if (_targetProfileID <= 0) exitWith { []; };
if (_value <= 0) exitWith { []; };

[
    "profiles/%1/cash/give/%2?value=%3",
    [
        _profileID,
        _targetProfileID,
        _value
    ],
    "POST",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    [
        "object",
        _opts
    ]
] call EFUNC(api,request);
