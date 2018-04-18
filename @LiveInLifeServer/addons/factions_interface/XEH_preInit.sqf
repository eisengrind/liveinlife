
[
    "lilse_common_afterDatabaseInitialization",
    {
        private _ranks = [[
            "faction_ranks",
            [
                ["rid"],
                ["name"],
                ["tag"],
                ["paycheck"],
                ["insignia"],
                ["permissions"],
                ["items"],
                ["vehicles"]
            ]
        ] call lils_database_fnc_generateFetchQuery] call lils_database_fnc_fetchObjects;

        for "_i" from 0 to (count _ranks) - 1 do {
            private _rank = _ranks select _i;
            _rank set [5, [_rank select 5] call lils_common_fnc_arrayDecode];
            _rank set [6, [_rank select 6] call lils_common_fnc_arrayDecode];
            _rank set [7, [_rank select 7] call lils_common_fnc_arrayDecode];

            private _rankVariable = format["lilc_factions_interface_ranks_%1", _rank select 0];
            missionNamespace setVariable [_rankVariable, _rank];
            publicVariable _rankVariable;
        };
    }
] call CBA_fnc_addEventHandler;
