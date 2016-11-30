
params [
    ["_sql", "", [""]],
    ["_extDB2_ID_name", lils_database_firstDB, [""]]
];
if (isNil "_sql") exitWith { false; };
private _extDB2_ID = uiNamespace getVariable [_extDB2_ID_name, -1];
if (_extDB2_ID <= 0) exitWith { false; };

private _result = [_sql, 1, false, _extDB2_ID] call lils_database_fnc_async;
_result;
