#include "..\script_component.hpp"

params [
    ["_unit", objNull, [objNull]],
    ["_profileID", 0, [0]]
];

private _resp = [_profileID] call EFUNC(api_profiles,getProfile);

if REQ_IS_OK(_resp) then {
    private _res = REQ_GET_BODY(_resp);

    if !([_res, "active"] call a3uf_json_fnc_get) exitWith {
        [QGVAR(endMissionProfileDeactivated), nil, [_unit]] call CBA_fnc_targetEvent;
    };

    _unit setVariable [
        QGVAR(firstname),
        [_res, "firstname"] call a3uf_json_fnc_get,
        true
    ];
    _unit setVariable [
        QGVAR(middlename),
        [_res, "middlename"] call a3uf_json_fnc_get,
        true
    ];
    _unit setVariable [
        QGVAR(middlename),
        [_res, "middlename"] call a3uf_json_fnc_get,
        true
    ];

    _unit setVariable [
        QGVAR(birthday),
        [_res, "birthday"] call a3uf_json_fnc_get,
        true
    ];
    _unit setVariable [
        QGVAR(originLocode),
        [_res, "origin_locode"] call a3uf_json_fnc_get,
        true
    ];

    private _position = [
        [_res, "position_x"] call a3uf_json_fnc_get,
        [_res, "position_y"] call a3uf_json_fnc_get,
        [_res, "position_z"] call a3uf_json_fnc_get
    ];

    if !([_res, "new"] call a3uf_json_fnc_get) then {
        _unit setPosASL _position;
        _unit setDir ([_res, "direction"] call a3uf_json_fnc_get);
    };

    private _face = [_res, "face"] call a3uf_json_fnc_get;
    if (_face != "") then {
        [QGVAR(setFace), [_unit, _face]] call CBA_fnc_globalEventJIP;
    };

    [QGVAR(beforeProfileLoggedIn), [_unit, _profileID, _res]] call CBA_fnc_localEvent;
    [QGVAR(profileReceived), [_profileID, [_res, "inventory"] call a3uf_json_fnc_get], _unit] call CBA_fnc_targetEvent;
};
