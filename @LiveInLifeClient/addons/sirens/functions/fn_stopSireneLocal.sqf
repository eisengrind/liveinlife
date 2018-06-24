
params [
    ["_vehicle", objNull, [objNull]],
    ["_id", "", [""]]
];

if (isNull _vehicle) exitWith {};
if (isNil "_id" || { _id == ""; }) exitWith {};

private _s = format["lilc_sirens_sirene_%1", _id];
private _sObjN = format["%1_object", _s];
private _sObj = _vehicle getVariable [_sObjN, objNull];
if (isNull _sObj) exitWith {};

["lils_vehicles_vehicleDeath", _vehicle getVariable [format["%1_deathEVH", _s], nil]] call CBA_fnc_removeEventHandler;
_vehicle setVariable [format["%1_deathEVH", _s], nil];

deleteVehicle _sObj;
_vehicle setVariable [_sObjN, objNull];
