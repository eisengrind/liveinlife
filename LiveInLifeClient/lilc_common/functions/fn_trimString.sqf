
params [
	["_string", "", [""]],
	["_length", 0, [0]] //maximal length
];

try
{
	if (_string == "") throw _string;
	if (_length == 0) throw _string;

	private _stringCount = (count _string);
	if (_stringCount == _length) throw _string;

	if (_length < 0) then
	{
		reverse _string;
		_string = (_string select [0, _length]);
		reverse _string;
	}
	else
	{
		_string = (_string select [0, _length]);
	};

	throw _string;
}
catch
{
	_exception;
};
