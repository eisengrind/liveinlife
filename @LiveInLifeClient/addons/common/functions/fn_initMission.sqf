
/*
    Filename:
        fn_initMission.sqf
    Author:
        Vincent Heins
    Description:
        It is the second script (after fn_init.sqf) which will be executed. In this script the distinction between Single- and Multiplayer initialization begins.
    Param(s):
        -
    Result(s):
        -
*/

lilc_finished = false;

[0.01] call lilc_ui_fnc_fadeInBlack;

if (isMultiplayer) then {
    waitUntil { !(call BIS_fnc_isLoading); };

    ["Multiplayer selected", "lilc_common"] call lilc_log_fnc_diag_log;
    ["initializing mission", "lilc_common"] call lilc_log_fnc_diag_log;

    0 fadeSound 0;
    0 fadeMusic 0;

    player allowDamage false;
    player hideObjectGlobal true;

    waitUntil { !(isNull player); };

    [0.1] call lilc_ui_fnc_enableLoadingIcon;
    [(format["waiting for server to be ready... (%1)", ([60, "HH:MM:SS"] call BIS_fnc_secondsToString)])] call lilc_ui_fnc_setLoadingText;
    [(format["waiting for server to be ready... (%1)", ([60, "HH:MM:SS"] call BIS_fnc_secondsToString)]), "lilc_common"] call lilc_log_fnc_diag_log;

    private _time = (time + 60);
    while {
        !lils_finished ||
        (_time <= time)
    } do {
        [(format["waiting for server to be ready... (%1)", ([_time - time, "HH:MM:SS"] call BIS_fnc_secondsToString)])] call lilc_ui_fnc_setLoadingText;
        sleep 0.5;
    };

    if (_time <= time) exitWith {
        endMission "END6";
    };

    ["executing pre account init eventhandler"] call lilc_ui_fnc_setLoadingText;
    [
        "lilce_login_preAccountInit",
        [player]
    ] call CBA_fnc_localEvent;

    call lilc_ui_fnc_disableLoadingIcon;
    call lilc_login_fnc_init;
    [0.1] call lilc_ui_fnc_enableLoadingIcon;

    ["executing post account init eventhandler"] call lilc_ui_fnc_setLoadingText;
    [
        "lilce_login_postAccountInit",
        [player]
    ] call CBA_fnc_localEvent;

    ["preloading environment"] call lilc_ui_fnc_setLoadingText;

    if (lilc_common_enablePreload) then {
        waitUntil {
            (100 preloadObject player)
        };
        sleep 20;

        waitUntil {
            (preloadCamera position player)
        };
    };

    call lilc_respawn_fnc_selectRespawn;

    sleep 2;

    ["executing pre finished eventhandler"] call lilc_ui_fnc_setLoadingText;
    [
        "lilce_common_preFinished",
        [player]
    ] call CBA_fnc_localEvent;

    call lilc_ui_fnc_disableLoadingIcon;

    player allowDamage true;
    player hideObjectGlobal false;

    ["executing post finished eventhandler"] call lilc_ui_fnc_setLoadingText;
    [
        "lilce_common_postFinished",
        [player]
    ] call CBA_fnc_localEvent;

    [2] call lilc_ui_fnc_fadeOutBlack;
    lilc_finished = true;
    ["mission initialized", "lilc_common"] call lilc_log_fnc_diag_log;
} else {
    ["Singleplayer selected", "lilc_common"] call lilc_log_fnc_diag_log;
    //["lilce_common_initPlayer"] call CBA_fnc_localEvent;
    [2] call lilc_ui_fnc_fadeOutBlack;
};
