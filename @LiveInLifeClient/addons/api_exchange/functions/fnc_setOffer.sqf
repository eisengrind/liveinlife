#include "..\script_component.hpp"

params [
    ["_offerID", 0, [0]],
    ["_opts", [], [[]]]
];

if (_offerID <= 0) exitWith { []; };
if (count _opts <= 0) exitWith { []; };

[
    "exchange/offers/%1",
    [
        _offerID
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
