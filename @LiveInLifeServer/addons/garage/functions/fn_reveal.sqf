
params [
    ["_unit", objNull, [objNull]],
    ["_vehicleID", 0, [0, []]],
    ["_garageName", "", [""]]
];

try
{
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;

    private _classname = "";
    private _color = "";
    private _factionID = (_unit getVariable ["lilc_factionID", -1]);

    if (_vehicleID isEqualType []) then
    {
        if ((count _vehicleID) <= 0) throw false;
        if (_factionID <= -1) throw false;
        _classname = (_vehicleID select 0);
        _color = (_vehicleID select 1);
    }
    else
    {
        if (_vehicleID <= 0 && !(_factionID <= -1)) throw false;
    };
    
    private _unitUID = (getPlayerUID _unit);
    private _accountID = (_unit getVariable ["lilc_accountID", 0]);
    if (_unitUID == "") throw false;
    if (_accountID <= 0) throw false;

    private _garageConfig = ([_garageName] call lilc_garage_fnc_getGarageConfig);
    if (isNull _garageConfig) throw false;

    private _factionVehicles = [];
    private _position = ([(getText(_garageConfig >> "revealPosition"))] call lilc_common_fnc_getDynamicPosition);
    if ([(_position select 0), 5, ["Car", "Ship", "Boat", "Tank", "Truck", "Plane", "Air", "Helicopter"]] call lilc_common_fnc_objectsNearby) throw false;

    if (_factionID <= -1) then
    {
        private _vehicleInfo = [];
        _vehicleInfo = ([(format["SELECT CLASSNAME, GEAR, DAMAGE, FUEL, COLOR, QUOTE(PLATE) FROM VEHICLES_DATA WHERE ID = '%1' AND STEAM64ID = '%2' AND ACCOUNTID = '%3'", _vehicleID, _unitUID, _accountID])] call lils_database_fnc_fetchObjects);
        if ((count _vehicleInfo) != 1) throw false;
        
        _vehicleInfo = (_vehicleInfo select 0);
        private _gear = ([(_vehicleInfo select 1)] call lils_common_fnc_arrayDecode);
        private _damage = ([(_vehicleInfo select 2)] call lils_common_fnc_arrayDecode);
        
        if ([(_position select 0), 5, ["Car", "Ship", "Boat", "Tank", "Truck", "Plane", "Air", "Helicopter"]] call lilc_common_fnc_objectsNearby) throw false;

        (_position select 0) set [2, ((_position select 0) select 2) + 0.5];

        private _vehicle = ([(_vehicleInfo select 0), _position, _vehicleID, _accountID, _unitUID] call lils_vehicles_fnc_create);
        if (isNull _vehicle) throw false;

        [_vehicle, _gear] call lilc_inventory_fnc_setVehicleCargo;
        [_vehicle, _damage] call lilc_common_fnc_setObjectDamage;
        _vehicle setFuel (_vehicleInfo select 3);
        
        [(_vehicleInfo select 4), _vehicle] call lilc_textures_fnc_setVehicle;
        [[_vehicle, _unit], "lilc_keys_fnc_add", _unit] call lilc_common_fnc_send;
        [_vehicle, 2] call lilc_vehicles_fnc_lock;

        _vehicle setVariable ["lilc_garage_callsign", (_vehicleInfo select 5), true];

        [(format["UPDATE VEHICLES_DATA SET ACTIVE = '1' WHERE ID = '%1' AND ACCOUNTID = '%2' AND STEAM64ID = '%3'", _vehicleID, _accountID, _unitUID])] call lils_database_fnc_query;

        [[_vehicle], "lilc_garage_fnc_revealed", _unit] call lilc_common_fnc_send;
        throw true;
    }
    else
    {
        //private _factionVehicles = ([(format["SELECT VEHICLES FROM FACTION_PLAYER_DATA WHERE ACCOUNTID = '%1' AND STEAM64ID = '%2'", _accountID, _unitUID])] call lils_database_fnc_fetchObjects);

        if ([(_position select 0), 5, ["Car", "Ship", "Boat", "Tank", "Truck", "Plane", "Air", "Helicopter"]] call lilc_common_fnc_objectsNearby) throw false;
        private _vehicle = ([_classname, _position, -1, _accountID, _unitUID, true, (_unit getVariable ["lilc_factionID", -1])] call lils_vehicles_fnc_create);
        if (isNull _vehicle) throw false;

        [_vehicle] call lilc_inventory_fnc_clearVehicleCargo;
        _vehicle setDamage 0;
        _vehicle setFuel 1;
        _vehicle setVariable ["lilc_vehicleColor", _color, true];
        [_vehicle, 2] call lilc_vehicles_fnc_lock;

        [[_vehicle], "lilc_garage_fnc_revealed", _unit] call lilc_common_fnc_send;
        throw true;
    };
}
catch
{
    if !(_exception) then {
        [[objNull], "lilc_garage_fnc_revealed", _unit] call lilc_common_fnc_send;
    };
};
