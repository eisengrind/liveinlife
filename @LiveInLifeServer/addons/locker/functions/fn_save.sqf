
params [
    ["_unit", objNull, [objNull]],
    ["_lockerName", "", [""]],
    ["_gear", [], [[]]]
];

try {
    if (isNull _unit) throw false;
    if !(isPlayer _unit) throw false;

    [(format[
        "UPDATE LOCKER_DATA SET GEAR = '%1' WHERE ACCOUNTID = '%2' AND LOCKER = '%3'",
        ([_gear] call lils_common_fnc_arrayEncode),
        (_unit getVariable ["lilc_accountID", 0]),
        (str _lockerName)
    ])] call lils_database_fnc_query;
    throw true;
} catch {
    _exception;
};
