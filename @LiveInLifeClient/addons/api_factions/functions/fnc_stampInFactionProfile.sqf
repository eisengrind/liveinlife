#include "..\script_component.hpp"

params [
    ["_factionID", 0, [0]],
    ["_profileID", 0, [0]]
];

if (_factionID <= 0) exitWith { []; };
if (_profileID <= 0) exitWith { []; };

[
    "factions/%1/stamper?profileid=%2",
    [
        _factionID,
        _profileID
    ],
    "POST",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    []
] call EFUNC(api,request);
