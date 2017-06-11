
params [
	["_config", configNull, [configNull]]
];

try
{
	if (isNull _config) throw false;
	if !((isText _config) || (isArray _config) || (isNumber _config)) throw false;

	throw false;
}
catch
{
	_exception;
};
