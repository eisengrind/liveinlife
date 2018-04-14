
private _index = lbCurSel 1501;
if (_index <= -1) exitWith {};

private _rankID = lbValue [1501, _index];
if (_rankID <= 0) exitWith {};

[[player, _rankID], "lils_factions_interface_fnc_removeRank"] call lilc_common_fnc_sendToServer;
