
lilc_vehicles_cruiseControl_vehicle = objNull;
lilc_vehicles_cruiseControl_handle = scriptNull;
lilc_vehicles_cruiseControl_onEachFrameEVH = "";
lilc_vehicles_cruiseControl_handleDamageEVH = 0;
lilc_vehicles_cruiseControl_wantedSpeed = 0;
lilc_vehicles_lastVehicle = objNull;

if (["vehicles_cruiseControl_enableSetting", "BOOL", false] call lilc_common_fnc_getSetting) then
{
	[
		"Live In Life",
		"lilck_vehicles_useCruiseControl",
		"Use cruise control / auto run",
		{
			[] spawn lilc_vehicles_fnc_useCruiseControl;
		},
		{},
		[
			20,
			[
				false,
				false,
				false
			]
		]
	] call CBA_fnc_addKeybind;
};
