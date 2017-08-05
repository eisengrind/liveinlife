
params [
	["_vehicle", objNull, [objNull]],
	["_item", "", [""]]
];

try
{
	if (_vehicle == (vehicle player)) throw false;
	if (_vehicle isKindOf "Man") throw false;
	if (isNull _vehicle) throw false;
	if !(alive _vehicle) throw false;
	if (([_item, player] call lilc_inventory_fnc_itemCount) <= 0) throw false;
	if ((locked _vehicle) == 0) throw false;
	if ((_vehicle getVariable ["lilc_picklock_picklocked", 0]) > 0) throw false;
	if !(isNull lilc_picklock_doPickLockVehicle_task) throw false;

	throw true;
}
catch
{
	_exception;
};
