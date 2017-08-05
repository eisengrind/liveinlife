
params [
    ["_query", "", [""]],
    ["_protocolName", lils_database_defaultProtocolName, [""]]
];

try
{
    if (isNil "_query") throw false;
    if (_protocolName == "") throw false;

    throw ([_query, 2, _protocolName] call lils_database_fnc_async);
}
catch
{
    _exception;
};
