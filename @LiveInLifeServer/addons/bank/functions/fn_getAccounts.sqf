
params [
    ["_unit", objNull, [objNull]]
];

private _result = ([([
    "BANK_ACCOUNT_DATA",
    [
        ["ID"],
        ["NAME"]
    ],
    [
        ["steamid64", getPlayerUID _unit]
    ]
] call lils_database_fnc_generateFetchQuery)] call lils_database_fnc_fetchObjects);

if (_result isEqualType false) then {
    _result = [];
};

[
    _result,
    "lilc_bank_fnc_setAccounts",
    _unit
] call lilc_common_fnc_send;
