
private ["_unit", "_accountID", "_groupID", "_result"];
params [
    ["_unit", ObjNull, [ObjNull]],
    ["_accountID", 0, [0]],
    ["_groupID", -1, [-1]]
];
if (isNull _unit) exitWith {};
if (_accountID <= 0) exitWith {};

_result = [];

_unit setVariable ["lilc_accountID", _accountID];
_unit setVariable ["lilc_groupID", _groupID];

//_result = [format["SELECT ID FROM FACTION_INTERFACE_PLAYERS_DATA WHERE FACTIONID = '%1' AND STEAM64ID = '%2' AND ACCOUNTID = '%3' LIMIT 1", (_unit getVariable ["lilc_groupID", -1]), (getPlayerUID _unit), _accountID]] call lils_database_fnc_fetchObjects;
//if ((count _result) != 1) then { [_unit, (_unit getVariable ["lilc_groupID", -1]), 0, 0] call lils_factionsInterface_fnc_addPlayer; };
//_result = [];
//_result = ([(format["SELECT RANKID, GROUPID, LEADER FROM FACTION_INTERFACE_PLAYERS_DATA WHERE FACTIONID = '%1' AND STEAM64ID = '%2' AND ACCOUNTID = '%3'", (_unit getVariable ["lilc_groupID", -1]), (getPlayerUID _unit), _accountID])] call lils_database_fnc_fetchObjects);

_result = ([(format["SELECT RANKID, "])] call lils_database_fnc_fetchObjects);

if ((count _result) == 1) exitWith {
    _result = (_result select 0);
    _unit setVariable ["lilc_factionRankID", (_result select 0), true];
};
