
["lilc_hud_hud", 0] call lilc_ui_fnc_fadeOutTitles;

if !(isNil "lilc_hud_handle") then {
    [lilc_hud_handle] call CBA_fnc_removePerFrameHandler;
};

lilc_hud_handle = nil;
