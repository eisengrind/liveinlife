
params [
    ["_balance", 0, [0]]
];

if (_balance < 0) exitWith { false; };
if (_balance == 0) exitWith { true; };

if !([_balance] call lilc_cash_fnc_have) exitWith { false; };
[_balance] call lilc_cash_fnc_remove;
call lilc_hud_fnc_update;
true;
