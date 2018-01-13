
params [
    ["_unit", objNull, [objNull]]
];

private _result = ([([
    "lockers",
    [
        ["name"],
        ["gear"]
    ],
    [
        ["account_id", (_unit getVariable ["lilc_accountID", 0])]
    ]
] call lils_database_fnc_generateFetchQuery)] call lils_database_fnc_fetchObjects);

_result = (_result apply {
    [
        (_x select 0),
        ([(_x select 1)] call lils_common_fnc_arrayDecode)
    ];
});

[
    _result,
    "lilc_locker_fnc_setLockers",
    _unit
] call lilc_common_fnc_send;
