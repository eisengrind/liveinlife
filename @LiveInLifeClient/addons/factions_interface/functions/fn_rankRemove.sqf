
private _index = lbCurSel 1501;
if (_index <= -1) exitWith {};

private _rankID = parseNumber lbData [1501, _index];
if (_rankID <= 0) exitWith {};

ctrlEnable [1501, false];
ctrlEnable [1603, false];
ctrlEnable [1604, false];
ctrlEnable [1605, false];

[[player, _rankID], "lils_factions_interface_fnc_rankRemove"] call lilc_common_fnc_sendToServer;
