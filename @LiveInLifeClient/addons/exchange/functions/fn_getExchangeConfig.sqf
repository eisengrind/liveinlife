
params [
	["_exchangeName", "", [""]]
];

try
{
	private _config = (missionConfigFile >> "CfgExchange" >> _exchangeName);
	if (isNull _config) throw configNull;

	throw _config;
}
catch
{
	_exception;
};
