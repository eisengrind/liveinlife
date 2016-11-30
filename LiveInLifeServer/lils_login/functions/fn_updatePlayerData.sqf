
/*
0 _data pushBack lilc_player_ID;
1 _data pushBack lilc_player_steam64ID;
2 _data pushBack lilc_player_thirst;
3 _data pushBack lilc_player_hunger;
4 _data pushBack lilc_player_cash;
5 _data pushBack lilc_player_endurance;
lilc_player_gear = ([player] call lilc_inventory_fnc_getInventory);
6 _data pushBack lilc_player_gear;
7 _data pushBack lilc_player_jobs;
8 _data pushBack lilc_player_npcs;
lilc_player_lastPosition = [(getPosASL player), direction player];
9 _data pushBack lilc_player_lastPosition;
10 _data pushBack lilc_player_charisma;
11 _data pushBack lilc_bank_accounts;
*/

params [
    ["_unit", ObjNull, [ObjNull]],
    ["_data", [], [[]]]
];
if (isNull _unit) exitWith {};
if ((count _data) <= 0) exitWith {};

_id = _data select 0;
_s64id = _data select 1;
_thirst = _data select 2;
_hunger = _data select 3;
_cash = _data select 4;
_endurance = _data select 5;
_gear = [(_data select 6)] call lils_common_fnc_arrayEncode;
_jobs = [(_data select 7)] call lils_common_fnc_arrayEncode;
_npcs = [(_data select 8)] call lils_common_fnc_arrayEncode;
_lastPosition = [(_data select 9)] call lils_common_fnc_arrayEncode;
_charisma = _data select 10;

_bankAccounts = [(_data select 11)] call lils_common_fnc_arrayEncode;
[_unit, _bankAccounts] call lils_bank_fnc_set;

[format["UPDATE ACCOUNT_DATA SET THIRST = '%1', HUNGER = '%2', CASH = '%3', ENDURANCE = '%5', GEAR = '%6', JOBS = '%7', NPCS = '%8', LASTPOSITION = '%9', CHARISMA = '%10' WHERE ID = '%11' AND STEAM64ID = '%12'", _thirst, _hunger, _cash, _bankAccounts, _endurance, _gear, _jobs, _npcs, _lastPosition, _charisma, _id, _s64id]] call lils_database_fnc_query;
