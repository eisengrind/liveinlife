
params [
    ["_shopName", "", [""]]
];

try {
    if (_shopName == "") throw ["", []];

    private _config = configNull;
    _config = (missionConfigFile >> "CfgShops" >> _shopName);

    throw [(getText(_config >> "displayName")), (getArray(_config >> "groups"))];
} catch {
    _exception;
};
