
{
    private _timeout = (_x getVariable ["lilc_corpseTimeout", (time + (2 * 60))]);
    if (_timeout <= time) then {
        deleteVehicle _x;
    } else {
        _x setVariable ["lilc_corpseTimeout", _timeout];
    };
} forEach allDead;
