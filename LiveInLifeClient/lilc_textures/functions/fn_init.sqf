
while {true} do {
    {
        if (!isNull _x && (_x isKindOf "Man")) then {
            private ["_unit"];
            _unit = _x;

            [((uniformContainer _x) getVariable ["lilc_color", ""]), _x, 0] call lilc_textures_fnc_setUniform;
            [((backpackContainer _x) getVariable ["lilc_color", ""]), (backpackContainer _x), 0] call lilc_textures_fnc_setBackpack;
            /*[""(([(_x getVariable ["lilc_factionRankID", 0])] call lilc_factionsInterface_fnc_getRankInfo) select 5), _x] call lilc_textures_fnc_setRankInsignia;*/
        } else {
            if (!isNull _x) then {
                [(_x getVariable ["lilc_vehicleColor", ""]), _x, 0] call lilc_textures_fnc_setVehicle;
            };
        };
    } forEach (allMissionObjects "AllVehicles") + playableUnits;

    sleep 5;
};
