
private ["_groupID", "_groupConfig", "_camera"];
[2] call lilc_ui_fnc_fadeInBlack;
call lilc_ui_fnc_disableHUD;

lilc_player_isRespawning = true;
_groupID = (lilc_player_faction select 0);
_name = "";

if (_groupID == -1) then {
    _spawns = [];
    {
        if ([(configName _x), "hospital_"] call KRON_StrInStr) then {
            _spawns pushBack [(configName _x), getArray(_x >> "position")];
        };
    } forEach ("true" configClasses (missionConfigFile >> "CfgStaticPositions"));

    _nearest = 0;
    {
        if (((_x select 1) distance (position lilc_player_corpse)) < (((_spawns select _nearest) select 1) distance (position lilc_player_corpse))) then {
            _nearest = _forEachIndex;
        };
    } forEach _spawns;
    _name = ((_spawns select _nearest) select 0);
} else {
    _groupConfig = ([_groupID] call lilc_common_fnc_getFactionConfig);
    _name = (_groupConfig select 0);
};

if (_name == "") exitWith {};
_spawnPoint = ([_name] call lilc_common_fnc_getStaticPosition);
sleep 2;

showCinemaBorder false;
camUseNVG false;

_camera = [_name] call lilc_respawn_fnc_getRespawnCamera; //TODO: Rewrite cams...
sleep 1;

lilc_player_respawnName = _name;

lilc_player_corpse setVariable ["lilc_corpseTimeout", (time + (60 * 10)), true];
["lilc_hospital"] call lilc_ui_fnc_fadeInTitles;
sleep 1;
[3] call lilc_ui_fnc_fadeOutBlack;
sleep 3;

//call respawn_fnc_respawnWait;
//sleep 1;

[1] call lilc_ui_fnc_fadeOutTitles;
[2] call lilc_ui_fnc_fadeInBlack;
sleep 1;

call lilc_factions_fnc_init;

[lilc_player_respawnName] call lilc_common_fnc_setStaticPosition;
call lilc_ui_fnc_enableHUD;

setViewDistance lilc_settings_viewDistance;

_camera cameraEffect ["terminate", "back"];
camDestroy _camera;
lilc_player_isRespawning = false;

[player] call lilc_inventory_fnc_clearInventory;
call lilc_ui_fnc_fadeOutBlack;


