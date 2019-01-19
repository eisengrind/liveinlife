#include "..\script_component.hpp"

params [
    ["_licenseID", 0, [0]],
    ["_title", "", [""]]
];

if (_licenseID <= 0) exitWith { []; };
if (_title == "") exitWith { []; };

[
    "licenses/%1/title",
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
            ["title", _title]
        ]
    ]
] call EFUNC(api,request);
