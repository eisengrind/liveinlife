
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

[
    "lilc_common_enablePreload",
    "CHECKBOX",
    "Enables preloading after login screen.", //TODO: localize
    "LiveInLife",
    true
] call CBA_Settings_fnc_init;

lilc_common_logicCenter = createCenter sideLogic;
lilc_common_logicGroup = createGroup [lilc_common_logicCenter, false];
