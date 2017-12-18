
{
	private _m = getText(_x >> "markerName");
	if (_m != "") then
	{
		_m setMarkerAlphaLocal 0;
	};
} forEach ("true" configClasses (missionConfigFile >> "CfgPrisons"));
