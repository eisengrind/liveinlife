
/*0 - VFR, 1 - IFR*/
try {
    private _status = (lilc_transponder_currentVehicle getVariable ["lilc_transponder_status", false]);
    if (_status) throw false;
    if (isNil "lilc_transponder_active") then { lilc_transponder_active = false; };
    if (lilc_transponder_active) throw false;
    lilc_transponder_active = true;

    ctrlSetText [1581, "LOADING"];
    ctrlEnable [1581, false];
    sleep 4;
    
    playSound "lilcs_transponder_on";
    sleep 0.1;
    //playSound "transponderSound";
    
    lilc_transponder_currentVehicle setVariable ["lilc_transponder_status", true, true];
    call lilc_transponder_fnc_updateMenu;
    lilc_transponder_active = false;
} catch {
    _exception;
};
