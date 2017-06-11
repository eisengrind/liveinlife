
private _recipeName = param [0, "", [""]];

try
{
	private _config = (missionConfigFile >> "CfgRecipes" >> _recipeName);
	if (isNull _config) throw configNull;

	throw _config;
}
catch
{
	_exception;
};
