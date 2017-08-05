
params [
	["_vehicle", objNull, [objNull]]
];

try
{
	if (isNull _vehicle) throw false;
	if !(alive _vehicle) throw false;
	if !([player] call lilc_common_fnc_isAlive) throw false;
	if !([_vehicle, ["LandVehicle"]] call lilc_common_fnc_isKindOf) throw false;
	if ((locked _vehicle) != 0) throw false;
	if ((_vehicle getVariable ["lilc_picklock_steeringWheelLock", 0]) <= 0) throw false;

	throw true;
}
catch
{
	_exception;
};
