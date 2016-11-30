
call compile preProcessFileLineNumbers "\lilc_common\KRON_Strings.sqf";
call lilc_common_fnc_globalVariables;
call lilc_common_fnc_initVariables;

if ((isMultiplayer && !isDedicated && !isServer && hasInterface) || !isMultiplayer) then {

	[0.01] call lilc_ui_fnc_fadeInBlack;
	if (isMultiplayer) then {
		["Multiplayer selected", "lilc_common"] call lilc_common_fnc_diag_log;
		call lilc_common_fnc_initMultiplayer;

		//TODO: Insert Intro from Eisengrind.

		call lilc_common_fnc_initPlayer;
	} else {
		["Singleplayer selected", "lilc_common"] call lilc_common_fnc_diag_log;
		call lilc_common_fnc_initSingleplayer;
		[2] call lilc_ui_fnc_fadeInBlack;
	};
};
