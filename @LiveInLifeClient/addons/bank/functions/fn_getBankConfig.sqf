
private _bankName = param [0, "", [""]];

try {
    private _config = (missionConfigFile >> "CfgBanks" >> _bankName);
    throw _config;
} catch {
    _exception;
};
