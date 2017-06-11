
params [
    ["_unit", objNull, [objNull]],
    ["_lockerName", "", [""]]
];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if (_lockerName == "") throw false;

    private _lockerConfig = ([_lockerName] call lilc_locker_fnc_getLockerConfig);
    if (isNull _lockerConfig) throw false;

    private _isLocal = getNumber(_lockerConfig >> "isLocal");
    if (_isLocal <= 0) then {
        _lockerName = "";
    };

    [(format["INSERT INTO LOCKER_DATA (ID, ACCOUNTID, STEAM64ID, GEAR, `LOCKER`) VALUES (NULL, '%1', '%2', '""[]""', '""%3""')", (_unit getVariable ["lilc_accountID", 0]), (getPlayerUID _unit), _lockerName])] call lils_database_fnc_query;
} catch {
    _exception;
};
