#include "..\script_component.hpp"

params [
    ["_accountID", [0], [0]]
];

if (_accountID <= 0) exitWith { []; };

[
    "banks/accounts/%1",
    [
        _accountID
    ],
    "DELETE",
    [
        "Authorization", EGVAR(api_users,token),
        "ProfileAuthorization", EGVAR(api_profiles,token)
    ],
    []
] call EFUNC(api,request);
