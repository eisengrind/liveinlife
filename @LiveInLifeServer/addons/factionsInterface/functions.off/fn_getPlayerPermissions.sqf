
private _unit = param [0, ObjNull, [ObjNull]];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if !(alive _unit) throw false;

    _permissions = [(format["SELECT PERMISSIONS FROM FACTION_PLAYER_DATA WHERE ACCOUNTID = '%1' AND STEAM64ID = '%2'", (_unit getVariable ["lilc_accountID", 0]), (getPlayerUID _unit)])] call lils_database_fnc_fetchObjects;
    _permissions = (_permissions select 0);

    [[_permissions], "lilc_factionsInterface_fnc_setPermissions", _unit] call lilc_common_fnc_send;
} catch {
    _exception;
};
