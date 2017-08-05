
params [
	["_unit", ObjNull, [ObjNull]],
	["_balance", 0, [0]]
];

try {
	if (isNull _unit) throw false;
	if (_balance <= 0) throw false;
	if (isNil "lilc_player_cash") then { lilc_player_cash = 0; };
	
	if (_unit == player) then {
		lilc_player_cash = lilc_player_cash + _balance;
		throw true;
	} else {
		[[_unit, _balance], "lilc_cash_fnc_add", _unit] call lilc_common_fnc_send;
		throw true;
	};
} catch {
    _exception;
};
