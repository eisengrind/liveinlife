
params [
    ["_query", "", [""]],
    ["_protocolName", lils_database_defaultProtocolName, [""]]
];

try
{
    if (isNil "_query") throw false;
    if (_protocolName == "") throw false;

    throw ([_query, 1, _protocolName] call lils_database_fnc_async);
}
catch
{
    _exception;
};

/*
params [
    ["_sql", "", [""]],
    ["_extDB2_ID_name", (if (!isNil "lils_database_firstDB") then { lils_database_firstDB; } else { "extDB2_ID_1"; }), [""]]
];
if (isNil "_sql") exitWith { false; };

private _extDB2_ID = -1;
if (isMultiplayer) then {
    _extDB2_ID = (uiNamespace getVariable [_extDB2_ID_name, -1]);
} else {
    _extDB2_ID = (profileNamespace getVariable [_extDB2_ID_name, -1]);
};
if (_extDB2_ID <= 0) exitWith { false; };

private _result = [_sql, 1, false, _extDB2_ID] call lils_database_fnc_async;
_result;
*/
