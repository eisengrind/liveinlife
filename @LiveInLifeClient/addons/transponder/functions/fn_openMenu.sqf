
private _vehicle = param [0, objNull, [objNull]];

try {
    if (isNull _vehicle) throw false;
    if !(alive _vehicle) throw false;
    if (_vehicle isEqualTo player) throw false;
    if (dialog) throw false;
    if (isNil "lilc_transponder_currentIndex") then { lilc_transponder_currentIndex = 0; };

    createDialog "lilcm_transponder_transponder";
    lilc_transponder_currentVehicle = _vehicle;
    lilc_transponder_currentMode = (lilc_transponder_currentVehicle getVariable ["lilc_transponder_mode", 0]);
    lilc_transponder_currentCode = (lilc_transponder_currentVehicle getVariable ["lilc_transponder_code", "0000"]);

    call lilc_transponder_fnc_updateMenu;
} catch {
    _exception;
};
