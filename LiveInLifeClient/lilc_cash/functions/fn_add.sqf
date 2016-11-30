
params [
	["_unit", ObjNull, [ObjNull]],
	["_balance", 0, [0]]
];

try {
	if (isNull _unit) throw false;
	if (_balance <= 0) throw false;
	
	if (_unit == player) then {
		lilc_player_cash = lilc_player_cash + _balance;
	} else {
		[[_unit, _balance], "lilc_cash_fnc_add", _unit] call lilc_common_fnc_send;
	};
} catch {
};
