
{
    if (isText(_x >> "lilc_globalVariableDefines")) then {
        call compile preProcessFileLineNumbers format["\%1\%2", (configName _x), getText(_x >> "lilc_globalVariableDefines")];
    };
} forEach ("true" configClasses (configFile >> "CfgPatches"));
