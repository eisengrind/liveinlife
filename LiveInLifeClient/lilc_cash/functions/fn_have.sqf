
private _balance = param [0, 0, [0]];

try {
	if (_balance <= 0) throw false;
	if ((lilc_player_cash - _balance) < 0) throw false;
	
	throw true;
} catch {
	_exception;
};
