
params [
	["_object", objNull, [objNull]],
	["_direction", 0, [0]]
];

try
{
	if (isNull _object) throw false;
	
	_object setDir _direction;
	throw true;
}
catch
{
	_exception;
};
