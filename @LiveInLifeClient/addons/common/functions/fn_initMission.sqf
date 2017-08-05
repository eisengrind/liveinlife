
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
	["Multiplayer selected", "lilc_common"] call lilc_common_fnc_diag_log;
	["initializing mission", "lilc_common"] call lilc_common_fnc_diag_log;
	
	0 fadeSound 0;
	0 fadeMusic 0;

	player allowDamage false;
	player hideObjectGlobal true;

	waitUntil
	{
		!(call BIS_fnc_isLoading);
	};

	waitUntil
	{
		!(isNull player);
	};

	[0.1] call lilc_ui_fnc_enableLoadingIcon;
	[(format["waiting for server to be ready... (%1)", ([60, "HH:MM:SS"] call BIS_fnc_secondsToString)])] call lilc_ui_fnc_setLoadingText;
	[(format["waiting for server to be ready... (%1)", ([60, "HH:MM:SS"] call BIS_fnc_secondsToString)]), "lilc_common"] call lilc_common_fnc_diag_log;

	waitUntil
	{
		!(call BIS_fnc_isLoading);
	};

	private _time = (time + 60);
	while
	{
		!lils_finished ||
		(_time <= time)
	}
	do
	{
		[(format["waiting for server to be ready... (%1)", ([_time - time, "HH:MM:SS"] call BIS_fnc_secondsToString)])] call lilc_ui_fnc_setLoadingText;
		sleep 0.5;
	};

	if (_time <= time) exitWith
	{
		endMission "END6";
	};

	if !(profileNamespace getVariable ["lilc_joinIntroOff", false]) then
	{
		private _handle = ([] spawn {
			scriptName "lilc_common_creditsIntro";
			call lilc_common_fnc_creditsIntro;
		});
		
		waitUntil
		{
			(scriptDone _handle);
		};
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

	call lilc_respawn_fnc_selectRespawn;

	["executing pre finished eventhandler"] call lilc_ui_fnc_setLoadingText;
	[
		"lilce_common_preFinished",
		[player]
	] call CBA_fnc_localEvent;

	["preloading environment"] call lilc_ui_fnc_setLoadingText;
	waitUntil
	{
		(30 preloadObject player)
	};
	sleep 20;

	waitUntil
	{
		(preloadCamera position player)
	};

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
	["mission initialized", "lilc_common"] call lilc_common_fnc_diag_log;
} else {
	call compile preProcessFileLineNumbers "KRON_Strings.sqf";
	["Singleplayer selected", "lilc_common"] call lilc_common_fnc_diag_log;
	//["lilce_common_initPlayer"] call CBA_fnc_localEvent;
	[2] call lilc_ui_fnc_fadeOutBlack;
};
