
params [
	["_prisonName", "", [""]]
];

try
{
	private _prisonConfig = (missionConfigFile >> "CfgPrisons" >> _prisonName);
	if (isNull _prisonConfig) throw configNull;

	throw _prisonConfig;
}
catch
{
	_exception;
};
