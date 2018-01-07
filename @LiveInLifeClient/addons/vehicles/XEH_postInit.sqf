
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
		lilc_vehicles_engineEHIndex = _vehicle addEventHandler ["Engine",{
				params ["_vehicle", "_status"];
					If (_status) then {
					_vehicle engineOn false} 
				else {
					If ([_vehicle] call lilc_keys_fnc_have) then {
						_vehicle engineOn false} 
					else {
						If (_vehicle getVariable lilc_vehicle_islocked) then {
							_vehicle engineOn true};
						} else {
						[("Du hast keinen Schluessel." call BIS_fnc_localize), "ERROR"] call lilc_ui_fnc_hint;
						};
					};
				};
			];
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
		_vehicle removeEventHandler ["Engine", lilc_vehicles_engineEHIndex];
	}
];
