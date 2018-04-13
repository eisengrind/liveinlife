
params [
    ["_unit", objNull, [objNull]]
];

if (isNull _unit) exitWith {};

private _factionID = _unit getVariable ["lilc_factionID", -1];
if (_factionID <= -1) exitWith {};

private _players = [format[
    "SELECT ACCOUNT_DATA.id, ACCOUNT_DATA.FIRSTNAME, ACCOUNT_DATA.LASTNAME, FACTION_PLAYER_DATA.RANKID FROM ACCOUNT_DATA, FACTION_PLAYER_DATA WHERE ACCOUNT_DATA.`GROUP` = %1 AND FACTION_PLAYER_DATA.ACCOUNTID = ACCOUNT_DATA.`ID`",
    _factionID
]] call lils_database_fnc_fetchObjects;

[_players, "lilc_factions_interface_fnc_overviewSetPlayers", _unit] call lilc_common_fnc_send;
