
lilc_atcInterface_airports = [];
{
    lilc_atcInterface_airports pushBack getText(_x >> "markerName");
} forEach ("true" configClasses (missionConfigFile >> "CfgAirports"));
lilc_atcInterface_vehicleClassnames = getArray(missionConfigFile >> "CfgATCInterface" >> "classnames");
