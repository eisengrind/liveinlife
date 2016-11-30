
params [
    ["_unit", objNull, [objNull]],
    ["_lockerName", "", [""]]
];

try {
    if (isNull _unit) throw [];
    if !(isPlayer _unit) throw [];

    private _lockerConfig = ([_lockerName] call lilc_locker_fnc_getLockerConfig);
    if (isNull _lockerConfig) throw [];

    private _lockerLocal = "";
    if ((getNumber(_lockerConfig >> "isLocal")) == 1) then {
        _lockerLocal = _lockerName;
    };

    private _lockers = ([(format["SELECT ID FROM LOCKER_DATA WHERE ACCOUNTID = '%1' AND STEAM64ID = '%2' AND LOCKER = '""%3""'", (_unit getVariable ["lilc_accountID", 0]), (getPlayerUID _unit), _lockerLocal])] call lils_database_fnc_fetchObjects);
    throw _lockers;
} catch {
    [[_exception], "lilc_locker_fnc_setLockers", _unit] call lilc_common_fnc_send;
};
