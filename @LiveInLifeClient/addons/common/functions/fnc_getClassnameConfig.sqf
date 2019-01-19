
/*
    Filename:
        fn_getClassnameConfig.sqf
    Author:
        Vincent Heins
    Description:
        Gets the config entry of (nearly?) any classname item or/and vehicle.
    Param(s):
        (_this select 0) : the classname to work with : <STRING>
    Result(s):
        the archieved classname config : <CONFIG>
*/

private _classname = param [0, "", [""]];

try {
    if (isNil "_classname") throw configNull;
    if !(isNull ([_classname] call lilc_inventory_fnc_getItemInfo)) throw ([_classname] call lilc_inventory_fnc_getItemInfo);
    if (isClass (configFile >> "CfgAmmo" >> _classname)) throw (configFile >> "CfgVehicles" >> _classname);
    if !(isNull (configFile >> "CfgVehicles" >> _classname)) throw (configFile >> "CfgVehicles" >> _classname);
    throw configNull;
} catch {
    _exception;
};
