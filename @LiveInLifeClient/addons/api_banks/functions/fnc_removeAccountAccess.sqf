#include "..\script_component.hpp"

params [
    ["_accountID", 0, [0]],
    ["_profileID", 0, [0]]
];

if (_accountID <= 0) exitWith { []; };
if (_profileID <= 0) exitWith { []; };

[
    "banks/accounts/%1/access/%2",
    [
        _accountID,
        _profileID
    ],
    "DELETE",
    [
        "Authorization", EGVAR(api_users,token),
        "ProfileAuthorization", EGVAR(api_profiles,token)
    ],
    []
] call EFUNC(api,request);
