
player addEventHandler [
	"GetInMan",
	{
		params [
			["_unit", objNull, [objNull]],
			["_position", "", [""]],
			["_vehicle", objNull, [objNull]]
		];

		switch (true) do
		{
			case (_vehicle isKindOf "LandVehicle"):
			{
				setViewDistance lilc_viewDistance_foot;
				setObjectViewDistance lilc_viewDistance_foot_objects;
			};

			case (_vehicle isKindOf "Air"):
			{
				setViewDistance lilc_viewDistance_wheeled;
				setObjectViewDistance lilc_viewDistance_wheeled_objects;
			};

			default
			{
				setViewDistance lilc_viewDistance_air;
				setObjectViewDistance lilc_viewDistance_air_objects;
			};
		};
	}
];

player addEventHandler [
	"GetOutMan",
	{
		setViewDistance lilc_viewDistance_foot;
		setObjectViewDistance lilc_viewDistance_foot_objects;
	}
];
