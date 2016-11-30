
["lilc_ui_loading", 0.01, 502, true] call lilc_ui_fnc_fadeInTitles;
uiSleep (random [1, 2, 4]);
[0.01, 502] call lilc_ui_fnc_fadeOutTitles;
uiSleep 0.1;

call lilc_login_fnc_init;
waitUntil { lilc_account_isFinished };
lilc_account_isFinished = false;

["initializing player", "lilc_common"] call lilc_common_fnc_diag_log;
startLoadingScreen ["Loading Player Data"];

["get player data", "lilc_common"] call lilc_common_fnc_diag_log;
call lilc_login_fnc_getPlayerData;

try {
    _time = time;
    waitUntil { (lilc_player_steam64ID == (getPlayerUID player)) || ((time - _time) > 10) };
    if ((time - _time) > 10) then { throw 0; };
} catch {
    ["mission ended because of no valid player data", "lilc_common", 1] call lilc_common_fnc_diag_log;
    endLoadingScreen;
    endMission "END6";
};

call lilc_factionsInterface_fnc_init;

["player data received", "lilc_common"] call lilc_common_fnc_diag_log;
progressLoadingScreen 0.4;
uiSleep 1;

call lilc_factions_fnc_init;
["player group set", "lilc_common"] call lilc_common_fnc_diag_log;
progressLoadingScreen 0.8;
uiSleep 1;

call lilc_paycheck_fnc_init;

["initialize bankaccounts", "lilc_common"] call lilc_common_fnc_diag_log;
["requesting bankaccounts data", "lilc_common"] call lilc_common_fnc_diag_log;
call lilc_bank_fnc_init;
["bank data requested", "lilc_common"] call lilc_common_fnc_diag_log;
uiSleep 0.5;

call lilc_locker_fnc_init;
uiSleep 0.5;

["initialize texturehandler", "lilc_common"] call lilc_common_fnc_diag_log;
[] spawn lilc_textures_fnc_init;

progressLoadingScreen 1;
uiSleep 1;
endLoadingScreen;

["processing next player spawnpoint", "lilc_common"] call lilc_common_fnc_diag_log;
if ((lilc_player_faction select 0) == -1) then {
    if (lilc_player_isNew == 1) then {
        private _handle = [] spawn lilc_firstspawn_fnc_init;
        waitUntil { scriptDone _handle; };
        //call compile preProcessFileLineNumbers "src\sqf\player\firstspawn\firstspawn.sqf";
    } else {
        call lilc_login_fnc_setLastPosition;
    };
} else {
    if (lilc_player_isNew == 1) then {
        [lilc_player_respawnName] call lilc_common_fnc_setStaticPosition;
    } else {
        if (lilc_player_respawnName != "" || !isNil "lilc_player_respawnName") then {
            call lilc_login_fnc_setLastPosition;
        } else {
            ["mission ended because of a invalid player spawnpoint", "lilc_common", 1] call lilc_common_fnc_diag_log;
            endMission "END6";
        };
    };
};

call lilc_tags_fnc_init;
[2] call lilc_ui_fnc_fadeOutBlack;
2 fadeSound 1;
["player spawned", "lilc_common"] call lilc_common_fnc_diag_log;

//TODO: replace with personalcard
/*player addAction ["Erkannt geben", {
    [[player], "lilc_login_fnc_addKnow;", cursorObject] call lilc_common_fnc_send;
}, "", 0, false, false, "", "!isNull cursorObject && isPlayer cursorObject && alive cursorObject"];*/


lilc_player_HUDEnabled = true;
//TODO: create menu for distances
setViewDistance 8000;

// replace with function
["player initialized", "lilc_common"] call lilc_common_fnc_diag_log;
