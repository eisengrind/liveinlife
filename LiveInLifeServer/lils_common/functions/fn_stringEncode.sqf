
private _string = param [0, "", [""]];

try
{
	if (_string == "") throw _string;

	_string = ([_string, """", """"""] call KRON_Replace);
	_string = ([_string, "'", "''"] call KRON_Replace);

	private _stringArray = (toArray _string);
	private _encodedArray = [];

	{
		
	} forEach _stringArray;

	throw _string;
}
catch
{
	_exception;
};
