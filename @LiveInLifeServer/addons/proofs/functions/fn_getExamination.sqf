
params [
    ["_unit", objNull, [objNull]],
    ["_aID", 0, [0]]
];

if !(isPlayer _unit) exitWith {};
if (_aID <= 0) exitWith {};

private _result = ([(format[
    "SELECT FIRSTNAME, LASTNAME FROM ACCOUNT_DATA WHERE ID = '%1' LIMIT 1",
    _aID
])] call lils_database_fnc_fetchObjects);

[(format["%1 %2", ((_result select 0) select 0), ((_result select 0) select 1)]), "lilc_proofs_fnc_examineProofReceived", _unit] call lilc_common_fnc_send;
