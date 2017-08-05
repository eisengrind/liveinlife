
private _string = param [0, "", [""]];

try
{
	if (_string == "") throw _string;

	_string = ([_string, """""", """"] call KRON_Replace);
	_string = ([_string, "''", "'"] call KRON_Replace);

	throw _string;
}
catch
{
	_exception;
};
