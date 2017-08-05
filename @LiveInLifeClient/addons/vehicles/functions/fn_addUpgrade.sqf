
params [
	["_vehicle", objNull, [objNull]],
	["_upgradeName", "", [""]],
	["_data", nil]
];

try
{
	if (isNull _vehicle) throw "";
	if !(alive _vehicle) throw "";
	if (_upgradeName == "") throw "";
	if ([_vehicle, _upgradeName] call lilc_vehicles_fnc_hasUpgrade) throw "";

	_vehicle setVariable ["lilc_vehicles_upgrades", ((_vehicle getVariable ["lilc_vehicles_upgrades", []]) pushBack [_upgradeName, _data]), true];
	throw _upgradeName;
}
catch
{
	_exception;
};
