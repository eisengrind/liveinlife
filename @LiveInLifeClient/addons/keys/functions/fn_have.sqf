
/*
    Date:
        16.10.2016
    Author:
        Vincent Heins
    Description:
        Checks if the player have the requested key.
    Params:
        0 - Vehicle where to get the key data - <OBJECT>
    Returns:
        true / false - Return true if player have the key; otherwise false - <BOOLEAN>
    License:
        @LiveInLifeClient\license.txt
*/

params [
    ["_vehicle", objNull, [objNull]]
];

try
{
    if (isNull _vehicle) throw false;

    private _factionID = (player getVariable ["lilc_factionID", -1]);
    private _vehicleFactionID = (_vehicle getVariable ["lilc_factionID", -1]);
    private _vehicleID = (_vehicle getVariable ["lilc_vehicleID", 0]);
    if (_vehicleID != -1 && _vehicleFactionID > -1) throw false;

    if (_factionID == _vehicleFactionID && _factionID > -1) then
    {
        private _factionConfig = ([_factionID] call lilc_factions_fnc_getFactionConfig);
        systemChat str 1;
        if ((getNumber(_factionConfig >> "globalVehicleLock")) == 1) then throw true;
    };

    if !([
        player,
        "lilcvi_key_F",
        (format["Key %1", getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]),
        _vehicleID
    ] call lilc_virtualInventory_fnc_itemInInventory) throw false;

    throw true;
}
catch
{
    _exception;
};
