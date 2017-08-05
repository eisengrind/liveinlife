
lils_availableClassnames = [];
{
    {
        if !((configName _x) in lils_availableClassnames)then {
            lils_availableClassnames pushBack (configName _x);
        };
    } forEach ("true" configClasses (_x >> "vehicles"));
} forEach ("true" configClasses (missionConfigFile >> "CfgVehicleShops"));
