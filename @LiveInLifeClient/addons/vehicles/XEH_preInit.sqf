
lilc_vehicles_lastVehicle = objNull;

//keybindings
[
	"Live In Life",
	"lilck_useKey",
	"Use vehicle key",
	{
		if ((vehicle player) == player) then
		{
			[cursorObject] call lilc_keys_fnc_use;
		}
		else
		{
			[(vehicle player)] call lilc_keys_fnc_use;
		};
	},
	{},
	[22, [false, false, false]]
] call CBA_fnc_addKeybind;
