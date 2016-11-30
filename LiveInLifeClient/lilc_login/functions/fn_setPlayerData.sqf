
_result = param [0, [], [[]]];

if ((count _result) != 16) exitWith { endMission "END6"; };

lilc_player_ID = _result select 0;
lilc_player_steam64ID = _result select 1;
lilc_player_thirst = _result select 2;
lilc_player_hunger = _result select 3;
lilc_player_cash = _result select 4;
lilc_player_endurance = _result select 5;
lilc_player_gear = _result select 6;
lilc_player_jobs = _result select 7;
lilc_player_npcs = _result select 8;
lilc_player_isNew = _result select 9;
lilc_player_lastPosition = _result select 10;
lilc_player_gender = _result select 11;
lilc_player_faction = [(_result select 12), (([(_result select 12)] call lilc_common_fnc_getFactionConfig) select 0), (([(_result select 12)] call lilc_common_fnc_getFactionConfig) select 4)];
lilc_player_charisma = _result select 13;

[player, lilc_player_gear] call lilc_inventory_fnc_setInventory;

// gender, firstname, lastname, plz, town, street, streetnumber, age, eyecolor, haircolor
player setVariable ["lilc_identity", [lilc_player_gender, (_result select 14), (_result select 15), "", "", "", "", "", "", ""], true];
