
params [
	["_transponderCode", "", [""]]
];

try
{
	{
		if ((getText(_x >> "code")) == _transponderCode) throw getText(_x >> "displayName");
	} forEach ("true" configClasses (missionConfigFile >> "CfgTransponderCodes"));

	throw "Unknown";
}
catch
{
	_exception;
};
