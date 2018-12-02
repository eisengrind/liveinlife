#include "..\script_component.hpp"

params [
    ["_profileID", 0, [0]]
];

if (_profileID <= 0) exitWith { []; };

[
    "banks/accounts/profiles/%1",
    [
        _profileID
    ],
    "GET",
    [
        "Authorization", EGVAR(api_users,token),
        "ProfileAuthorization", EGVAR(api_profiles,token)
    ],
    []
] call EFUNC(api,request);
