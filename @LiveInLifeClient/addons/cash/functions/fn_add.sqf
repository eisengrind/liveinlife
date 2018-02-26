
params [
    ["_balance", 0, [0]]
];

if (_balance < 0) exitWith { false; };
[_balance] call lilc_cash_fnc_add;
call lilc_hud_fnc_update;
true;
