
private _punishmentName = param [0, "", [""]];

try
{
	private _config = (missionConfigFile >> "CfgPunishments" >> _punishmentName);
	if (isNull _config) throw configNull;
	
	throw _config;
}
catch
{
	_exception;
};
