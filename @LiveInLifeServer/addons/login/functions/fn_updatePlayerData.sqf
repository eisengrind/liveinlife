
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
17 prison_waitingTime
18 prison_escapeTime
19 prison_currentPunishment
20 health
*/

params [
    ["_unit", ObjNull, [ObjNull]],
    ["_data", [], [[]]],
    ["_additionalData", [], [[]]]
];

if (isNull _unit) exitWith {};
if ((count _data) <= 0) exitWith {};

[_unit, (_data select 10)] call lils_bank_fnc_setBankAccounts;

[([
    "ACCOUNT_DATA",
    [
        ["THIRST", (_data select 2)],
        ["HUNGER", (_data select 3)],
        ["CASH", (_data select 4)],
        ["ENDURANCE", (_data select 5)],
        ["GEAR", ([(_data select 6)] call lils_common_fnc_arrayEncode)],
        ["NPCS", ([(_data select 7)] call lils_common_fnc_arrayEncode)],
        ["LASTPOSITION", ([(_data select 8)] call lils_common_fnc_arrayEncode)],
        ["CHARISMA", ([(_data select 9)] call lils_common_fnc_arrayEncode)],
        //["COVERED_DISTANCE", ([(_data select )])],
        ["RESPAWNING", (_data select 15)],
        ["STATUS", (_data select 12)],
        ["VIRTUALINVENTORY", ([(_data select 11)] call lils_common_fnc_arrayEncode)],
        ["PERMISSIONS", ([(_data select 14)] call lils_common_fnc_arrayEncode)],
        ["DEATHTIMEOUT", (_data select 16)],
        ["prison_waitingTime", (_data select 17)],
        ["prison_escapeTime", (_data select 18)],
        ["prison_currentPunishment", (str (_data select 19))],
        ["health", ([(_data select 20)] call lils_common_fnc_arrayEncode)]
    ],
    [
        ["ID", (_data select 0)],
        ["STEAM64ID", (getPlayerUID _unit)]
    ]
] call lils_database_fnc_generateUpdateQuery)] call lils_database_fnc_query;
