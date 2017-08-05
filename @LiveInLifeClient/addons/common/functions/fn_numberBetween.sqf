
params [
	["_number", 0, [0]],
	["_start", 0, [0]],
	["_end", 0, [0]]
];

try
{
	if (_number <= _start && _number >= _end) throw true;

	throw false;
}
catch
{
	_exception;
};
