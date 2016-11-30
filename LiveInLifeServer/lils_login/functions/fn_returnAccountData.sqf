
_unit = param [0, ObjNull, [ObjNull]];

try {
    if (isNull _unit) throw false;
    if !(alive _unit) throw false;
    if !(isPlayer _unit) throw false;

    _result = [];
    _result = [(format["SELECT ID, FIRSTNAME, LASTNAME, `GROUP` FROM ACCOUNT_DATA WHERE STEAM64ID = '%1';", (getPlayerUID _unit)])] call lils_database_fnc_fetchObjects;    
} catch {
    if (_exception) then {
        [[_result], "lilc_login_fnc_setAccountData", _unit] call lilc_common_fnc_send;
    };
};
