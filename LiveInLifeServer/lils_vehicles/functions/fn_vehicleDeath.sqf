
params [
	["_vehicle", objNull, [objNull]],
	["_killer", objNull, [objNull]]
];

try
{
	if (isNull _vehicle) throw false;
	if (alive _vehicle) throw false;

	_vehicle setVariable ["lilc_cleanupTimeout", (time + (60 * 60))];

	private _vehicleID = (_vehicle getVariable ["lilc_vehicleID", 0]);
	if (_vehicleID <= 0) throw false;

	[([
		"VEHICLES_DATA",
		[
			["DEAD", 1]
		],
		[
			["ID", _vehicleID]
		]
	] call lils_databse_fnc_generateUpdateQuery)] call lils_database_fnc_query;
}
catch
{
	_exception;
};
