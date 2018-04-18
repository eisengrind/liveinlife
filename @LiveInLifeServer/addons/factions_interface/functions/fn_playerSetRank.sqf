
params [
    ["_unit", objNull, [objNull]],
    ["_accountID", 0, [0]],
    ["_rankID", 0, [0]]
];

if (isNull _unit) exitWith {};
if (_accountID <= 0) exitWith {};
if (_rankID <= -1) exitWith {};

[format[
    "UPDATE FACTION_PLAYER_DATA SET RANKID = %1 WHERE ACCOUNTID = %2",
    _rankID,
    _accountID
]] call lils_database_fnc_query;

private _players = allPlayers;
for "_i" from 0 to (count _players) - 1 do {
    private _player = _players select _i;
    if ((_player getVariable ["lilc_accountID", 0]) == _accountID) then {
        _player setVariable ["lilc_factionRankID", _rankID, true];
    };
};

[nil, "lilc_factions_interface_fnc_playerSaved", _unit] call lilc_common_fnc_send;
