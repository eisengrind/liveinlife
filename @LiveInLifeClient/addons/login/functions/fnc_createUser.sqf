#include "..\script_component.hpp"

params [
    ["_unit", objNull, [objNull]],
    ["_username", "", [""]],
    ["_password", "", [""]]
];

if (isNull _unit) exitWith {};
if (_username == "") exitWith {};
if (_password == "") exitWith {};

private _steamID64 = "76561198040411592";
if (isMultiplayer) then {
    _steamID64 = getPlayerUID _unit;
};

private _resp = [
    _steamID64,
    _username,
    _password
] call EFUNC(api_users,createUserBySteamID64);

if REQ_IS_OK(_resp) then {
    private _res = REQ_GET_BODY(_resp);

    private _accessToken = [_res, "access_token"] call a3uf_json_fnc_get;
    private _refreshToken = [_res, "refresh_token"] call a3uf_json_fnc_get;

    if (_accessToken == "" || _refreshToken == "") exitWith {};

    _resp = [_steamID64] call EFUNC(api_users,getUserBySteamID64);
    if REQ_IS_OK(_resp) then {
        _res = REQ_GET_BODY(_resp);

        private _id = [_res, "id"] call a3uf_json_fnc_get;
        if (_id <= 0) exitWith {};

        [QGVAR(userReceived), [
            _id,
            _accessToken,
            _refreshToken
        ], _unit] call CBA_fnc_targetEvent;
    };
};
