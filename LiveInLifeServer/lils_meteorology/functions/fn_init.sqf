
_environmentSetting = [];
_environmentSetting = call lils_meteorology_fnc_get;
_environmentSetting call lils_meteorology_fnc_set;

[] spawn {
    while {true} do {
        call lils_meteorology_fnc_save;
        sleep (2 * 60);
    };
};
