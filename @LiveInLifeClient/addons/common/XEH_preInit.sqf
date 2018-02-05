
call compile preProcessFileLineNumbers "\x\lilc\addons\common\scripts\KRON_Strings.sqf";

[
    "lilce_login_postAccountInit",
    {
        call lilc_factions_fnc_init;
        ["initializing faction group"] call lilc_ui_fnc_setLoadingText;
        ["player group set", "lilc_common"] call lilc_log_fnc_diag_log;
    }
] call CBA_fnc_addEventHandler;

lilc_common_disabledWeapons = [];
lilc_common_defaultPostFinishedIndex = ([
    "lilce_common_postFinished",
    {
        [2] call lilc_ui_fnc_fadeOutBlack;
        2 fadeSound 1;
    }
] call CBA_fnc_addEventHandler);
