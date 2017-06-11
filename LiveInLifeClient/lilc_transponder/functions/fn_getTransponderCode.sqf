
params [
	["_aeroplane", objNull, [objNull]]
];

try
{
	if (isNull _aeroplane) throw "";
	throw (_aeroplane getVariable ["lilc_transponder_code", "0000"]);
}
catch
{
	_exception;
};
