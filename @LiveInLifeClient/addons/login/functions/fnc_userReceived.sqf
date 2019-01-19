#include "..\script_component.hpp"

params [
    ["_userID", 0, [0]],
    ["_accessToken", "", [""]],
    ["_refreshToken", "", [""]]
];

if (_userID <= 0) exitWith {};

GVAR(userID) = _userID;

[QEGVAR(api_users,userAuthenticated), [_accessToken, _refreshToken]] call CBA_fnc_localEvent;

private _resp = [10, 1, [
    ["user_id", _userID]
]] call EFUNC(api_profiles,getProfiles);

if REQ_IS_OK(_resp) then {
    private _res = REQ_GET_BODY(_resp);

    if (count _res == 2) then {
        private _profiles = (_res select 1);
        if (count _profiles == 0) then {
            QGVAR(loading_screen) cutFadeOut 0;
            createDialog QGVAR(create_profile);
        } else {
            if (count _profiles == 1) then {
                private _profile = (_profiles select 0);
                TARGET_ENDPOINT_CBA_EVENT(QGVAR(profileLogin),[ARR_2(player,[ARR_2(_profile,"id")] call a3uf_json_fnc_get)]);
            } else {
                QGVAR(loading_screen) cutFadeOut 0;
                createDialog QGVAR(select_profile);
            };
        };
    } else {
        QGVAR(loading_screen) cutFadeOut 0;
        createDialog QGVAR(create_profile);
    };
} else {
    QGVAR(loading_screen) cutFadeOut 0;
    createDialog QGVAR(create_profile);
};
