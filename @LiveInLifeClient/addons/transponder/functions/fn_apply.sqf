
try {
    if (lilc_transponder_active) throw false;
    lilc_transponder_active = true;

    lilc_transponder_currentCode = (ctrlText 1581);
    lilc_transponder_currentVehicle setVariable ["lilc_transponder_mode", lilc_transponder_currentMode, true];
    lilc_transponder_currentVehicle setVariable ["lilc_transponder_code", lilc_transponder_currentCode, true];
    
    ctrlSetText [1581, ""];
    ctrlSetText [1582, "APPLIED"];
    ctrlSetText [1583, ""];
    ctrlSetText [1584, ""];
    sleep 1;

    call lilc_transponder_fnc_updateMenu;
    lilc_transponder_active = false;
} catch {
    _exception;
};
