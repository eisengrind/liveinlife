
[
	"lilce_keys_use_closed",
	{
		params [
			["_vehicle", objNull, [objNull]],
			["_unit", objNull, [objNull]],
			["_isGlobalKey", false, [false]]
		];

		if ((_vehicle getVariable ["lilc_picklock_picklocked", 0]) > 0) then
		{
			_vehicle setVariable ["lilc_picklock_picklocked", 0, true];
		};
	}
] call CBA_fnc_addEventHandler;
