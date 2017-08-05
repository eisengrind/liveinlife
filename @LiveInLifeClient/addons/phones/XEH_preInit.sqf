
lilc_phones_calling = false;

//overwrite keybind
[
	"TFAR",
	"SWTransmit",
	["SW Transmit","SW Transmit"],
	{
		if !(lilc_phones_holdPressed) then {
			call TFAR_fnc_onSwTangentPressed;
		};
	},
	{
		if !(lilc_phones_holdPressed) then {
			call TFAR_fnc_onSwTangentReleased;
		};
	},
	[TF_tangent_sw_scancode, TF_tangent_sw_modifiers],
	false
] call cba_fnc_addKeybind;
