
{
    lilc_action_availableChairs pushBack (configName _x);
} forEach ("true" configClasses (missionConfigFile >> "CfgSeats"));
