
params [
    ["_balance", 0, [0]]
];

if (_balance < 0) exitWith { false; };
if (((player getVariable ['lilc_cash_balance', 0]) - _balance) < 0) exitWith { false; };
true;
