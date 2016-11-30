
private _garageType = param [0, "", [""]];

try {
    if (_garageType == "") throw configNull;
    if !(isClass(missionConfigFile >> "CfgGarages" >> _garageType)) throw configNull;
    throw (missionConfigFile >> "CfgGarages" >> _garageType);
} catch {
    _exception;
};
