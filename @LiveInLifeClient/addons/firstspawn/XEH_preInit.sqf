
[
	"lilc_setting_firstspawn_deactivateIntro",
	"CHECKBOX",
	["Intro deaktivieren", "Einstiegsintro deaktivieren"], //TODO: localize
	"LiveInLife",
	false,
	0,
	{}
] call CBA_Settings_fnc_init;

[
	"lilce_respawn_firstspawn",
	{
		params [
			["_unit", objNull, [objNull]]
		];

		[""] call lilc_ui_fnc_setLoadingText;
		private _handle = [] spawn lilc_firstspawn_fnc_init;
		waitUntil
		{
			scriptDone _handle;
		};
		[0.1] call lilc_ui_fnc_enableLoadingIcon;

		[player, player] call ACE_medical_fnc_treatmentAdvanced_fullHealLocal;
		player setDamage 0;
	}
] call CBA_fnc_addEventHandler;
