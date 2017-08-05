
try
{
	private _config = (missionConfigFile >> "CfgSeats");
	if (isNull _config) throw configNull;

	throw _config;
}
catch
{
	_exception;
};
