
params [
    ["_balance", 0, [0]]
];

if (_balance < 0) exitWith { false; };
if ((lilc_player_cash - _balance) < 0) exitWith { false; };

true;
