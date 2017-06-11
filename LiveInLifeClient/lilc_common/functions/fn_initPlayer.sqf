
/*
    Filename:
        fn_initPlayer.sqf
    Author:
        Vincent Heins
    Description:
        The initialization of the Player itself. It begins with the choosing of an account.
    Param(s):
        -
    Result(s):
        -
*/

waitUntil { !dialog };
call lilc_ui_fnc_disableLoadingIcon;
call lilc_login_fnc_init;
[0.1] call lilc_ui_fnc_enableLoadingIcon;

["selecting spawnpoint"] call lilc_ui_fnc_setLoadingText;
["lilce_common_initPlayer", [(player getVariable ["lilc_accountID", 0]), (player getVariable ["lilc_factionID", -1])]] call CBA_fnc_localEvent;

["processing next player spawnpoint", "lilc_common"] call lilc_common_fnc_diag_log;

if (lilc_player_isRespawning) then
{
    [player, objNull] spawn lilc_respawn_fnc_init;
}
else
{
    if ((lilc_player_faction select 0) == -1) then
    {
        if (lilc_player_isNew == 1) then
        {
            private _filePath = (["firstspawnInit", "STRING", ""] call lilc_common_fnc_getSetting);
            if (_filePath != "") then
            {
                call compile preprocessFileLineNumbers _filePath;
            };
            [""] call lilc_ui_fnc_setLoadingText;
            private _handle = [] spawn lilc_firstspawn_fnc_init;
            waitUntil
            {
                scriptDone _handle;
            };
            [0.1] call lilc_ui_fnc_enableLoadingIcon;
            
            player setvariable ["ace_medical_bodyPartStatus", [0,0,0,0,0,0], true];
            player setDamage 0;
        }
        else
        {
            [player, lilc_player_lastPosition] call lilc_common_fnc_setPosition;
        };
    }
    else
    {
        private _respawnSelection = (lilc_player_respawnName select 0);
        if (lilc_player_isNew == 1) then
        {
            [_respawnSelection] call lilc_common_fnc_setStaticPosition;
        }
        else
        {
            if (_respawnSelection != "" || isNil "_respawnSelection" && ((count lilc_player_lastPosition) == 2)) then
            {
                [player, lilc_player_lastPosition] call lilc_common_fnc_setPosition;
            }
            else
            {
                ["mission ended because of a invalid player spawnpoint", "lilc_common", 1] call lilc_common_fnc_diag_log;
                endMission "END6";
            };
        };
    };
};

lilc_bikes_bikeRented = false;

["lilce_common_initPlayer_beforePreload"] call CBA_fnc_localEvent;

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

["lilce_common_initPlayer_afterPreload"] call CBA_fnc_localEvent;

//[] execFSM "\x\lilc\addons\common\distanceCounter.fsm";

call lilc_ui_fnc_disableLoadingIcon;

player allowDamage true;
player hideObjectGlobal false;

[] execFSM "\x\lilc\addons\food\hungerAndThirst.fsm";

[2] call lilc_ui_fnc_fadeOutBlack;
2 fadeSound 1;
["player spawned", "lilc_common"] call lilc_common_fnc_diag_log;
lilc_finished = true;

call lilc_ui_fnc_enableHud;
["player initialized", "lilc_common"] call lilc_common_fnc_diag_log;
