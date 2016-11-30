
call lils_economy_fnc_loadEconomyData;

_counter = 0;
while {true} do {
    call lils_economy_fnc_processData;
    call lils_economy_fnc_sendData;
    sleep (2 * 60);
};
