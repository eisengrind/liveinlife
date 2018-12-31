#include "script_component.hpp"

[QGVAR(initializeUser), {
    params [
        ["_unit", objNull, [objNull]]
    ];

    if (isNull _unit) exitWith {};

    private _steamID64 = "76561198040411592";
    if (isMultiplayer) then {
        _steamID64 = getPlayerUID _unit;
    };

    private _resp = [_steamID64] call EFUNC(api_users,getUserBySteamID64);

    if REQ_IS_OK(_resp) then {
        private _res = REQ_GET_BODY(_resp);

        private _id = [_res, "id"] call a3uf_json_fnc_get;
        if (_id <= 0) exitWith {};

        _resp = [_steamID64] call EFUNC(api_users,getUserTokenBySteamID64);

        if REQ_IS_OK(_resp) then {
            _res = REQ_GET_BODY(_resp);

            [QGVAR(userReceived), [
                _id,
                [_res, "access_token"] call a3uf_json_fnc_get,
                [_res, "refresh_token"] call a3uf_json_fnc_get
            ], _unit] call CBA_fnc_targetEvent;
        };
    } else {
        [QGVAR(userNotExisting), [], _unit] call CBA_fnc_targetEvent;
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(createUser), {
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
}] call CBA_fnc_addEventHandler;

[QGVAR(profileLogin), {
    params [
        ["_unit", objNull, [objNull]],
        ["_profileID", 0, [0]]
    ];

    [QGVAR(profileReceived), _profileID, _unit] call CBA_fnc_targetEvent;
}] call CBA_fnc_addEventHandler;

[QGVAR(createProfile), {
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

        [QGVAR(profileReceived), [_id], _unit] call CBA_fnc_targetEvent;
    };
}] call CBA_fnc_addEventHandler;
