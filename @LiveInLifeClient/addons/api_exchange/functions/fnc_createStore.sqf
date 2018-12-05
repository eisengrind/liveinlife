#include "..\script_component.hpp"

params [
    ["_name", "", [""]],
    ["_alias", "", [""]],
    ["_fee", 1, [0]],
    ["_type", 0, [0]],
    ["_classnames", [], [[]]]
];

if (_name == "") exitWith { []; };
if (_alias == "") exitWith { []; };
if (_fee < 0) exitWith { []; };
if !(_type in [0, 1, 2]) exitWith { []; };

[
    "exchange/stores",
    [],
    "POST",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    [
        "object",
        [
            ["name", _name],
            ["alias", _alias],
            ["fee", _fee],
            ["type", _type],
            ["classnames", [
                "array",
                _classnames
            ]]
        ]
    ]
] call EFUNC(api,request);
