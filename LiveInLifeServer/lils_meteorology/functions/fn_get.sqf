
try {
    _rows = ["SELECT MAPTIME, MAPWEATHER FROM MAPENVIRONMENT LIMIT 1"] call lils_database_fnc_fetchObjects;

    if ((count _rows) == 1) then {
        if ((count (_rows select 0)) == 2) then {
            throw (call compile format["%1;", (_rows select 0)]);
        };
    };

    throw [];
} catch {
    _exception;
};
