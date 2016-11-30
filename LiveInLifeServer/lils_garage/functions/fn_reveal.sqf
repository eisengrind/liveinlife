
params [
    ["_unit", objNull, [objNull]],
    ["_vehicleID", 0, [0]],
    ["_garageName", "", [""]]
];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if (_vehicleID <= 0) throw false;
    
    private _unitUID = (getPlayerUID _unit);
    private _accountID = (_unit getVariable ["lilc_accountID", 0]);
    if (_unitUID == "") throw false;
    if (_accountID <= 0) throw false;

    private _garageConfig = ([_garageName] call lilc_garage_fnc_getGarageConfig);
    if (isNull _garageConfig) throw false;

    private _position = getArray(_garageConfig >> "revealPosition");
    if ([(_position select 0), 5, ["Car", "Ship", "Boat", "Tank", "Truck", "Plane", "Air", "Helicopter"]] call lilc_common_fnc_objectsNearby) throw false;

    private _vehicleInfo = ([(format["SELECT CLASSNAME, GEAR, DAMAGE, FUEL, COLOR FROM VEHICLES_DATA WHERE ID = '%1' AND STEAM64ID = '%2' AND ACCOUNTID = '%3'", _vehicleID, _unitUID, _accountID])] call lils_database_fnc_fetchObjects);
    
    if ((count _vehicleInfo) != 1) throw false;
    _vehicleInfo = (_vehicleInfo select 0);
    private _gear = ([(_vehicleInfo select 1)] call lils_common_fnc_arrayDecode);
    private _damage = ([(_vehicleInfo select 2)] call lils_common_fnc_arrayDecode);
    
    if ([(_position select 0), 5, ["Car", "Ship", "Boat", "Tank", "Truck", "Plane", "Air", "Helicopter"]] call lilc_common_fnc_objectsNearby) throw false;

    private _vehicle = ([(_vehicleInfo select 0), _position, _vehicleID, _accountID, _unitUID] call lils_vehicles_fnc_create);
    if (isNull _vehicle) throw false;

    //_vehicle lock true;
    [_vehicle] call lilc_inventory_fnc_clearVehicleCargo;
    [_vehicle, _gear] call lilc_inventory_fnc_setVehicleCargo;
    [_vehicle, _damage] call lilc_common_fnc_setObjectDamage;
    _vehicle setFuel (_vehicleInfo select 3);
    [(_vehicleInfo select 4), _vehicle] call lilc_textures_fnc_setVehicle;
    [_vehicle, _unit] call lilc_keys_fnc_add;
    [(format["UPDATE VEHICLES_DATA SET ACTIVE = '1' WHERE ID = '%1' AND ACCOUNTID = '%2' AND STEAM64ID = '%3'", _vehicleID, _accountID, _unitUID])] call lils_database_fnc_query;

    [[_vehicle], "lilc_garage_fnc_revealed", _unit] call lilc_common_fnc_send;
    throw true;
} catch {
    if !(_exception) then {
        [[objNull], "lilc_garage_fnc_revealed", _unit] call lilc_common_fnc_send;
    };
};

/*
params [
    ["_unit", ObjNull, [ObjNull]],
    ["_vehicleID", 0, [0]],
    ["_position", [], [[]]]
];
if (isNull _unit) exitWith {};
if (_vehicleID <= 0) exitWith {};
if ((count _position) < 2) exitWith {};

if (([(_position select 0), 4] call lilc_common_fnc_objectsNearby)) exitWith {};

_accountID = (_unit getVariable ["lilc_accountID", 0]);
if (_accountID <= 0) exitWith {};

_vehicleInfo = [];
_vehicleInfo = [format["SELECT * FROM VEHICLES_DATA WHERE STEAM64ID = '%1' AND ID = '%2' AND ACCOUNTID = '%3' AND ACTIVE = '0' AND DEAD = '0' LIMIT 1", (getPlayerUID _unit), _vehicleID, _accountID]] call lils_database_fnc_fetchObjects;
if ((count _vehicleInfo) <= 0) exitWith {};
_vehicleInfo = _vehicleInfo select 0;
_vehicleInfo set [6, ([(_vehicleInfo select 6)] call lils_common_fnc_arrayDecode)];
_vehicleInfo set [7, ([(_vehicleInfo select 7)] call lils_common_data_fnc_arrayDecode)];
_vehicleInfo set [8, ([(_vehicleInfo select 8)] call lils_common_data_fnc_arrayDecode)];

[format["UPDATE VEHICLES_DATA SET ACTIVE = '1' AND DEAD = '0' WHERE ID = '%1'", _vehicleID]] call lils_database_fnc_query;
_vehicle = [(_vehicleInfo select 3), _position, [_vehicleID, _accountID, (getPlayerUID _unit)]] call lils_vehicles_fnc_create;

_lock = if ((_vehicleInfo select 10) == 0) then { 0; } else { 2; };
_vehicle lock _lock;
_vehicle setFuel (_vehicleInfo select 9);

[_vehicle, (_vehicleInfo select 7)] call lilc_inventory_fnc_setVehicleCargo;

_damage = (_vehicleInfo select 8);
if !((count _damage) <= 0) then {
    {
        _vehicle setHitPointDamage [_x, ((_damage select 2) select _forEachIndex)];
    } forEach (_damage select 0);
};

_unit addMagazine [format["lilci_key_%1_F", (typeOf _vehicle)], _vehicleID];
*/
