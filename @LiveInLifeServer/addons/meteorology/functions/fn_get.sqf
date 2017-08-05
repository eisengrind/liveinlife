
try {
    private _weather = (["SELECT MAPTIME, MAPWEATHER FROM MAPENVIRONMENT LIMIT 1"] call lils_database_fnc_fetchObjects);
    if ((count _weather) <= 0) then {
        [(format["INSERT INTO MAPENVIRONMENT (TIMELASTSAVED, MAPTIME, MAPWEATHER) VALUES (UNIX_TIMESTAMP(), '""[]""', '""[]""')"])] call lils_database_fnc_query;
        sleep 0.5;
        _weather = (["SELECT MAPTIME, MAPWEATHER FROM MAPENVIRONMENT LIMIT 1"] call lils_database_fnc_fetchObjects);
        if ((count _weather) <= 0) throw [];
    };
    _weather = (_weather select 0);
    if ((count _weather) != 3) throw [];
    throw [([(_weather select 0)] call lils_common_fnc_arrayDecode), ([(_weather select 1)] call lils_common_fnc_arrayDecode)];
} catch {
    _exception;
};
