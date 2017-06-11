
/*
    Filename:
        fn_initMultiplayer.sqf
    Author:
        Vincent Heins
    Description:
        This HAVE TO BE the multiplayer init!
    Param(s):
        -
    Result(s):
        -
*/

0 fadeSound 0;
0 fadeMusic 0;

player allowDamage false;
player hideObjectGlobal true;

[0.1] call lilc_ui_fnc_enableLoadingIcon;
[(format["initializing Multiplayer (%1)", ([60] call lilc_common_fnc_secondsToDigital)])] call lilc_ui_fnc_setLoadingText;
[(format["initializing Multiplayer (%1)", ([60] call lilc_common_fnc_secondsToDigital)]), "lilc_common"] call lilc_common_fnc_diag_log;

private _time = (time + 60);
while
{
    !lils_finished ||
    (_time <= time)
}
do
{
    [(format["initializing Multiplayer (%1)", ([_time - time] call lilc_common_fnc_secondsToDigital)])] call lilc_ui_fnc_setLoadingText;
    [(format["initializing Multiplayer (%1)", ([_time - time] call lilc_common_fnc_secondsToDigital)]), "lilc_common"] call lilc_common_fnc_diag_log;
    sleep 1;
};

if (_time < time) exitWith
{
    endMission "END6";
};

uiSleep 2;

["initializing eventhandlers"] call lilc_ui_fnc_setLoadingText;
["initialize eventhandlers", "lilc_common"] call lilc_common_fnc_diag_log;
call lilc_settings_fnc_init;
//call lilc_settings_fnc_initKey;
call lilc_events_fnc_init;

["requesting login data"] call lilc_ui_fnc_setLoadingText;
["requesting login data", "lilc_common"] call lilc_common_fnc_diag_log;
call lilc_farming_fnc_init;
call lilc_ui_fnc_init;

call lilc_inventory_fnc_init;

["initializing resumed"] call lilc_ui_fnc_setLoadingText;
["initializing other important declarations", "lilc_common"] call lilc_common_fnc_diag_log;
0.5 fadeMusic 1;
