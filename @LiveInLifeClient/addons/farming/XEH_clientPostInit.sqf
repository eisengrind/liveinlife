
{
    private _areas = getArray(_x >> "areas");
    if ((count _areas) > 0) then
    {
        {
            if (_x != "") then
            {
                _x setMarkerAlphaLocal 0;
            };
        } forEach _areas;
    };
} forEach ("true" configClasses (missionConfigFile >> "CfgFarmAreas"));
