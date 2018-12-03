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
    "POST",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token),
        QPROFILES_ACCESS_TOKEN_HEADER, EGVAR(api_profiles,token)
    ],
    []
] call EFUNC(api,request);
