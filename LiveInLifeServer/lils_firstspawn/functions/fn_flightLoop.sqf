
lils_firstspawn_plane = ObjNull;
lils_firstspawn_queue = [];

["Mayday, mayday! Falcon flights are starting now", "lils_firstspawn"] call lilc_common_fnc_diag_log;
lils_firstspawn_queueOpen = false;
publicVariable "lils_firstspawn_queueOpen";
lils_firstspawn_planeReady = false;
publicVariable "lils_firstspawn_planeReady";

while {true} do {
    lils_firstspawn_plane = ObjNull;
    lils_firstspawn_queueOpen = true;
    publicVariable "lils_firstspawn_queueOpen";

    waitUntil { !((count lils_firstspawn_queue) <= 0) };
    sleep (2 * 60);

    lils_firstspawn_queueOpen = false;
    publicVariable "lils_firstspawn_queueOpen";

    try {
        {
            if (!isNull _x || alive _x) throw true;
        } forEach lils_firstspawn_queue;

        throw false;
    } catch {
        if (_exception) then {
            createCenter independent;
            private _spawnInfo = [[-worldsize/2, worldsize/2, 600], 0, "sab_falcon", independent] call BIS_fnc_spawnVehicle;
            lils_firstspawn_plane = _spawnInfo select 0;
            private _crew = _spawnInfo select 1;
            private _group = _spawnInfo select 2;

            lils_firstspawn_plane flyInHeightASL [500, 500, 500];
            lils_firstspawn_plane allowDamage false;
            lils_firstspawn_plane lock true;
            { _x allowDamage false; } forEach _crew;

            _group setBehaviour "CARELESS";
            _wp = _group addWaypoint [[15000, 15000, 0], 300];
            _wp setWaypointVisible false;
            _wp setWaypointStatements ["true", "{ deleteVehicle _x; } forEach thisList; deleteVehicle lils_firstspawn_plane;"];

            private _queue = lils_firstspawn_queue;
            lils_firstspawn_queue = [];
            lils_firstspawn_planeReady = true;
            {
                if (!isNull _x && alive _x && isPlayer _x && vehicle _x == _x) then {
                    _x moveInAny lils_firstspawn_plane;
                    _x allowDamage false;
                    (owner _x) publicVariableClient "lils_firstspawn_planeReady";
                };
            } forEach _queue;

            sleep 8;
            lils_firstspawn_plane landAt 0;

            waitUntil { isNull lils_firstspawn_plane && !alive lils_firstspawn_plane };

            lils_firstspawn_planeReady = false;
            {
                if (!isNull _x && alive _x && isPlayer _x && vehicle _x == _x) then {
                    (owner _x) publicVariableClient "lils_firstspawn_planeReady";
                };
            } forEach _queue;
        };
    };
};
