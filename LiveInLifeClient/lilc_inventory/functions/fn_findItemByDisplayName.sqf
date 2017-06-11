
/*private _displayName = param [0, "", []];

try {
    if (_displayName == "") throw configNull;

    { if ((getText(_x >> "displayName")) == _displayName) throw _x; } forEach ("true" configClasses (configFile >> "CfgWeapons"));
    { if ((getText(_x >> "displayName")) == _displayName) throw _x; } forEach ("true" configClasses (configFile >> "CfgMagazines"));
    { if ((getText(_x >> "displayName")) == _displayName) throw _x; } forEach ("true" configClasses (configFile >> "CfgGlasses"));
    { if ((getText(_x >> "displayName")) == _displayName) throw _x; } forEach ("true" configClasses (configFile >> "CfgVehicles"));

    throw configNull;
} catch {
    _exception;
};*/

private _displayName = param [0, "", []];

try {
    if (_displayName == "") throw "";
    
    { if (_displayName == (_x select 1)) throw (_x select 0); } forEach lilc_inventory_items;

    throw "";
} catch {
    _exception;
};
