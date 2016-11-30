
try {
    _rows = ["SELECT COUNT(*) FROM MAPENVIRONMENT"] call lils_database_fnc_fetchObjects;
    
    if ((count _rows) == 1) then {
        if ((count (_rows select 0)) == 1) then {
            _weather = [];
            _weatherData = (call lils_meteorology_fnc_get);
            { _weather pushBack (_x select 1); } forEach _weatherData;
            
            if (((_rows select 0) select 0) == 1) then {
                [format["UPDATE MAPENVIRONMENT SET MAPTIME = '%1', MAPWEATHER = '%2', TIMELASTSAVED = UNIX_TIMESTAMP()", (str date), (str _weather)]] call lils_database_fnc_query;
                throw true;
            } else {
                [format["INSERT INTO MAPENVIRONMENT (MAPTIME, MAPWEATHER, TIMELASTSAVED) VALUES ('%1', '%2', UNIX_TIMESTAMP())", (str date), (str (call lils_meteorology_fnc_get))]] call lils_database_fnc_query;
                throw false;
            };
        };
    };

    throw true;
} catch {
    _exception;
};
