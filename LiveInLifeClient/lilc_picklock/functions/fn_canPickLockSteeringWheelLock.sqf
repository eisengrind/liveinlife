
params [
	["_vehicle", objNull, [objNull]]
];

try
{
	if (isNull _vehicle) throw false;
	if !(alive _vehicle) throw false;
	if !([player] call lilc_common_fnc_isAlive) throw false;
	if !(isNull lilc_picklock_doPickLockSteeringWheelLock) throw false;
	if ((_vehicle getVariable ["lilc_picklock_steeringWheelLock", 0]) <= 0) throw false;
	if ((locked _vehicle) != 0) throw false;
	if ((["lilci_crowbar_F", player] call lilc_inventory_fnc_itemCount) <= 0) throw false;

	throw true;
}
catch
{
	_exception;
};
