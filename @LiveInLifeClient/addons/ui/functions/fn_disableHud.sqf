
["lilc_ui_hud", 0] call lilc_ui_fnc_fadeOutTitles;

if !(isNil "lilc_ui_hudRefresh_handle") then {
    terminate lilc_ui_hudRefresh_handle;
};

lilc_ui_hudRefresh_handle = nil;
