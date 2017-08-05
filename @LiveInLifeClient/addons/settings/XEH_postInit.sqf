
player addEventHandler [
	"GetInMan",
	{
		params [
			["_unit", objNull, [objNull]],
			["_position", "", [""]],
			["_vehicle", objNull, [objNull]]
		];

		switch true do
		{
			case (_vehicle isKindOf "LandVehicle"):
			{
				["wheeled", lilc_settings_viewDistance_wheeled] call lilc_settings_fnc_setViewDistance;
				["wheeled", lilc_settings_viewDistance_wheeled_objects] call lilc_settings_fnc_setObjectViewDistance;
			};

			case (_vehicle isKindOf "Air"):
			{
				["air", lilc_settings_viewDistance_air] call lilc_settings_fnc_setViewDistance;
				["air", lilc_settings_viewDistance_air_objects] call lilc_settings_fnc_setObjectViewDistance;
			};

			default
			{
				["foot", lilc_settings_viewDistance_foot] call lilc_settings_fnc_setViewDistance;
				["foot", lilc_settings_viewDistance_foot_objects] call lilc_settings_fnc_setObjectViewDistance;
			};
		};
	}
];

player addEventHandler [
	"GetOutMan",
	{
		["foot", lilc_settings_viewDistance_foot] call lilc_settings_fnc_setViewDistance;
		["foot", lilc_settings_viewDistance_foot_objects] call lilc_settings_fnc_setObjectViewDistance;
	}
];
