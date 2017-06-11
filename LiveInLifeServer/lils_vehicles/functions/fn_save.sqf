
_vehicle = param [0, ObjNull, [ObjNull]];

try {
    if (isNull _vehicle || !alive _vehicle) throw false;

    private _vehicleID = _vehicle getVariable ["lilc_vehicleID", 0];
    private _accountID = _vehicle getVariable ["lilc_accountID", 0];
    private _steam64ID = _vehicle getVariable ["lilc_steam64ID", 0];
    
    if (_vehicleID <= 0 || _accountID <= 0 || _steam64ID == "") throw false;

    [
        (format["UPDATE VEHICLES_DATA SET ACTIVE = '1', POSITION = '%1', GEAR = '%2', DAMAGE = '%3', FUEL = '%4', `LOCK` = '%5', COLOR = '""%6""' WHERE ID = '%7' AND ACCOUNTID = '%8' AND STEAM64ID = '%9'",
        ([([_vehicle] call lilc_common_fnc_getPosition)] call lils_common_fnc_arrayEncode),
        ([([_vehicle] call lilc_inventory_fnc_getVehicleCargo)] call lils_common_fnc_arrayEncode),
        ([(getAllHitPointsDamage _vehicle)] call lils_common_fnc_arrayEncode),
        (fuel _vehicle),
        (locked _vehicle),
        (_vehicle getVariable ["lilc_vehicleColor", ""]),
        _vehicleID,
        _accountID,
        _steam64ID])
    ] call lils_database_fnc_query;
    throw true;
} catch {
    _exception;
};
