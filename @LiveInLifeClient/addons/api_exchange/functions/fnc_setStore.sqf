#include "..\script_component.hpp"

params [
    ["_storeID", 0, [0]],
    ["_opts", [], [[]]]
];

if (_storeID <= 0) exitWith { []; };
if (count _opts <= 0) exitWith { []; };

[
    "exchange/stores/%1",
    [
        _storeID
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
