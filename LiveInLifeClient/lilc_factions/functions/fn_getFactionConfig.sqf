
private _factionID = param [0, -1, [-1]];

try {
    if (_factionID <= -1) throw configNull;
    { if ((getNumber(_x >> "id"))/*_forEachIndex*/ == _factionID) throw _x; } forEach ("true" configClasses (missionConfigFile >> "CfgFactions"));
    throw configNull;
} catch {
    _exception;
};
