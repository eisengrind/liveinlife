
params [
    ["_mapTime", [], [[]]],
    ["_mapWeather", [], [[]]]
];

try {
    if ((count _mapTime) != 5) throw false;
    if ((count _mapWeather) != 7) throw false;

    [(format["UPDATE MAPENVIRONMENT SET TIMELASTUSED = UNIX_TIMESTAMP(), MAPTIME = '%1', MAPWEATHER = '%2'", ([_mapTime] call lils_common_fnc_arrayEncode), ([_mapWeather] call lils_common_fnc_arrayEncode)])] call lils_database_fnc_query;
    throw true;
} catch {
    _exception;
};
