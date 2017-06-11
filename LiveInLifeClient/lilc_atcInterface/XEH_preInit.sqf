
lilc_atcInterface_airports = [];
{
	lilc_atcInterface_airports pushBack getText(_x >> "markerName");
} forEach ("true" configClasses (missionConfigFile >> "CfgAirports"));
