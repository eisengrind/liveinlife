
private _garageName = param [0, "", [""]];

try {
    if (_garageName == "") throw false;

    private _garageConfig = ([_garageName] call lilc_garage_fnc_getGarageConfig);
    if (isNull _garageConfig) throw false;

    private _vehicle = objNull;
    {
        if (
            !(_x isKindOf "Man") &&
            !isPlayer _x &&
            (_x getVariable ["lilc_accountID", 0]) == _accountID &&
            (_x getVariable ["lilc_steam64ID", ""]) == _unitUID &&
            (alive _x) &&
            !isNull _x
        ) exitWith
        {
            _vehicle = _x;
        };
    } forEach nearestObjects [(ASLToAGL (([(getText(_garageConfig >> "parkPosition"))] call lilc_common_fnc_getDynamicPosition) select 0)), ["Air", "Ship", "Boat", "Truck", "LandVehicle"], getNumber(_garageConfig >> "parkRadius"), true];

    if (isNull _vehicle) then
    {
        [
            "Es ist kein Fahrzeug in der Nähe",
            "ERROR"
        ] call lilc_ui_fnc_hint;
        throw false;
    };

    [[player, _vehicle, _garageName], "lils_garage_fnc_park"] call lilc_common_fnc_sendToServer;
} catch {
    _exception;
};
