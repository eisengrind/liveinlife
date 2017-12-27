
params [
    ["_unit", objNull, [objNull]],
    ["_vehicle", objNull, [objNull]],
    ["_garageName", "", [""]]
];

try
{
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if (_garageName == "") throw false;

    private _garageConfig = ([_garageName] call lilc_garage_fnc_getGarageConfig);
    if (isNull _garageConfig) throw false;

    private _factionID = (_unit getVariable ["lilc_factionID", -1]);
    private _accountID = (_unit getVariable ["lilc_accountID", 0]);

    if (_accountID <= 0) throw false;
    if (isNull _vehicle) throw false;
    
    private _classname = (typeOf _vehicle);
    private _color = (_vehicle getVariable ["lilc_vehicleColor", ""]);

    if (_factionID > -1) then
    {
        private _factionConfig = ([_factionID] call lilc_factions_fnc_getFactionConfig);

        private _inVehicles = false;
        {
            if (_classname == (_x select 0)) exitWith { _inVehicles = true; };
        } forEach getArray(_factionConfig >> "defaultVehicles");

        if !(_inVehicles) throw false;
        deleteVehicle _vehicle;
    }
    else
    {
        private _vehicleID = (_vehicle getVariable ["lilc_vehicleID", 0]);
        if (_vehicleID <= 0) throw false;

        if ((getNumber(_garageConfig >> "isLocal")) <= 0) then
        {
            _garageName = "";
        };

        private _type = (switch (true) do {
            case (_classname isKindOf "Car"): {
                0;
            };
            
            case (_classname isKindOf "Plane"): {
                1;
            };
            
            case (_classname isKindOf "Helicopter"): {
                2;
            };

            case (_classname isKindOf "Truck"): {
                3;
            };
            
            case (_classname isKindOf "Ship"): {
                4;
            };
            
            case (_classname isKindOf "Bike"): {
                5;
            };
        });

        private _availableTypes = [];
        {
            if ((getNumber(_garageConfig >> _x)) >= 1) then
            {
                _availableTypes pushBack _forEachIndex;
            };
        } forEach ["haveCars", "havePlanes", "haveHelicopters", "haveTrucks", "haveBoats", "haveSmallCars", "haveBikes"];

        if !(_type in _availableTypes) throw false;

        [_vehicle] call lils_vehicles_fnc_save;
        [(format[
            "UPDATE VEHICLES_DATA SET ACTIVE = '0', GEAR = '%1', GARAGE = '%2' WHERE ID = '%3' AND ACCOUNTID = '%4' AND CLASSNAME = '%5';",
            ([([_vehicle] call lilc_inventory_fnc_getVehicleCargo)] call lils_common_fnc_arrayEncode),
            (str _garageName),
            _vehicleID,
            _accountID,
            (str _classname)
        ])] call lils_database_fnc_query;
        [[(typeOf _vehicle), _vehicleID], "lilc_keys_fnc_remove", _unit] call lilc_common_fnc_send;
        
        deleteVehicle _vehicle;
    };
    throw true;
}
catch
{
    [[_exception], "lilc_garage_fnc_parked", _unit] call lilc_common_fnc_send;
    _exception;
};
