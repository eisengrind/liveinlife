
params [
	["_butcherName", "", [""]]
];

try
{
	private _config = (missionConfigFile >> "CfgButcher" >> _butcherName);
	throw _config;
}
catch
{
	_exception;
};
