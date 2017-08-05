
//just to use it if needed!

params [
	["_logic", objNull, [objNull]]
];

try
{
	if (isNull _logic) throw false;
	throw true;
}
catch
{
	_exception;
};
