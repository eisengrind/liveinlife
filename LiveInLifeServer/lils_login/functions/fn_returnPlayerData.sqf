
params [
    ["_unit", ObjNull, [ObjNull]],
    ["_accountID", 0, [0]]
];

if (_accountID <= 0) exitWith {};
if (isNull _unit) exitWith {};

_factionPlayer = [];
_result = [];
_result = [(format["SELECT ID, STEAM64ID, THIRST, HUNGER, CASH, ENDURANCE, GEAR, JOBS, NPCS, NEW, LASTPOSITION, GENDER, `GROUP`, CHARISMA, FIRSTNAME, LASTNAME FROM ACCOUNT_DATA WHERE ACCOUNT_DATA.STEAM64ID = '%1' AND ID = '%2' LIMIT 1", (getPlayerUID _unit), _accountID])] call lils_database_fnc_fetchObjects;
[format["UPDATE ACCOUNT_DATA SET TIMELASTLOGIN = UNIX_TIMESTAMP(NOW()) WHERE ID = '%1';", _accountID]] spawn lils_database_fnc_query;

_result = (_result select 0);

//_result set [5, ([(_result select 5)] call lils_common_fnc_arrayDecode)];
_result set [6, ([(_result select 6)] call lils_common_fnc_arrayDecode)];
_result set [7, ([(_result select 7)] call lils_common_fnc_arrayDecode)];
_result set [8, ([(_result select 8)] call lils_common_fnc_arrayDecode)];
_result set [10, ([(_result select 10)] call lils_common_fnc_arrayDecode)];

//[_unit, _accountID, (_result select 13)] call lils_login_fnc_setPlayerInfo;
_unit setVariable ["lilc_factionID", (_result select 12), true];
_unit setVariable ["lilc_accountID", _accountID, true];
[_unit] call lils_factionsInterface_fnc_setFactionInfo;

[[_result], "lilc_login_fnc_setPlayerData", _unit] call lilc_common_fnc_send;
