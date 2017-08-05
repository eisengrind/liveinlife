
params [
	["_vehicle", objNull, [objNull]]
];

try
{
	if (isNull _vehicle) throw false;
	if !(alive _vehicle) throw false;
	if !([player] call lilc_common_fnc_isAlive) throw false;
	if !(isNull lilc_picklock_doPickLockEngineIgnition_task) throw false;
	if ((locked _vehicle) != 0) throw false;
	if ((_vehicle getVariable ["lilc_picklock_picklocked", 0]) <= 0) throw false;
	if ((_vehicle getVariable ["lilc_picklock_engineIgnitionPicklocked", 0]) > 0) throw false;
	if ((["lilci_screwdriver_F", player] call lilc_inventory_fnc_itemCount) <= 0 || (["lilci_drill_F"] call lilc_inventory_fnc_itemCount) <= 0) throw false;

	throw true;
}
catch
{
	_exception;
};
