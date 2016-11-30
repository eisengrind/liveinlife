
if (isDedicated && isServer && isMultiplayer) then {
    setTimeMultiplier 4;

    call lils_events_fnc_init;
    call lils_common_fnc_getAvailableClassnames;
    call lils_common_fnc_getAvailableStaticPositions;
    ["extDB2_ID_1", "LiveInLife"] call lils_database_fnc_init;
    call lils_database_fnc_lock;

    //call lils_shops_fnc_init;
    [] spawn lils_vehicles_fnc_initSaving;
    [] spawn lils_economy_fnc_init;
    [] spawn lils_cleanup_fnc_init;
    call lils_factionsInterface_fnc_init;
    call lils_meteorology_fnc_init;
    call lils_firstspawn_fnc_init;
};
