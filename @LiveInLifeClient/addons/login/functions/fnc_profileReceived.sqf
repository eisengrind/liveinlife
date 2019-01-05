#include "..\script_component.hpp"

params [
    ["_profileID", 0, [0]]
];

if (_profileID <= 0) exitWith {};

private _resp = [_profileID] call EFUNC(api_profiles,getProfileToken);
if REQ_IS_OK(_resp) then {
    private _res = REQ_GET_BODY(_resp);

    [QEGVAR(api_users,userAuthenticated), [
        [_res, "access_token"] call a3uf_json_fnc_get,
        [_res, "refresh_token"] call a3uf_json_fnc_get
    ]] call CBA_fnc_localEvent;

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

        TARGET_ENDPOINT_CBA_EVENT(QGVAR(afterProfileInitialized),[ARR_1(_profileID)]);
        QGVAR(layerColor) cutText ["", "WHITE IN", 3];
        if !(GVAR(finishedOverwrite)) then {
            player setVariable [QGVAR(finished), true, true];
        };
    }, _profileID, 3] call CBA_fnc_waitAndExecute;
};
