
lilc_time_enable = true;
lilc_time_events_enable = true;
lilc_time_currentTime = [0, 0, 0, 0, 0, 0];
lilc_time_events = ([[]] call CBA_fnc_hashCreate);

[
    "lilc_time_enable",
    "CHECKBOX",
    ["Enable time package", "Enables the time packages"],
    "LiveInLife Time",
    true,
    1
] call CBA_Settings_fnc_init;

[
    "lilc_time_events_enable",
    "CHECKBOX",
    ["Enable time events", "Enables time events."],
    "LiveInLife Time",
    true,
    1
] call CBA_Settings_fnc_init;
