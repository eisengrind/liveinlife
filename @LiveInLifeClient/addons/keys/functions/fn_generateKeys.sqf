
private _startTime = time;
private _generatedKeys = [];

{
    if (getText(_x >> "displayName") != "" && (getText(_x >> "vehicleClass") != "Backpacks") && (getText(_x >> "simulation") in ["car", "motorcycle", "tank", "helicopter", "airplanex", "ship", "house", "tankX", "thingX", "shipX", "fire", "House", "curator", "helicopterrtd", "paraglide", "shipx", "submarinex", "carx", "airplane", "airplaneX"])) then {
        _generatedKeys pushBack (format["class lilci_key_%1_F : lilci_key {::||::displayName = ""%2 Key"";::||::descriptionShort = ""%3"";::||::};", (configName _x), getText(_x >> "displayName"), getText(_x >> "descriptionShort")]);
    };
} forEach ("true" configClasses (configFile >> "CfgVehicles"));

systemChat format["Generating done. Total entries: %1. Elapsed time: %2s.", (count _generatedKeys), (time - _time)];
systemChat "Copying to clipboard in 3s";
sleep 1;
systemChat "Copying to clipboard in 2s";
sleep 1;
systemChat "Copying to clipboard in 1s";
sleep 1;
copyToClipboard str _generatedKeys;
