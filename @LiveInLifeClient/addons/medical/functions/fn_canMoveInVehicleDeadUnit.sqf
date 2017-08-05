
try {
    private _vehicles = nearestObjects [(position player), ["Car", "Air", "Ship"], 10];
    if ((count _vehicles) <= 0) throw false;
    private _vehicle = (_vehicles select 0);

    if (isNull _vehicle) throw false;
    if (_vehicle isKindOf "Man") throw false;
    if ((_vehicle distance player) > 10) throw false;
    if !([_vehicle] call lilc_keys_fnc_have) throw false;
    if (isNull lilc_medical_currentMovedDeadUnit) throw false;
    if !((lilc_medical_currentMovedDeadUnit getVariable ["lilc_medical_currentTransporteur", objNull]) isEqualTo player) throw false;

    throw true;
} catch {
    _exception;
};
