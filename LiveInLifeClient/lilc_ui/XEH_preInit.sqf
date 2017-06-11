
lilc_ui_hint_lastControls = [];

[
	"lilce_common_initPlayer_afterPreload",
	{
		call lilc_ui_fnc_enableHints;
	}
] call CBA_fnc_addEventHandler;

[
	"lilc_ui_enableHints",
	"CHECKBOX",
	"Benachrichtigungen anzeigen", //TODO: localize
	"LiveInLife",
	true,
	0,
	{
		if (_this) then
		{
			call lilc_ui_fnc_enableHints;
		}
		else
		{
			call lilc_ui_fnc_disableHints;
		};

		profileNamespace setVariable ["lilc_ui_enableHints", _this];
		saveProfileNamespace;
	}
] call CBA_Settings_fnc_init;

[
	"lilc_ui_hintDisplayTime",
	"SLIDER",
	"Notification time",
	"LiveInLife",
	[1, 60, 10, 0],
	0,
	{
		profileNamespace setVariable ["lilc_ui_hintDisplayTime", _this];
		saveProfileNamespace;
	}
] call CBA_Settings_fnc_init;
