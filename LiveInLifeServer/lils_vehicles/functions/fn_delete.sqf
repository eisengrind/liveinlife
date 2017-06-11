
params [
	["_unit", objNull, [objNull]],
	["_vehicle", objNull, [objNull]]
];

try
{
	if !([_unit] call lilc_common_fnc_isAlive) throw false;
	if (isNull _vehicle) throw false;
	if !(alive _vehicle) throw false;

	private _vehicleID = (_vehicle getVariable ["lilc_vehicleID", 0]);
	
	if (_vehicleID > 0) then
	{
		[([
			"VEHICLES_DATA",
			[
				["DEAD", 1],
				["ACTIVE", 0]
			],
			[
				["ID", _vehicleID]
			]
		] call lils_database_fnc_generateUpdateQuery)] call lils_database_fnc_query;
	};

	deleteVehicle _vehicle;
}
catch
{
	_exception;
};
