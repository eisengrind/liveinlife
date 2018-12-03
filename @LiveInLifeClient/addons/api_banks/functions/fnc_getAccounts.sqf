#include "..\script_component.hpp"

params [
    ["_count", 0, [0]],
    ["_page", 0, [0]]
];

if (_count <= 0) exitWith { []; };
if (_page <= 0) exitWith { []; };

[
    "banks/accounts?count=%1&page=%2",
    [
        _count,
        _page
    ],
    "GET",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token),
        QPROFILES_ACCESS_TOKEN_HEADER, EGVAR(api_profiles,token)
    ],
    []
] call EFUNC(api,request);
