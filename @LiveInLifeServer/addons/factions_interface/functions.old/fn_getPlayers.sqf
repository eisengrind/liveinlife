
private _unit = param [0, objNull, [objNull]];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;

    private _unitUID = (getPlayerUID _unit);
    private _accountID = (_unit getVariable ["lilc_accountID", 0]);
    private _factionID = (_unit getVariable ["lilc_factionID", -1]);

    if (_accountID <= 0) throw false;
    if (_factionID <= -1) throw false;

    private _players = ([(format["SELECT FACTION_PLAYER_DATA.ID, QUOTE(FACTION_PLAYER_DATA.STEAM64ID), FACTION_PLAYER_DATA.ACCOUNTID, FACTION_PLAYER_DATA.RANKID, ACCOUNT_DATA.FIRSTNAME, ACCOUNT_DATA.LASTNAME FROM FACTION_PLAYER_DATA, ACCOUNT_DATA WHERE ACCOUNT_DATA.ID = FACTION_PLAYER_DATA.ACCOUNTID AND ACCOUNT_DATA.`GROUP` = '%1'", _factionID])] call lils_database_fnc_fetchObjects);

    [["dashboard", _players], "lilc_factionsInterface_fnc_setSelectMenu", _unit] call lilc_common_fnc_send;
    throw true;
} catch {
    _exception;
};
