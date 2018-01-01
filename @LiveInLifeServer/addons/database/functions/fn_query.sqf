
params [
    ["_query", "", [""]],
    ["_protocolName", lils_database_defaultProtocolName, [""]]
];

if (isNil "_query") exitWith { false; };
if (_protocolName == "") exitWith { false; };

([_query, 1, _protocolName] call lils_database_fnc_async);
