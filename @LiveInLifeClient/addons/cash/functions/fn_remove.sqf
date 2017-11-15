
params [
	["_balance", 0, [0]]
];

if (_balance < 0) exitWith { false; };
if (_balance == 0) exitWith { true; };

if !([_balance] call lilc_cash_fnc_have) exitWith { false; };
lilc_player_cash = lilc_player_cash - _balance;
true;
