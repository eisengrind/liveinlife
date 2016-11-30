
params [
    ["_sql", "", [""]],
    ["_extDB2_ID_name", lils_database_firstDB, [""]]
];

if (isNil "_sql") exitWith { false; };
private _extDB2_ID = uiNamespace getVariable [_extDB2_ID_name, -1];

private _result = [];
private _result = [_sql, 2, true, _extDB2_ID] call lils_database_fnc_async;
_result;
