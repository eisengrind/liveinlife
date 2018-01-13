
{
    if (getText(_x >> "objectVariable") != "") then {
        private _object = call compile format["%1;", getText(_x >> "objectVariable")];
        
        if !(isNull _object) then {
            if (getText(_x >> "markerName") != "") then {
                private _marker = createMarkerLocal [format["packageSpot%1", (_forEachIndex + 1)], (position _object)];
                _marker setMarkerTextLocal format["Package-Spot %1", (_forEachIndex + 1)];
                _marker setMarkerTypeLocal "mil_dot";
            } else {

            };
        };
    };
} forEach ("true" configClasses (missionConfigFile >> "CfgPackages"));
