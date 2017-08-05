
params [
	["_unit", ObjNull, [ObjNull]],
	["_balance", -1, [-1]]
];

try {
	if (isNull _unit || !(_unit in playableUnits)) throw false;
	if (_balance <= -1) throw false;
	
	if (_unit isEqualTo player) then {
		if (isNil "lilc_player_cash") then { lilc_player_cash = 0; };
		lilc_player_cash = _balance;
	} else {
		[[_unit, _balance], "lilc_cash_fnc_set", _unit] call lilc_common_fnc_send;
	};
	
	true;
} catch {
	_exception;
};
