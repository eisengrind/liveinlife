
try
{
	private _unit = player;
	if !([_unit] call lilc_common_fnc_isAlive) throw false;
	if (call lilc_pcard_fnc_havePersonalcard) throw false;

	throw true;
}
catch
{
	_exception;
};
