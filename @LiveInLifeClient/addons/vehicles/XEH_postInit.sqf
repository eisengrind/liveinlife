
player addEventHandler [
	"GetInMan",
	{
		params [
			["_unit", objNull, [objNull]],
			["_position", "", [""]],
			["_vehicle", objNull, [objNull]]
		];

		if (_position == "driver") then
		{
			lilc_vehicles_lastVehicle = _vehicle;
		};
	}
];

player addEventHandler [
	"GetInMan",
	{
    	if ([(_this select 2), ["Air", "Aircraft", "Plane", "Helicopter"]] call lilc_common_fnc_isKindOf) then
		{
        	call lilc_ui_fnc_enableAircraftInfo;
    	};
	}
];

player addEventHandler [
	"GetOutMan",
	{
		if ([(_this select 2), ["Air", "Aircraft", "Plane", "Helicopter"]] call lilc_common_fnc_isKindOf) then
		{
			call lilc_ui_fnc_disableAircraftInfo;
		};
	}
];
