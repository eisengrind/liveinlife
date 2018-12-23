#include "script_component.hpp"

[QGVAR(userNotExisting), {
    1000 cutText ["", "PLAIN", 0.01];
    createDialog "create_user";
}] call CBA_fnc_addEventHandler;

[QGVAR(userReceived), {
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
                1000 cutText ["", "PLAIN", 0.01];
                createDialog QGVAR(create_profile);
            } else {
                if (count _profiles == 1) then {
                    private _profile = (_profiles select 0);
                    [QGVAR(profileLogin), [
                        player,
                        [_profile, "id"] call a3uf_json_fnc_get
                    ]] call CBA_fnc_serverEvent;
                } else {
                    1000 cutText ["", "PLAIN", 0.01];
                    createDialog QGVAR(select_profile);
                };
            };
        } else {
            1000 cutText ["", "PLAIN", 0.01];
            createDialog QGVAR(create_profile);
        };
    } else {
        1000 cutText ["", "PLAIN", 0.01];
        createDialog QGVAR(create_profile);
    }
}] call CBA_fnc_addEventHandler;

[QGVAR(profileReceived), {
    params [
        ["_profileID", 0, [0]],
    ];

    if (_profileID <= 0) exitWith {};

    private _resp = [_profileID] call EFUNC(api_profiles,getProfileToken);
    if REQ_IS_OK(_resp) then {
        private _res = REQ_GET_BODY(_resp);
        EGVAR(api_profiles,token) = [_res, "access_token"] call a3uf_json_fnc_get;
        EGVAR(api_profiles,refresh_token) = [_res, "refresh_token"] call a3uf_json_fnc_get;

        GVAR(profileID) = _profileID;

        [QGVAR(profileInitialized), [_profileID]] call CBA_fnc_localEvent;

        1000 cutText ["", "WHITE OUT", 3];
        sleep 3.1;

        GVAR(camera) cameraEffect ["terminate", "back"];
        camDestroy GVAR(camera);
        GVAR(camera) = objNull;

        [QGVAR(afterProfileInitialized), [_profileID]] call CBA_fnc_localEvent;
        1000 cutText ["", "WHITE IN", 3];
    };
}] call CBA_fnc_addEventHandler;

if (isMultiplayer) then {
    1000 cutText ["", "BLACK OUT", 0.01, true];

    [{ !isNull (findDisplay 46) }, {
        GVAR(camera) = "camera" camCreate [0, 0, 0];
        GVAR(camera) cameraEffect ["internal", "back"];
        GVAR(camera) camCommit 0;
        1000 cutRsc [QGVAR(loading_screen), "BLACK IN", 1];

        [QGVAR(initializeUser), [player]] call CBA_fnc_serverEvent;
    }] call CBA_fnc_waitUntilAndExecute;
};
