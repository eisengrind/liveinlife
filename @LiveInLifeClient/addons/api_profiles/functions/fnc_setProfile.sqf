#include "..\script_component.hpp"

params [
    ["_profileID", 0, [0]],
    ["_opts", [], [[]]]
];

if (_profileID <= 0) exitWith { []; };
if ((count _opts) <= 0) exitWith { []; };

[
    "profiles/%1",
    [
        _profileID
    ],
    "PATCH",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token),
        QPROFILES_ACCESS_TOKEN_HEADER, GVAR(token)
    ],
    [
        "object",
        _opts
    ]
] call EFUNC(api,request);
