
{
    private _areas = getArray(_x >> "areas");
    {
        if ((markerColor _x) != "") then {
            _x setMarkerAlphaLocal 0;
        };
    } forEach _areas;
} forEach ("true" configClasses (missionConfigFile >> "CfgFarmAreas"));
