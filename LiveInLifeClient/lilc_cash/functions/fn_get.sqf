
params [
	["_unit", ObjNull, [ObjNull]],
	["_receiver", ObjNull, [ObjNull]]
];

try {
	if (isNull _unit || !isPlayer _unit) throw 0;
	if (!isNull _receiver && _unit == player) then {
		lilc_tmpMoneyResult = lilc_player_cash;
		(owner _receiver) publicVariableClient "lilc_tmpMoneyResult";
		lilc_tmpMoneyResult = nil;
	} else {
		if (_unit == player) then {
			throw lilc_player_cash;
		} else {
			[[_unit, (owner player)], "lilc_cash_fnc_get", _unit] call lilc_common_fnc_send;
			lilc_tmpMoneyResult = nil;
			waitUntil { !isNil "lilc_tmpMoneyResult" };
			
			throw lilc_tmpMoneyResult;
		};
	};
} catch {
	_exception;
};
