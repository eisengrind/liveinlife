
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
                ["insignia"]
            ]
        ] call lils_database_fnc_generateFetchQuery] call lils_database_fnc_fetchObjects;

        if (isNil "_ranks") exitWith {};
        if (_ranks isEqualType false) exitWith {};

        {
            _x params [
                "_rid",
                "_name",
                "_tag",
                "_paycheck",
                "_insignia"
            ];
            private _rankInfo = [[
                "faction_ranks",
                [
                    ["permissions"],
                    ["items"],
                    ["vehicles"]
                ],
                [
                    ["rid", _rid]
                ]
            ] call lils_database_fnc_generateFetchQuery] call lils_database_fnc_fetchObjects;

            _rankInfo = _rankInfo select 0;

            _rankInfo set [0, [_rankInfo select 0] call lils_common_fnc_arrayDecode];
            _rankInfo set [1, [_rankInfo select 1] call lils_common_fnc_arrayDecode];
            _rankInfo set [2, [_rankInfo select 2] call lils_common_fnc_arrayDecode];

            private _rankVariable = format["lilc_factions_interface_ranks_%1", _rid];
            missionNamespace setVariable [_rankVariable, [_rid, _name, _tag, _paycheck, _insignia, _rankInfo select 0, _rankInfo select 1, _rankInfo select 2]];
            publicVariable _rankVariable;
        } forEach _ranks;
    }
] call CBA_fnc_addEventHandler;
