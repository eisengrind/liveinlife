
params [
    ["_robber", objNull, [objNull]]
];

[[lilc_player_cash], "lilc_cash_fnc_add", _robber] call lilc_common_fnc_send;
lilc_player_cash = 0;
