#include "..\script_component.hpp"

params [
    ["_count", 0, [0]],
    ["_page", 0, [0]],
    ["_filter", [], [[]]]
];

if (_count <= 0) exitWith { []; };
if (_page <= 0) exitWith { []; };

private _query = [
    format["count=%1", _count],
    format["page=%1", _page]
];
for "_i" from 0 to (count _filter) - 1 do {
    private _param = _filter select _i;
    if (count _page == 2) then {
        _query pushBack format["%1=%2", _param select 0, _param select 1]
    };
};

[
    "factions/groups?" + (_query joinString "&"),
    [],
    "GET",
    [
        QUSERS_ACCESS_TOKEN_HEADER, EGVAR(api_users,token),
        QPROFILES_ACCESS_TOKEN_HEADER, EGVAR(api_profiles,token)
    ],
    []
] call EFUNC(api,request);
