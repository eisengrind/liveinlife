
private ["_killer", "_victim"];
params [
    ["_victim", ObjNull, [ObjNull]],
    ["_killer", ObjNull, [ObjNull]]
];

lilc_player_corpse = _victim;
lilc_player_currentDeaths = lilc_player_currentDeaths + 1;

call lilc_respawn_fnc_init;
