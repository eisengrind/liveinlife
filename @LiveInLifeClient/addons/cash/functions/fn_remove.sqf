
params [
    ["_balance", 0, [0]]
];

if (_balance < 0) exitWith { false; };
if (_balance == 0) exitWith { true; };

if !([_balance] call lilc_cash_fnc_have) exitWith { false; };
player setVariable ["lilc_cash_balance", (player getVariable ["lilc_cash_balance", 0]) - _balance, true];
call lilc_hud_fnc_update;
true;
