#include "..\script_component.hpp"

params [
    ["_limit", 0, [0]],
    ["_filter", [], [[]]]
];

if (_limit <= 0) exitWith { []; };

private _query = [
    format["limit=%1", _limit]
];
for "_i" from 0 to (count _filter) - 1 do {
    private _param = _filter select _i;
    if (count _param == 2) then {
        _query pushBack format["%1=%2", _param select 0, _param select 1];
    };
};

[
    "banks/accounts?" + (_query joinString "&"),
    [],
    "GET",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token),
        QPROFILES_ACCESS_TOKEN_HEADER, EGVAR(api_profiles,token)
    ],
    []
] call EFUNC(api,request);
