#include "..\script_component.hpp"

params [
    ["_profileID", 0, [0]]
];

if (_profileID <= 0) exitWith { []; };

[
    "profiles/%1/authenticate",
    [
        _profileID
    ],
    "POST",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    []
] call EFUNC(api,request);
