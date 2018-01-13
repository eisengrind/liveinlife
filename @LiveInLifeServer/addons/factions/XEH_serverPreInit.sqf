
[
    "set_lil_factions_faction",
    {
        _dbCol = [
            "GROUP",
            true,
            false,
            {
                params [
                    ["_unit", objNull, [objNull]],
                    ["_value", -1, [0]]
                ];

                if (_value <= -1) exitWith {};
                _unit setVariable ["lilc_factionID", _value, true];
                [_unit] call lils_factionsInterface_fnc_setFactionInfo;
            }
        ];
        false;
    }
] call lils_login_fnc_addPackage;

[
    "lils_vehicles_created",
    {
        params [
            ["_vehicle", objNull, [objNull]],
            ["_vehicleID", 0, [0]],
            ["_accountID", 0, [0]],
            ["_steam64ID", "", [""]],
            ["_factionID", -1, [0]]
        ];

        if (_factionID > -1) then
        {
            private _fCfg = ([_factionID] call lilc_factions_fnc_getFactionConfig);

            {
                [_vehicle, _x, 0, false] call lilc_inventory_fnc_addVehicle;
            } forEach (getArray(_fCfg >> "defaultVehicleItems"));
        };
    }
] call CBA_fnc_addEventHandler;
