
private _unit = param [0, objNull, [objNull]];

try
{
	if (isNull _unit) throw false;
	if !(alive _unit) throw false;
	if (_unit getVariable ["lilc_isDead", false]) throw false;

	throw true;
}
catch
{
	_exception;
};
