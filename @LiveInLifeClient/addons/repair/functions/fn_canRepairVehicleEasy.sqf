
params [
	["_vehicle", objNull, [objNull]]
];

(!isNull _vehicle && (alive _vehicle) && !lilc_action_active && !(missionNamespace getVariable ["lilc_repair_vehicle_advanced", false]));
