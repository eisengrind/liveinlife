
private _classname = param [0, "", [""]];

try {
    if (isNil "_classname") throw configNull;
    if !(isNull ([_classname] call lilc_inventory_fnc_getItemInfo)) throw ([_classname] call lilc_inventory_fnc_getItemInfo);

    if !(isNull (configFile >> "CfgVehicles" >> _classname)) throw (configFile >> "CfgVehicles" >> _classname);
    throw configNull;
} catch {
    _exception;
};
