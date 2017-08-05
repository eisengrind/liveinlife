
private _balance = param [0, 0, [0]];

try {
	if (_balance < 0) throw false;
	if (isNil "lilc_player_cash") then { lilc_player_cash = 0; };
	if ((lilc_player_cash - _balance) < 0) throw false;
	
	throw true;
} catch {
	_exception;
};
