#include "..\script_component.hpp"

params [
    ["_offerID", 0, [0]]
];

if (_offerID <= 0) exitWith { []; };

[
    "exchange/offers/%1/cancel",
    [
        _offerID
    ],
    "DELETE",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token),
        QPROFILES_ACCESS_TOKEN_HEADER, EGVAR(api_profiles,token)
    ],
    []
] call EFUNC(api,request);
