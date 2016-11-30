
private _lockerName = param [0, "", [""]];

try {
    if (_lockerName == "") throw configNull;
    private _lockerConfig = (missionConfigFile >> "CfgLockers" >> _lockerName);
    if (isNull _lockerConfig) throw configNull;

    throw _lockerConfig;
} catch {
    _exception;
};
