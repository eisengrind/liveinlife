#include "..\script_component.hpp"

params [
    ["_filter", [], [[]]]
];

private _query = [];
for "_i" from 0 to (count _filter) - 1 do {
    private _param = _filter select _i;
    if (count _param == 2) then {
        _query pushBack format["%1=%2", _param select 0, _param select 1];
    };
};

[
    "vehicles?" + (_query joinString "&"),
    [],
    "GET",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token)
    ],
    []
] call EFUNC(api,request);
