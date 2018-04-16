
private _accountID = (findDisplay 2050) getVariable ["lilc_accountID", 0];
if (_accountID <= 0) exitWith {};

private _index = lbCurSel 2100;
if (_index <= -1) exitWith {};

private _rankID = lbValue [2100, _index];
if (_rankID <= 0) exitWith {};

ctrlEnable [1601, false];
ctrlEnable [2100, false];

[[player, _accountID, _rankID], "lils_factions_interface_fnc_playerSetRank"] call lilc_common_fnc_sendToServer;
