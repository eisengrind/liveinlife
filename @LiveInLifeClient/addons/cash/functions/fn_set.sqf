
params [
    ["_balance", -1, [-1]]
];

if (_balance <= -1) exitWith {};
lilc_player_cash = _balance;
call lilc_hud_fnc_update;
