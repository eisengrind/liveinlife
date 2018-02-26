
params [
    ["_robber", objNull, [objNull]]
];

[[(player getVariable ['lilc_cash_balance', 0])], "lilc_cash_fnc_add", _robber] call lilc_common_fnc_send;
[0] call lilc_cash_fnc_set;
