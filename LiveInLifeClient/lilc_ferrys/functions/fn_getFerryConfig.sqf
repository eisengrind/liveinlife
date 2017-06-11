
private _harborName = param [0, "", [""]];

try {
    if (_harborName == "") throw configNull;
    throw (missionConfigFile >> "CfgFerrys" >> _harborName);
} catch {
    _exception;
};
