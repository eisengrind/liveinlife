
params [
    ["_accountID", 0, [0]]
];

if (_accountID <= 0) exitWith {};

private _factionID = player getVariable ["lilc_factionID", -1];
if (_factionID <= -1) exitWith {};
if !(createDialog "lilc_factions_interface_player") exitWith {};

(findDisplay 2050) setVariable ["lilc_accountID", _accountID];

lbClear 2100;
lbAdd [2100, "Ränge werden geladen..."];
lbSetCurSel [2100, 0];

[[player], "lils_factions_interface_fnc_playerGetRanks"] call lilc_common_fnc_sendToServer;
