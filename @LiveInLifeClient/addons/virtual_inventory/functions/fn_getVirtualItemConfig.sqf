
params [
    ["_itemName", "", [""]]
];

try {
    private _config = (configFile >> "CfgVirtualItems" >> _itemName);
    if !(isNull _config) throw _config;
    
    _config = (missionConfigFile >> "CfgVirtualItems" >> _itemName);
    if !(isNull _config) throw _config;

    _config = (campaignConfigFile >> "CfgVirtualItems" >> _itemName);
    if (isNull _config) throw configNull;
    
    throw _config;
} catch {
    _exception;
};
