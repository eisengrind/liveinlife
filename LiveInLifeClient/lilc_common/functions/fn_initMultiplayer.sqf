
0 fadeSound 0;
0 fadeMusic 0;

["initializing Multiplayer", "lilc_common"] call lilc_common_fnc_diag_log;
startLoadingScreen ["Loading mission file"];

private _timeout = 0;
_timeout = 30 + time;
waitUntil { (alive player && !isNull player) || (_timeout <= time) };
if (_timeout <= time) exitWith { endMission "END6"; };

waitUntil { (lils_extDB2_ID_1 != 0) && (lils_extDB2_ID_2 != 0) };
["extDB2 was loaded on server", "lilc_common"] call lilc_common_fnc_diag_log;
if (lils_extDB2_ID_1 == 2) exitWith { endMission "END6"; };
if (lils_extDB2_ID_2 == 2) exitWith { endMission "END6"; };
["extDB2 IS loaded on server", "lilc_common"] call lilc_common_fnc_diag_log;
progressLoadingScreen 0.1;

//["", "lilc_common"] call lilc_common_fnc_diag_log;
//call lilc_common_fnc_globalVariables;
progressLoadingScreen 0.2;

["initialize eventhandlers", "lilc_common"] call lilc_common_fnc_diag_log;
call lilc_settings_fnc_initKey;
call lilc_events_fnc_init;
progressLoadingScreen 0.3;

["initializing head up display", "lilc_common"] call lilc_common_fnc_diag_log;
[] spawn lilc_events_fnc_escapeInterrupt;
[] spawn lilc_ui_fnc_initPlayerGUI;
//[] spawn LiveInLifeClient_gui_fnc_playerStats;
progressLoadingScreen 0.4;

["requesting login data", "lilc_common"] call lilc_common_fnc_diag_log;
call lilc_login_fnc_getAccountData;
call lilc_farming_fnc_init;
call lilc_ui_fnc_init;

_timeout = 10 + time;
waitUntil { ((count lilc_login_accountInformation) > 0) || (_timeout <= time) };
if (_timeout <= time) exitWith { endLoadingScreen; endMission "END6"; };

uiSleep 1;
progressLoadingScreen 0.6;

//["", "lilc_common"] call lilc_common_fnc_diag_log;
// "src\sqf\player\model\addActions.sqf";
//progressLoadingScreen 0.7;

["initializing other important declarations", "lilc_common"] call lilc_common_fnc_diag_log;
call lilc_sitting_fnc_getSeatClassnames; //compile preProcessFileLineNumbers "src\sqf\player\action\sitting\getSeatClassnames.sqf";
progressLoadingScreen 1;
uiSleep 1;
endLoadingScreen;
0.5 fadeMusic 1;
