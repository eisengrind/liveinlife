
params [
    ["_balance", 0, [0]]
];

if (_balance < 0) exitWith { false; };

lilc_player_cash = lilc_player_cash + _balance;
call lilc_hud_fnc_update;
true;
