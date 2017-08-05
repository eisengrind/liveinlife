
params [
	["_vehicle", objNull, [objNull]]
];

(
	((_vehicle getVariable ["lilc_accountID", 0]) > 0) &&
	((_vehicle getVariable ["lilc_vehicleID", 0]) > 0) &&
	((_vehicle getVariable ["lilc_steam64ID", ""]) != "")
);
