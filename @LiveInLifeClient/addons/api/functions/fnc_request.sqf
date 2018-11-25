#include "..\script_component.hpp"

params [
    ["_path", "", []],
    ["_pathParams", [], []],
    ["_query", [], [[]]],
    ["_method", "", []],
    ["_headers", [], [[]]],
    ["_postData", [], [[]]]
];

if (_path == "") exitWith { []; };
if !(_method in HTTP_METHODS) exitWith { []; };
if (count _postData != 2) exitWith { []; };

private _uri = format[
    "%1://%2/%3",
    GVAR(uri_scheme),
    GVAR(uri_authority),
    format (_path append _pathParams)
];

for "_i" from 0 to (count _query) - 1 do {
    private _param = (_query select _i);
    if (count _param == 2) then {
        if (_i == 0) then {
            _uri = format ["%1?", _uri];
        };
        if (_i > 0) then {
            _uri = format ["%1&", _uri];
        };
        _uri = format ["%1%2=%3", _uri, _param select 0, _param select 1];
    };
};

private _jsonPostData = _postData call FUNC(toJSON);

diag_log format[
    "request made with uri '%1', method '%2', headers '%3' and postData '%4'",
    _uri,
    _method,
    str _headers,
    _jsonPostData
];

[
    ([_uri, _method, _headers, _jsonPostData, true] call a3uf_common_fnc_request),
    200
]
