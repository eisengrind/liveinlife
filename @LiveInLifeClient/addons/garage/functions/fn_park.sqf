
private _garageName = param [0, "", [""]];

try {
    if (_garageName == "") throw false;

    private _garageConfig = ([_garageName] call lilc_garage_fnc_getGarageConfig);
    if (isNull _garageConfig) throw false;

    [[player, _garageName], "lils_garage_fnc_park"] call lilc_common_fnc_sendToServer;
} catch {
    _exception;
};
