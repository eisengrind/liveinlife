
/*0 - VFR, 1 - IFR*/
try {
    private _status = (lilc_transponder_currentVehicle getVariable ["lilc_transponder_status", false]);
    if !(_status) throw false;
    if (isNil "lilc_transponder_active") then { lilc_transponder_active = false; };
    if (lilc_transponder_active) throw false;
    lilc_transponder_active = true;

    ctrlSetText [1581, "BYE BYE!"];
    ctrlEnable [1581, false];
    sleep 1;
    
    playSound "lilcs_transponder_off";
    sleep 0.1;
    
    lilc_transponder_currentVehicle setVariable ["lilc_transponder_status", false, true];
    call lilc_transponder_fnc_updateMenu;
    lilc_transponder_active = false;
    lilc_transponder_currentCode = "0000";
    lilc_transponder_currentIndex = 0;
    lilc_transponder_currentMode = 0;
    
    ctrlSetText [1581, ""];
    ctrlSetText [1582, ""];
    ctrlSetText [1583, ""];
    ctrlSetText [1584, ""];
} catch {
    _exception;
};
