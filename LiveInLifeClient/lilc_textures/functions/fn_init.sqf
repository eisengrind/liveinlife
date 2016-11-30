
while {true} do {
    {
        if (!isNull _x && (_x isKindOf "Man")) then {
            private ["_unit"];
            _unit = _x;

            [(_x getVariable ["lilc_clothingColor", "-1"]), _x, 0] call lilc_textures_fnc_setUniform;
            [(_x getVariable ["lilc_backpackColor", "-1"]), (backpackContainer _x), 0] call lilc_textures_fnc_setBackpack;
            [(([(_x getVariable ["lilc_factionRankID", 0])] call lilc_factionsInterface_fnc_getRankInfo) select 5), _x] call lilc_textures_fnc_setRankInsignia;
        } else {
            if (!isNull _x) then {
                [(_x getVariable ["lilc_vehicleColor", "-1"]), _x, 0] call lilc_textures_fnc_setVehicle;
            };
        };
    } forEach (allMissionObjects "AllVehicles") + playableUnits;

    sleep 10;
};
