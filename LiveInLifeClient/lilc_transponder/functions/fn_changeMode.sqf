
try {
    _name = "";
    if (isNil "lilc_transponder_currentMode") then { lilc_transponder_currentMode = (lilc_transponder_currentVehicle getVariable ["lilc_transponder_mode", 0]); };

    switch (lilc_transponder_currentMode) do {
        case 0: {
            _name = "IFR";
            lilc_transponder_currentMode = 1;
        };

        case 1: {
            _name = "VFR";
            lilc_transponder_currentMode = 0;
        };

        default {
            _name = "VFR";
            lilc_transponder_currentMode = 0;
        };
    };
    ctrlSetText [1583, _name];
} catch {
    _exception;
};
