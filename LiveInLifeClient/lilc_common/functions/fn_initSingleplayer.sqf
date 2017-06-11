
/*
    Filename:
        fn_initSingleplayer.sqf
    Author:
        Vincent Heins
    Description:
        Initialization of the singleplayer scripts. Not finished yet... But it should be usable.
    Param(s):
        -
    Result(s):
        -
*/

//call lilc_common_fnc_globalVariables;

call lilc_sitting_fnc_getSeatClassnames;

call lilc_settings_fnc_initKey;
call lilc_events_fnc_init;

call lilc_textures_fnc_init;
[] spawn lilc_inventory_fnc_init;
