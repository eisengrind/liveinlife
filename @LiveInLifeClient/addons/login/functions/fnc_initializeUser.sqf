#include "..\script_component.hpp"

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

    if ([_res, "banned"] call a3uf_json_fnc_get) exitWith {
        [QGVAR(endMissionUserBanned), nil, [_unit]] call CBA_fnc_targetEvent;
    };

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
