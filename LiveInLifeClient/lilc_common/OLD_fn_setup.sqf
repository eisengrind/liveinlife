diag_log " * setting reallife mod up";
startLoadingScreen ["Loading mission file"];

_timeout = 30 + time;
waitUntil { (alive player && !isNull player) || (_timeout <= time) };
if (_timeout <= time) exitWith { endMission "END6"; };

waitUntil { (LiveInLifeServer_extDB2_ID_1 || ((typeName LiveInLifeServer_extDB2_ID_1) == (typeName ""))) && (LiveInLifeServer_extDB2_ID_2 || ((typeName LiveInLifeServer_extDB2_ID_2) == (typeName ""))) };
diag_log " * extDB2 status received";
if (((typeName LiveInLifeServer_extDB2_ID_1) == (typeName ""))) exitWith { endMission "END6"; };
if (((typeName LiveInLifeServer_extDB2_ID_2) == (typeName ""))) exitWith { endMission "END6"; };
diag_log " * extDB2 is initialized";
progressLoadingScreen 0.1;

diag_log " * define mission variables";
call LiveInLifeClient_fnc_globalVariables;
progressLoadingScreen 0.2;

diag_log " * setting up local eventhandlers";
call LiveInLifeClient_eventhandler_fnc_init;
progressLoadingScreen 0.3;

diag_log " * starting hud loops";
[] spawn LiveInLifeClient_eventhandler_fnc_escapeInterrupt;
[] spawn LiveInLifeClient_gui_fnc_playerGUI;
//[] spawn LiveInLifeClient_gui_fnc_playerStats;
progressLoadingScreen 0.4;

diag_log " * requesting login data";
call LiveInLifeClient_account_fnc_getAccountData;
waitUntil { !isNil "LiveInLifeClient_accountInformation"; };
progressLoadingScreen 0.6;

diag_log " * addactions will be available soon...";
// "src\sqf\player\model\addActions.sqf";
progressLoadingScreen 0.8;

diag_log " * initializing additional script declarations...";
call LiveInLifeClient_action_fnc_getSeatClassnames; //compile preProcessFileLineNumbers "src\sqf\player\action\sitting\getSeatClassnames.sqf";
progressLoadingScreen 0.9;
diag_log " * initializing texture handler";
call LiveInLifeClient_texture_fnc_init; //compile preProcessFileLineNumbers "src\sqf\textures\initialize.sqf";
progressLoadingScreen 1;
endLoadingScreen;
