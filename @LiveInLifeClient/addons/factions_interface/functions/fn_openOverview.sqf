
private _factionID = player getVariable ["lilc_factionID", -1];
if (_factionID <= -1) exitWith {};

if !(["factions_interface.overview"] call lilc_permissions_fnc_have) exitWith {};

if !(createDialog "lilc_factions_interface_overview") exitWith {};

lbClear 1500;
lbAdd [1500, "Spieler werden geladen..."];

lbClear 1501;
lbAdd [1501, "Ränge werden geladen..."];

[[player], "lils_factions_interface_fnc_overviewGetPlayers"] call lilc_common_fnc_sendToServer;
[[player], "lils_factions_interface_fnc_overviewGetRanks"] call lilc_common_fnc_sendToServer;
