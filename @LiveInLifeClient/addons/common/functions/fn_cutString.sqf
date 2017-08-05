
params [
	["_string", "", [""]],
	["_length", 0, [0]] //i think negative values will be removing chars from the beginning (index 0)
];

try
{
	if (_string == "") throw _string;
	if (_length == 0) throw _string;

	if (_length < 0) then
	{
		throw (_string select [(_length - 1)]);
	}
	else
	{
		throw (_string select [0, ((count _string) - (1 + _length))]);
	};

	throw _string; //theres is no case to reach this, but (""if"") then we have a case!
}
catch
{
	_exception;
};
