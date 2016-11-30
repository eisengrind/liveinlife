
params [
    ["_shopName", "", [""]]
];

try {
    if (isNil "_shopName") throw ["", []];

    private _config = configNull;
    _config = (missionConfigFile >> "CfgShops");

    throw [(getText(_config >> "displayName")), (getArray(_config >> "groups"))];
} catch {
    _exception;
};
