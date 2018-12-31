#include "script_component.hpp"

if (hasInterface) then {
    private _fnc_createEffect = {
        params ["_type", "_layer", "_default"];

        private _effect = ppEffectCreate [_type, _layer];
        _effect ppEffectForceInNVG true;
        _effect ppEffectAdjust _default;
        _effect ppEffectCommit 0;

        _effect
    };

    GVAR(effectCameraDC) = [
        "DynamicBlur",
        660,
        [2]
    ] call _fnc_createEffect;

    GVAR(effectCameraCC) = [
        "ColorCorrections",
        661,
        [1.27, 1, 0, [1,1,1,0.1], [1, 1, 1, 1], [1, 1, 1, 1]]
    ] call _fnc_createEffect;

    if (isMultiplayer) then {
        QGVAR(layerColor) cutText ["", "BLACK OUT", 0.01, true];

        [{ !isNull (findDisplay 46) }, {
            showCinemaBorder false;
            GVAR(camera) = "camera" camCreate [0, 0, 0];
            GVAR(camera) camSetPos [5433.4,7589.82,1.84199];
            GVAR(camera) camSetDir [sin 232, cos 232, 0];
            GVAR(camera) cameraEffect ["internal", "back"];
            GVAR(camera) camCommit 0;

            GVAR(effectCameraDC) ppEffectEnable true;
            GVAR(effectCameraCC) ppEffectEnable true;

            QGVAR(layerColor) cutText ["", "BLACK IN", 1];
            QGVAR(loading_screen) cutRsc [QGVAR(loading_screen), "PLAIN", 1];

            [{
                [QGVAR(initializeUser), [player]] spawn CBA_fnc_serverEvent; //TODO: change again to "call"
            }, nil, 1] call CBA_fnc_waitAndExecute;
        }] call CBA_fnc_waitUntilAndExecute;
    };
};

[QGVAR(userNotExisting), {
    QGVAR(loading_screen) cutFadeOut 0;
    createDialog QGVAR(create_user);
}] call CBA_fnc_addEventHandler;

[QGVAR(userReceived), {
    params [
        ["_userID", 0, [0]],
        ["_accessToken", "", [""]],
        ["_refreshToken", "", [""]]
    ];

    if (_userID <= 0) exitWith {};

    GVAR(userID) = _userID;

    //[QEGVAR(api_users,userAuthenticated), [_accessToken, _refreshToken]] call CBA_fnc_localEvent;

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
                    [QGVAR(profileLogin), [
                        player,
                        [_profile, "id"] call a3uf_json_fnc_get
                    ]] spawn CBA_fnc_serverEvent; //TODO: change again to "call"
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
}] call CBA_fnc_addEventHandler;

[QGVAR(profileReceived), {
    params [
        ["_profileID", 0, [0]]
    ];

    if (_profileID <= 0) exitWith {};

    private _resp = [_profileID] call EFUNC(api_profiles,getProfileToken);
    if REQ_IS_OK(_resp) then {
        private _res = REQ_GET_BODY(_resp);
        EGVAR(api_profiles,token) = [_res, "access_token"] call a3uf_json_fnc_get;
        EGVAR(api_profiles,refresh_token) = [_res, "refresh_token"] call a3uf_json_fnc_get;

        GVAR(profileID) = _profileID;

        //[QGVAR(profileInitialized), [_profileID]] call CBA_fnc_localEvent;

        QGVAR(loading_screen) cutFadeOut 3;
        QGVAR(layerColor) cutText ["", "WHITE OUT", 3];
        [{
            params ["_profileID"];

            GVAR(effectCameraDC) ppEffectEnable false;
            GVAR(effectCameraCC) ppEffectEnable false;

            GVAR(camera) cameraEffect ["terminate", "back"];
            camDestroy GVAR(camera);
            GVAR(camera) = objNull;

            [QGVAR(afterProfileInitialized), [_profileID]] call CBA_fnc_localEvent;
            QGVAR(layerColor) cutText ["", "WHITE IN", 3];
        }, _profileID, 3] call CBA_fnc_waitAndExecute;
    };
}] call CBA_fnc_addEventHandler;
