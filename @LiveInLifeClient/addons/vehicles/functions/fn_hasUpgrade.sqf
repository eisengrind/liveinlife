
params [
	["_vehicle", objNull, [objNull]],
	["_upgradeName", "", [""]]
];

try
{
	if (isNull _vehicle) throw false;
	if !(alive _vehicle) throw false;
	if (_upgradeName == "") throw false;

	if (({ (_upgradeName == (_x select 0)) } count (_vehicle getVariable ["lilc_vehicles_upgrades", []])) == 1) throw true;
	throw false;
}
catch
{
	_exception;
};
