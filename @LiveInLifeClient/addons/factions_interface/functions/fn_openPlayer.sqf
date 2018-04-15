
params [
    ["_accountID", 0, [0]]
];

if (_accountID <= 0) exitWith {};

private _factionID = player getVariable ["lilc_factionID", -1];
if (_factionID <= -1) exitWith {};

lbClear 1500;
lbAdd [1500, "Ränge werden geladen..."];
lbSetCurSel [1500, 0];

[[player], "lils_factions_interface_fnc_playerGetRanks"] call lilc_common_fnc_sendToServer;
