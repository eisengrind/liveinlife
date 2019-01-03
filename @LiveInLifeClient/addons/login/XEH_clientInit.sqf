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
                TARGET_ENDPOINT_CBA_EVENT(QGVAR(initializeUser),[player]);
            }, nil, 1] call CBA_fnc_waitAndExecute;
        }] call CBA_fnc_waitUntilAndExecute;
    };
};

[QGVAR(userNotExisting), {
    QGVAR(loading_screen) cutFadeOut 0;
    createDialog QGVAR(create_user);
}] call CBA_fnc_addEventHandler;
[QGVAR(userReceived), { _this spawn FUNC(userReceived); }] call CBA_fnc_addEventHandler;
[QGVAR(profileReceived), { _this spawn FUNC(profileReceived); }] call CBA_fnc_addEventHandler;
