
private _garageName = param [0, "", [""]];

try {
    if (_garageName == "") throw false;

    private _garageConfig = ([_garageName] call lilc_garage_fnc_getGarageConfig);
    if (isNull _garageConfig) throw false;

    private _fID = (player getVariable ["lilc_factionID", -1]);
    private _aID = (player getVariable ["lilc_accountID", 0]);
    private _uID = (getPlayerUID player);
    private _vehicle = objNull;
    {
        if (
            !(_x isKindOf "Man") &&
            !isPlayer _x &&
            (
                ((_x getVariable ["lilc_accountID", 0]) == _aID && (_x getVariable ["lilc_steam64ID", ""]) == _uID) ||
                (_fID == (_x getVariable ["lilc_factionID", -1]) && _fID > -1)
            ) &&
            (alive _x) &&
            !isNull _x
        ) exitWith
        {
            _vehicle = _x;
        };
    } forEach nearestObjects [(position player), ["Bicycle", "Air", "Ship", "Boat", "Truck", "LandVehicle"], getNumber(_garageConfig >> "parkRadius"), true];

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
