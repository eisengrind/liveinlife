#include "..\script_component.hpp"

params [
    ["_licenseID", 0, [0]],
    ["_description", "", [""]]
];

if (_licenseID <= 0) exitWith { []; };
if (_description == "") exitWith { []; };

[
    "licenses/%1/description",
    [
        _licenseID
    ],
    "POST",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    [
        "object",
        [
            ["description", _description]
        ]
    ]
] call EFUNC(api,request);
