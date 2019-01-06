#include "..\script_component.hpp"

params [
    ["_unit", objNull, [objNull]],
    ["_userID", 0, [0]],
    ["_firstname", "", [""]],
    ["_middlename", "", [""]],
    ["_lastname", "", [""]],
    ["_birthday", "", [""]],
    ["_originLocode", "", [""]],
    ["_entryReason", "", [""]],
    ["_face", "", [""]],
    ["_sex", 0, [0]]
];

if (isNull _unit) exitWith {};
if (_userID <= 0) exitWith {};
if (_firstname == "") exitWith {};
if (_lastname == "") exitWith {};
if (_birthday == "") exitWith {};
if (_originLocode == "") exitWith {};
if !(_originLocode in EGVAR(countries,locodes)) exitWith {};
if (_face == "") exitWith {};
if (_sex != 1 && _sex != 0) exitWith {};

private _resp = [
    _userID,
    _firstname,
    _middlename,
    _lastname,
    _birthday,
    _originLocode,
    _face,
    _sex
] call EFUNC(api_profiles,createProfile);

if REQ_IS_OK(_resp) then {
    private _res = REQ_GET_BODY(_resp);

    private _id = [_res, "id"] call a3uf_json_fnc_get;

    [QGVAR(profileCreated), [_id]] call CBA_fnc_localEvent;
    [QGVAR(profileLogin), [_unit, _id]] call CBA_fnc_targetEvent;
};
