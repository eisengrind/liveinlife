
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
