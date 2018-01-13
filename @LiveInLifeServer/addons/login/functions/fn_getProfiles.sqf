
private _unit = param [0, objNull, [objNull]];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;

    private _profiles = ([(format["SELECT ID, FIRSTNAME, LASTNAME, `GROUP` FROM ACCOUNT_DATA WHERE STEAM64ID = '%1'", (getPlayerUID _unit)])] call lils_database_fnc_fetchObjects);
    
    [[_profiles], "lilc_login_fnc_setProfiles", _unit] call lilc_common_fnc_send;
    throw true;
} catch {
    _exception;
};
