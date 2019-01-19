
[
    "lilc_setting_ui_enableHints",
    "CHECKBOX",
    "Benachrichtigungen anzeigen", //TODO: localize
    "LiveInLife",
    true,
    0,
    {
        if (_this) then {
            call lilc_ui_fnc_enableHints;
        } else {
            call lilc_ui_fnc_disableHints;
        };
    }
] call CBA_Settings_fnc_init;

[
    "lilc_ui_hintDisplayTime",
    "SLIDER",
    "Notification time",
    "LiveInLife",
    [1, 60, 6, 0]
] call CBA_Settings_fnc_init;
