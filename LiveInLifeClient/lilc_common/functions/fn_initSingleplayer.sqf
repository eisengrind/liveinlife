
startLoadingScreen ["Loading mission file"];

//call lilc_common_fnc_globalVariables;
progressLoadingScreen 0.2;

call lilc_sitting_fnc_getSeatClassnames;
progressLoadingScreen 0.4;

call lilc_settings_fnc_initKey;
call lilc_events_fnc_init;
progressLoadingScreen 0.6;

call lilc_textures_fnc_init;
progressLoadingScreen 0.8;

[] spawn lilc_ui_fnc_initPlayerGUI;

endLoadingScreen;
