
params [
    ["_unit", objNull, [objNull]],
    ["_lockerID", 0, [0]],
    ["_lockerName", "", [""]],
    ["_gear", [], [[]]]
];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;
    if (_lockerID <= 0) throw false;
    
    private _lockerConfig = ([_lockerName] call lilc_locker_fnc_getLockerConfig);
    if (isNull _lockerConfig) throw false;

    if ((getNumber(_lockerConfig >> "isLocal")) == 0) then {
        _lockerName = "";
    };

    [(format["UPDATE LOCKER_DATA SET GEAR = '%1' WHERE ID = '%2' AND ACCOUNTID = '%3' AND STEAM64ID = '%4' AND LOCKER = '""%5""'", ([_gear] call lils_common_fnc_arrayEncode), _lockerID, (_unit getVariable ["lilc_accountID", 0]), (getPlayerUID _unit), _lockerName])] call lils_database_fnc_query;
    throw true;
} catch {
    _exception;
};
