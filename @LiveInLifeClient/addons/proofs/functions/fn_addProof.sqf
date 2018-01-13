/*
Proofs:
    lilcp_fingerprint
    lilcp_blood
    lilcp_hair
    lilcp_projectile
    lilcp_scale
*/

params [
    ["_object", objNull, [objNull]],
    ["_proof", "", [""]],
    ["_aID", 0, [0]],
    ["_additional", nil]
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
if ([_aID, _additional] in _values) exitWith {};

//insert our proof
_values pushBack [_aID, _additional];

_proofs = ([_proofs, _proof, _values] call CBA_fnc_hashSet);

//proofs are global at any time!
_object setVariable ["lilc_proofs_proofs", _proofs, true];
