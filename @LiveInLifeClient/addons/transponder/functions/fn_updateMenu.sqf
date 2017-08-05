
try {
    private _status = (lilc_transponder_currentVehicle getVariable ["lilc_transponder_status", false]);
    if (_status) then {
        { ctrlEnable [_x, true]; } forEach [1581, 1582, 1583, 1584, 1585, 1586, 1587, 1588, 1589, 1590, 1591, 1592];
        
        ctrlSetText [1581, lilc_transponder_currentCode];
        ctrlSetText [1582, "FL 001"];
        ctrlSetText [1583, (
            switch (lilc_transponder_currentMode) do {
                case 0: { "VFR"; };
                case 1: { "IFR"; };
                default { "VFR"; };
            }
        )];
        ctrlSetText [1584, "1234"];
        buttonSetAction [1585, "[] spawn lilc_transponder_fnc_off;"];
    } else {
        { ctrlEnable [_x, false]; } forEach [1581, 1582, 1583, 1584, 1586, 1587, 1588, 1589, 1590, 1591, 1592];
        ctrlSetText [1581, ""];
        ctrlSetText [1582, ""];
        ctrlSetText [1583, ""];
        ctrlSetText [1584, ""];
        buttonSetAction [1585, "[] spawn lilc_transponder_fnc_on;"];
    };
} catch {
    _exception;
};
