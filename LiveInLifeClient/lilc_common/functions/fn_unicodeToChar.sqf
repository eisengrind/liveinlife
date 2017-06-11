
private _unicodeNumber = param [0, 0, [0]];

try
{
	throw str parseText (format["&#%1;", _unicodeNumber]);
}
catch
{
	_exception;
};
