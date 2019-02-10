
try {
    if !(isNull (findDisplay 1265)) then {
        closeDialog 1265;
    };

    if !(isNull lilc_garage_currentCamera) then {
        [1] call lilc_ui_fnc_fadeInBlack;
        sleep 0.7;
        
        lilc_garage_currentCamera cameraEffect ["terminate","back"];
        camDestroy lilc_garage_currentCamera;
        deleteVehicle lilc_garage_currentCamera;
        [2] call lilc_ui_fnc_fadeOutBlack;
    };
} catch {
    _exception;
};
