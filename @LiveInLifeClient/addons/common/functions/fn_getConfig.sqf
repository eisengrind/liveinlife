
//there is no usage of it? why do i not removed it yet?
params [
    ["_configName", "", [""]],
    ["_searchConfigFile", false, [false]],
    ["_searchMissionConfigFile", false, [false]],
    ["_searchCampaignConfigFile", false, [false]]
];

try {
    private _configFile = configNull;

    if (_searchConfigFile) then {
        _configFile = (configFile >> _configName);
    };

    if (_searchMissionConfigFile) then {
        _configFile = (configFile >> _configName);
    };

    if (_searchCampaignConfigFile) then {
        _configFile = (configFile >> _configName);
    };

    throw _configFile;
} catch {
    _exception;
};
