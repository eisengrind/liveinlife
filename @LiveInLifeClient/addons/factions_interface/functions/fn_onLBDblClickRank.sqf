
disableSerialization;
params [
    ["_control"],
    ["_index"]
];

private _active = (_control lnbValue [_index, 2]) == 1;
_control lnbSetValue [[_index, 2], parseNumber !_active];
_control lnbSetText [[_index, 2], ["Ja", "Nein"] select _active];
