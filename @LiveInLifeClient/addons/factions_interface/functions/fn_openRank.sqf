
params [
    ["_rankID", 0, [0]]
];

private _factionID = player getVariable ["lilc_factionID", -1];
private _factionConfig = [_factionID] call lilc_factions_fnc_getFactionConfig;

if (_factionID <= -1) exitWith {};

if (_rankID <= 0) exitWith {};
if !(["factions_interface.rank"] call lilc_permissions_fnc_have) exitWith {};
if !(createDialog "lilc_factions_interface_rank") exitWith {};

(findDisplay 2049) setVariable ["lilc_rankID", _rankID];

private _rank = [_rankID] call lilc_factions_interface_fnc_getRank;

lnbClear 1500;
lnbAddRow [1500, ["", "Rechte werden geladen...", ""]];

lnbClear 1501;
lnbAddRow [1501, ["", "Fahrzeuge werden geladen...", ""]];

lnbClear 1502;
lnbAddRow [1502, ["", "Gegenstände werden geladen...", ""]];

lbClear 2100;
{
    private _i = lbAdd [2100, getText(_x >> "displayName")];
    lbSetPicture [2100, _i, getText(_x >> "texture")];
    lbSetData [2100, _i, configName _x];
} forEach ("true" configClasses (missionConfigFile >> "CfgUnitInsignia")) + ("true" configClasses (configFile >> "CfgUnitInsignia"));

lbClear 2101;
{
    private _i = lbAdd [2100, format["$%1", _x]];
    lbSetData [2101, _i, str _x];
} forEach getArray(_factionConfig >> "paychecks");

ctrlSetText [1400, _rank select 1];
ctrlSetText [1401, _rank select 2];

[[player, _rankID], "lils_factions_interface_fnc_rankGetItems"] call lilc_common_fnc_sendToServer;
[[player, _rankID], "lils_factions_interface_fnc_rankGetVehicles"] call lilc_common_fnc_sendToServer;
[[player, _rankID], "lils_factions_interface_fnc_rankGetPermissions"] call lilc_common_fnc_sendToServer;
