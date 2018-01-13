
if !(isNil "lilc_hud_handle") exitWith {};

["lilc_hud_hud", "lilc_hud", 0, false] call lilc_ui_fnc_fadeInTitles;

lilc_hud_handle = ([
    {
        call lilc_hud_fnc_update;
    },
    10
] call CBA_fnc_addPerFrameHandler);
