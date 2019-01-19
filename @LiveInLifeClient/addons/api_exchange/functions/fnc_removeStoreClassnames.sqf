#include "..\script_component.hpp"

params [
    ["_storeID", 0, [0]],
    ["_classnames", [], [[]]]
];

if (_storeID <= 0) exitWith { []; };
if (count _classnames <= 0) exitWith { []; };

[
    "exchange/stores/%1/classnames",
    [
        _storeID
    ],
    "DELETE",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    [
        "array",
        _classnames
    ]
] call EFUNC(api,request);
