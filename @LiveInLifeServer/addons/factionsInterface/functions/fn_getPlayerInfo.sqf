
params [
    ["_unit", objNull, [objNull]],
    ["_factionPlayerID", 0, [0]]
];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if (_factionPlayerID <= 0) throw false;
    private _factionID = (_unit getVariable ["lilc_factionID", -1]);
    if (_factionID <= -1) throw false;

    private _playerInfo = ([(format["SELECT FACTION_PLAYER_DATA.EQUIPMENT, FACTION_PLAYER_DATA.VEHICLES, ACCOUNT_DATA.PERMISSIONS, FACTION_PLAYER_DATA.RANKID, ACCOUNT_DATA.FIRSTNAME, ACCOUNT_DATA.LASTNAME, ACCOUNT_DATA.ID, FACTION_PLAYER_DATA.RANKID FROM FACTION_PLAYER_DATA, ACCOUNT_DATA WHERE FACTION_PLAYER_DATA.ID = '%1' AND ACCOUNT_DATA.ID = FACTION_PLAYER_DATA.ACCOUNTID AND ACCOUNT_DATA.`GROUP` = '%2'", _factionPlayerID, _factionID])] call lils_database_fnc_fetchObjects);
    if ((count _playerInfo) <= 0) throw false;
    _playerInfo = (_playerInfo select 0);

    _playerInfo set [0, ([(_playerInfo select 0)] call lils_common_fnc_arrayDecode)];
    _playerInfo set [1, ([(_playerInfo select 1)] call lils_common_fnc_arrayDecode)];
    _playerInfo set [2, ([(_playerInfo select 2)] call lils_common_fnc_arrayDecode)];
    
    [["player", _playerInfo], "lilc_factionsInterface_fnc_setSelectMenu", _unit] call lilc_common_fnc_send;
} catch {
    _exception;
};
