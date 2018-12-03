#include "..\script_component.hpp"

params [
    ["_licenseID", 0, [0]],
    ["_profileID", 0, [0]]
];

if (_licenseID <= 0) exitWith { []; };
if (_profileID <= 0) exitWith { []; };

[
    "licenses/%1/profiles/%2",
    [
        _licenseID,
        _profileID
    ],
    "POST",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token),
        QPROFILE_ACCESS_TOKEN_HEADER, EGVAR(api_profiles,token),
        QFACTION_PROFILES_ACCESS_TOKEN_HEADER, EGVAR(api_factions,token)
    ],
    []
] call EFUNC(api,request);
