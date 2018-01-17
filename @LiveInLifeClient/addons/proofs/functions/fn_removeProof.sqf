
params [
    ["_object", objNull, [objNull]],
    ["_proof", "", [""]],
    ["_aID", 0, [0]],
    ["_additional", false]
];

if (isNull _object) exitWith {};
if (_proof == "") exitWith {};
if (_aID <= 0) exitWith {};

private _proofs = (_object getVariable ["lilc_proofs_proofs", ([[], []] call CBA_fnc_hashCreate)]);

if !([_proofs, _proof] call CBA_fnc_hashHasKey) then {
    _proofs = ([_proofs, _proof, []] call CBA_fnc_hashSet);
};

//get all available proofs
private _values = ([_proofs, _proof] call CBA_fnc_hashGet);
private _index = (_values find [_aID, _additional]);

if (_index <= -1) exitWith {};

//insert our proof
_values deleteAt _index;

_proofs = (if ((count _values) <= 0) then {
    ([_proofs, _proof] call CBA_fnc_hashRem);
} else {
    ([_proofs, _proof, _values] call CBA_fnc_hashSet);
});

//proofs are global at any time!
_object setVariable ["lilc_proofs_proofs", _proofs, true];
