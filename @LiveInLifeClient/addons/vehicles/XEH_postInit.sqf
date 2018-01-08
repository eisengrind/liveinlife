
player addEventHandler ["GetInMan", {
	params [
		["_unit", objNull, [objNull]],
		["_position", "", [""]],
		["_vehicle", objNull, [objNull]]
	];

	if (_position == "driver") then
	{
		lilc_vehicles_lastVehicle = _vehicle;
	};
	
	lilc_vehicles_engineEHIndex = (_vehicle addEventHandler ["Engine", {
		params [
			"_vehicle",
			"_status"
		];
		
		if (
			!([_vehicle] call lilc_keys_fnc_have) &&
			((_vehicle getVariable ["lilc_picklock_picklocked", 0]) <= 0) &&
			_status &&
			(player isEqualTo (driver _vehicle))
		) then {
			_vehicle engineOn false;
		};
	}]);
	
	if ([_vehicle, ["Air", "Aircraft", "Plane", "Helicopter"]] call lilc_common_fnc_isKindOf) then
	{
		call lilc_ui_fnc_enableAircraftInfo;
	};
}];

player addEventHandler ["GetOutMan", {
	params [
		"_unit",
		"_position",
		"_vehicle"
	];
	
	if ([_vehicle, ["Air", "Aircraft", "Plane", "Helicopter"]] call lilc_common_fnc_isKindOf) then
	{
		call lilc_ui_fnc_disableAircraftInfo;
	};
	
	_vehicle removeEventHandler ["Engine", lilc_vehicles_engineEHIndex];
}];
