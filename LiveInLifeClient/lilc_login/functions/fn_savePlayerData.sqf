
_data = [];

_data pushBack lilc_player_ID;
_data pushBack lilc_player_steam64ID;
_data pushBack lilc_player_thirst;
_data pushBack lilc_player_hunger;
_data pushBack lilc_player_cash;
_data pushBack lilc_player_endurance;
lilc_player_gear = ([player] call lilc_inventory_fnc_getInventory);
_data pushBack lilc_player_gear;
_data pushBack lilc_player_jobs;
_data pushBack lilc_player_npcs;
lilc_player_lastPosition = [(getPosASL player), direction player];
_data pushBack lilc_player_lastPosition;
_data pushBack lilc_player_charisma;
_data pushBack lilc_bank_accounts;

[[player, _data], "lils_login_fnc_updatePlayerData"] call lilc_common_fnc_sendToServer;
