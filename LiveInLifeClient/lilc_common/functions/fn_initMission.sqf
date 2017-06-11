
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

call compile preProcessFileLineNumbers "\x\lilc\addons\common\KRON_Strings.sqf";
//call lilc_common_fnc_globalVariables;
lilc_finished = false;

[0.01] call lilc_ui_fnc_fadeInBlack;
if (isMultiplayer) then {
	["Multiplayer selected", "lilc_common"] call lilc_common_fnc_diag_log;

	["loading pre-eventhandlers", "lilc_common"] call lilc_common_fnc_diag_log;
	[
		"lilce_common_beforeMultiplayerInitialization",
		[]
	] call CBA_fnc_localEvent;
	["pre-eventhandlers loaded", "lilc_common"] call lilc_common_fnc_diag_log;
	
	["initializing multiplayer", "lilc_common"] call lilc_common_fnc_diag_log;
	call lilc_common_fnc_initMultiplayer;
	sleep 1;

	if !(profileNamespace getVariable ["lilc_joinIntroOff", false]) then
	{
		private _handle = ([] spawn {
			scriptName "lilc_common_creditsIntro";
			call lilc_common_fnc_creditsIntro;
		});
		waitUntil { (scriptDone _handle) };
	};

	call lilc_common_fnc_initPlayer;
} else {
	call compile preProcessFileLineNumbers "KRON_Strings.sqf";
	["Singleplayer selected", "lilc_common"] call lilc_common_fnc_diag_log;
	//["lilce_common_initPlayer"] call CBA_fnc_localEvent;
	[2] call lilc_ui_fnc_fadeOutBlack;
};
