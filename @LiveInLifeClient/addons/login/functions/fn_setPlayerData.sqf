
_result = param [0, [], [[]]];

if ((count _result) != 21) exitWith { lilc_login_loginSuccessful = false;};
lilc_login_loginSuccessful = true;

/*
"ID", // 0
"STEAM64ID", // 1
"THIRST", // 2
"HUNGER", // 3
"CASH", // 4
"ENDURANCE", // 5
"GEAR", // 6
"NPCS", // 7
"NEW", // 8
"LASTPOSITION", // 9
"GENDER", // 10
"`GROUP`", // 11
"CHARISMA", // 12
"FIRSTNAME", // 13
"LASTNAME", // 14
"COVERED_DISTANCE", // 15
"VIRTUALINVENTORY", // 16
"RESPAWNING", // 17
"STATUS", // 18
"PERMISSIONS", // 19
"DEATHTIMEOUT", // 20
"STATUSTIMEOUT" // 21
*/

lilc_player_ID = (_result select 0);
lilc_player_steam64ID = (_result select 1);
lilc_player_thirst = (_result select 2);
lilc_player_hunger = (_result select 3);
lilc_player_cash = (_result select 4);
lilc_player_endurance = (_result select 5);
lilc_player_npcs = (_result select 7);
lilc_player_isNew = (_result select 8);
lilc_player_lastPosition = (_result select 9);
lilc_player_gender = (_result select 10);
lilc_player_faction = [(_result select 11), (([(_result select 11)] call lilc_common_fnc_getFactionConfig) select 0), (([(_result select 11)] call lilc_common_fnc_getFactionConfig) select 4)];
lilc_player_charisma = (_result select 12);
lilc_player_isRespawning = ([(_result select 17)] call lilc_common_fnc_toBool);
lilc_player_status = (_result select 18);
lilc_permissions_permissions = (_result select 19);
lilc_player_deathTimeout = (_result select 20);
lilc_player_statusTimeout = (_result select 21);

private _coveredDistance = (_result select 15);

/*lilc_player_coveredDistance_stand = (_coveredDistance select 0);
lilc_player_coveredDistance_crouch = (_coveredDistance select 1);
lilc_player_coveredDistance_prone = (_coveredDistance select 2);
lilc_player_coveredDistance_swimming = (_coveredDistance select 3);
lilc_player_coveredDistance_car = (_coveredDistance select 4);
lilc_player_coveredDistance_air = (_coveredDistance select 5);
lilc_player_coveredDistance_boat = (_coveredDistance select 6);*/

player setVariable ["lilc_virtualInventory_inventory", (_result select 16), true];

[player, (_result select 6)] call lilc_inventory_fnc_setInventory;

// gender, firstname, lastname
player setVariable ["lilc_identity", [lilc_player_gender, (_result select 13), (_result select 14)], true];
