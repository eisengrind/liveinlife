#include "..\script_component.hpp"

params [
    ["_alias", "", [""]],
    ["_title", "", [""]],
    ["_description", "", [""]]
];

if (_alias == "") exitWith { []; };
if (_title == "") exitWith { []; };
if (_description == "") exitWith { []; };

[
    "licenses",
    [],
    "POST",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    [
        "object",
        [
            ["alias", _alias],
            ["title", _title],
            ["description", _description]
        ]
    ]
] call EFUNC(api,request);
