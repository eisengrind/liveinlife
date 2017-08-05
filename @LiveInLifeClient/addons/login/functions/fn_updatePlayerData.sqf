
[] call lilc_login_fnc_executeUpdatePackages;

/*
0 id
1 steam64id
2 thirst
3 hunger
4 cash
5 endurance
6 gear
7 npcs
8 lastPosition
9 charisma
10 bankAccounts
11 virtualGear
12 status
13 statusTimeout
14 permissions
15 respawning
16 respawnTimeout
17 health
*/

/*private _data = [];

_data pushBack lilc_player_ID;
_data pushBack lilc_player_steam64ID;
_data pushBack lilc_player_thirst;
_data pushBack lilc_player_hunger;
_data pushBack lilc_player_cash;
_data pushBack lilc_player_endurance;
lilc_player_gear = ([player] call lilc_inventory_fnc_getInventory);
_data pushBack lilc_player_gear;
_data pushBack lilc_player_npcs;
lilc_player_lastPosition = ([player] call lilc_common_fnc_getPosition);
_data pushBack lilc_player_lastPosition;
_data pushBack lilc_player_charisma;
_data pushBack lilc_bank_accounts;
//_data pushBack [0, 0, 0, 0, 0, 0, 0];[lilc_player_coveredDistance_stand, lilc_player_coveredDistance_crouch, lilc_player_coveredDistance_prone, lilc_player_coveredDistance_swimming, lilc_player_coveredDistance_car, lilc_player_coveredDistance_air, lilc_player_coveredDistance_boat];
_data pushBack (player getVariable ["lilc_virtualInventory_inventory", []]);
if (isNil "lilc_player_status") then { lilc_player_status = 0; };
_data pushBack lilc_player_status;
_data pushBack lilc_player_statusTimeout;
_data pushBack lilc_permissions_permissions;
_data pushBack (parseNumber lilc_respawn_isRespawning);
_data pushBack lilc_respawn_currentTimeout;
_data pushBack lilc_prison_waitingTime;
_data pushBack lilc_prison_escapeTime;
_data pushBack lilc_prison_currentPunishment;
_data pushBack ([player] call lilc_common_fnc_getACEDamage);

private _additionalData = [];

[[player, _data, _additionalData], "lils_login_fnc_updatePlayerData"] call lilc_common_fnc_sendToServer;*/
