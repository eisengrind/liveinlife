
params [
	["_vehicle", objNull, [objNull]],
	["_upgradeName", "", [""]]
];

try
{
	if (isNull _vehicle) throw "";
	if !(alive _vehicle) throw "";
	if (_upgradeName == "") throw "";
	if !([_vehicle, _upgradeName] call lilc_vehicles_fnc_hasUpgrade) throw "";

	private _upgrades = (_vehicle getVariable ["lilc_vehicles_upgrades", []]);
	{
		if ((_x select 0) == _upgradeName) exitWith
		{
			_upgrades deleteAt _forEachIndex;
			(_vehicle setVariable ["lilc_vehicles_upgrades", _upgrades]);
			throw _upgradeName;
		};
	} forEach _upgrades;

	throw "";
}
catch
{
	_exception;
};
