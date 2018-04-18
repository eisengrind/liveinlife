
scriptName "lils_cleanup_cleanup";

[{
    //cleanup dead bodies
    if ((count allDead) > 0) then {
        {
            private _timeout = (_x getVariable ["lils_cleanup_timeout", 0]);

            if (_timeout <= 0) then {
                _timeout = time + (2 * 60);
                _x setVariable ["lils_cleanup_timeout", _timeout, true];
            };

            if (_timeout <= time) then {
                deleteVehicle _x;
            };
        } forEach allDead;
    };

    //cleanup GroundWeaponHolder
    {
        if !(_x getVariable ["lilc_backpacks_isBackpack", false]) then {
            private _timeout = _x getVariable ["lils_cleanup_timeout", 0];

            if (_timeout <= 0) then {
                _timeout = time + (2 * 60);
                _x setVariable ["lils_cleanup_timeout", _timeout, true];
            };

            if (_timeout <= time) then {
                deleteVehicle _x;
            };
        };
    } forEach (allMissionObjects "GroundWeaponHolder");
}, 30] call CBA_fnc_addPerFrameHandler;
