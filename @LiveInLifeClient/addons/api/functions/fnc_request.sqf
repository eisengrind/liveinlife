#include "..\script_component.hpp"

params [
    ["_path", "", [""]],
    ["_pathParams", [], [[]]],
    ["_method", "", [""]],
    ["_headers", [], [[]]],
    ["_postData", [], [[], ""]]
];

if (_path == "") exitWith { []; };
if !(_method in HTTP_METHODS) exitWith { []; };

private _uri = format[
    "%1://%2/%3",
    GVAR(uri_scheme),
    GVAR(uri_authority),
    format ([_path] + _pathParams)
];

private _postDataStr = "";
if (_postData isEqualType [] && count _postData == 2) then {
    _postDataStr = _postData call FUNC(toJSON);
};

if (_postData isEqualType "") then {
    _postDataStr = _postData;
};

diag_log format[
    "request made with uri '%1', method '%2', headers '%3' and postData '%4'",
    _uri,
    _method,
    str _headers,
    _postDataStr
];

private _resp = ([_uri, _method, _headers, _postDataStr, true] call a3uf_common_fnc_request);

[
    parseSimpleArray (_resp select 0),
    _resp select 1
]
