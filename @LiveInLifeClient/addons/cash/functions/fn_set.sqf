
params [
    ["_balance", -1, [-1]]
];

if (_balance <= -1) exitWith {};
player setVariable ['lilc_cash_balance', _balance, true];
call lilc_hud_fnc_update;
