
params [
    ["_garageName", "", [""]],
    ["_vehicle", ObjNull, [ObjNull]],
    ["_unit", ObjNull, [ObjNull]],
    ["_staticPosition", "", [""]],
    ["_types", [], [[]]]
];

if (isNull _vehicle || !alive _unit) exitWith {};
if (isNull _unit || !alive _unit && !isPlayer _unit) exitWith {};
if (_staticPosition == "") exitWith {};
if ((count _types) <= 0) exitWith {};

private _position = ([_staticPosition] call lilc_common_fnc_getDynamicPosition);
if ((count _position) != 2) throw false;

_objectsNearby = nearestObjects [(_position select 0), [], 15];

if !(_vehicle in _objectsNearby) exitWith {};

_isKindOf = false;
{
    if (_vehicle isKindOf _x) exitWith { _isKindOf = true; }; 
} forEach _types;
if !(_isKindOf) exitWith {};

_vehicleID = _vehicle getVariable ["lilc_vehicleID", 0];
if (_vehicleID <= 0) exitWith {};

[format["UPDATE VEHICLES_DATA SET ACTIVE = '0', FUEL = '%1', POSITION = '""[0, 0, 0]""', GEAR = '%2', `LOCK` = '1', GARAGE = '' WHERE ID = '%3' AND ACCOUNTID = '%4' AND STEAM64ID = '%5'", (fuel _vehicle), ([([_vehicle] call lilc_inventory_fnc_getVehicleCargo)] call lils_common_fnc_arrayEncode), _vehicleID, (_unit getVariable ["lilc_accountID", 0]), (getPlayerUID _unit)]] call lils_database_fnc_query;

deleteVehicle _vehicle;
