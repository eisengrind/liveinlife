
params [
    ["_unit", objNull, [objNull]],
    ["_garageName", "", [""]]
];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if (_garageName == "") throw false;

    private _garageConfig = ([_garageName] call lilc_garage_fnc_getGarageConfig);
    if (isNull _garageConfig) throw false;

    private _accountID = (_unit getVariable ["lilc_accountID", 0]);
    private _unitUID = (getPlayerUID _unit);

    if (_accountID <= 0) throw false;
    if (_unitUID == "") throw false;

    private _vehicle = objNull;
    {
        if (!(_x isKindOf "Man") && !isPlayer _x && (_x getVariable ["lils_accountID", ""]) == _accountID && (_x getVariable ["lils_steam64ID", ""]) == _unitUID && (alive _x) && !isNull _x) exitWith { _vehicle = _x; };
    } forEach nearestObjects [(getArray(_garageConfig >> "parkPosition")), [], getNumber(_garageConfig >> "parkRadius")];
    if (isNull _vehicle) throw false;

    private _vehicleID = (_vehicle getVariable ["lilc_vehicleID", 0]);
    if (_vehicleID <= 0) throw false;

    if ((getNumber(_garageConfig >> "isLocal")) <= 0) then {
        _garageName = "";
    };

    [_vehicle] call lils_vehicles_fnc_save;
    [(format["UPDATE VEHICLES_DATA SET ACTIVE = '0', GEAR = '%1' WHERE ID = '%2' AND ACCOUNTID = '%3' AND STEAM64ID = '%4' AND GARAGE = '""%5""';", ([([_vehicle] call lilc_inventory_fnc_getVehicleCargo)] call lils_common_fnc_arrayEncode),_vehicleID, _accountID, _unitUID, _garageName])] call lils_database_fnc_query;
    deleteVehicle _vehicle;
    throw true;
} catch {
    [[_exception], "lilc_garage_fnc_parked", _unit] call lilc_common_fnc_send;
    _exception;
};
