
lilc_ui_hudRefresh_handle = nil;
lilc_ui_hudCurrentHealth = 0;
lilc_ui_hudCurrentCash = 0;
lilc_ui_hudCurrentHunger = 0;
lilc_ui_hudCurrentThirst = 0;
lilc_ui_hudTransparency = 1;
lilc_ui_disableUserInput_KeyDown_index = -1;
lilc_action_active = false;
lilc_action_interrupted = false;
lilc_ui_hint_lastControls = [];

[
	"lilce_common_postFinished",
	{
		call lilc_ui_fnc_enableHints;
		call lilc_ui_fnc_enableHud;
	}
] call CBA_fnc_addEventHandler;

[
	"lilc_setting_ui_enableHints",
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
	}
] call CBA_Settings_fnc_init;

[
	"lilc_setting_ui_hint_displayTime",
	"SLIDER",
	"Notification time",
	"LiveInLife",
	[1, 60, 6, 0],
	0,
	{}
] call CBA_Settings_fnc_init;
