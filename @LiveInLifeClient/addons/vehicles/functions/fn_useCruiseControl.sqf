
/*
lilc_vehicles_cruiseControl_vehicle = objNull;
lilc_vehicles_cruiseControl_handle = scriptNull;
lilc_vehicles_cruiseControl_onEachFrameEVH = "";
lilc_vehicles_cruiseControl_handleDamageEVH = 0;
lilc_vehicles_cruiseControl_wantedSpeed = 0;
*/

try
{
	private _vehicle = (vehicle player);

	if (_vehicle == player) throw false;
	if !(isNull lilc_vehicles_cruiseControl_handle) then
	{
		[lilc_vehicles_cruiseControl_onEachFrameEVH, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		lilc_vehicles_cruiseControl_vehicle removeEventHandler ["HandleDamage", lilc_vehicles_cruiseControl_handleDamageEVH];

		["Tempomat ausgeschaltet.", "WARNING"] call lilc_ui_fnc_hint;
		throw false;
	};
	
	lilc_vehicles_cruiseControl_vehicle = (vehicle player);
	lilc_vehicles_cruiseControl_wantedSpeed = (speed lilc_vehicles_cruiseControl_vehicle);
	lilc_vehicles_cruiseControl_onEachFrameEVH = ([
		"lilc_vehicles_cruiseControl",
		"onEachFrame",
		{
			if
			(
				!([player] call lilc_common_fnc_isAlive) ||
				isNull lilc_vehicles_cruiseControl_vehicle ||
				!(alive lilc_vehicles_cruiseControl_vehicle) ||
				((vehicle player) != lilc_vehicles_cruiseControl_vehicle)
			)
			then
			{
				[lilc_vehicles_cruiseControl_onEachFrameEVH, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
				lilc_vehicles_cruiseControl_vehicle removeEventHandler ["HandleDamage", lilc_vehicles_cruiseControl_handleDamageEVH];
			};

			if (isTouchingGround lilc_vehicles_cruiseControl_vehicle) then
			{
				lilc_vehicles_cruiseControl_vehicle setVelocityModelSpace [0, (lilc_vehicles_cruiseControl_wantedSpeed / 3.6), 0];
			};
		}
	] call BIS_fnc_addStackedEventHandler);

	lilc_vehicles_cruiseControl_handleDamageEVH = (lilc_vehicles_cruiseControl_vehicle addEventHandler [
		"HandleDamage",
		{
			[lilc_vehicles_cruiseControl_onEachFrameEVH, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		}
	]);

	[(format["Tempomat eingeschaltet (%1 km/h)", (speed _vehicle)]), "WARNING"] call lilc_ui_fnc_hint;
}
catch
{
	_exception;
};
