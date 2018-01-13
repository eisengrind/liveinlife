
params [
    ["_n", "", [""]],
    ["_g", [], [[]]]
];

if (_n == "") exitWith {};

private _pU = [];
if !(isMultiplayer) then
{
    _pU = [player];
}
else
{
    _pU = playableUnits;
};

private _u = (_pU select { ((owner _x) isEqualTo remoteExecutedOwner); });
if ((count _u) <= 0) exitWith {};
_u = (_u select 0);

if (isNull _u) exitWith {};

[(format[
    "INSERT IGNORE INTO lockers (account_id, gear, name) VALUES (%1, '%2', '%3')",
    (_u getVariable ["lilc_accountID", 0]),
    ([_g] call lils_common_fnc_arrayEncode),
    (str _n)
])] call lils_database_fnc_query;

[([
    "lockers",
    [
        ["gear", ([_g] call lils_common_fnc_arrayEncode)]
    ],
    [
        ["account_id", (_u getVariable ["lilc_accountID", 0])],
        ["name", (str _n)]
    ]
] call lils_database_fnc_generateUpdateQuery)] call lils_database_fnc_query;
