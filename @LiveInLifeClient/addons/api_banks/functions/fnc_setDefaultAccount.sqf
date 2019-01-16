#include "..\script_component.hpp"

params [
    ["_accountID", 0, [0]]
];

if (_orderID <= 0) exitWith { []; };

[
    "banks/accounts/%1/default",
    [
        _accountID
    ],
    "GET",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token),
        QPROFILES_ACCESS_TOKEN_HEADER, EGVAR(api_profiles,token)
    ],
    ["object", [
        ["profile_id", player getVariable [QEGVAR(profiles,profileID), 0]]
    ]]
] call EFUNC(api,request);
