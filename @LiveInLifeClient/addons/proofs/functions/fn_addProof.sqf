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
    ["_proofName", "", [""]],
    ["_value", nil]
];

if (isNull _object) exitWith {};
if (_proofName == "") exitWith {};
if (isNil "_value") exitWith {};

private _sArr = [_proofName, _value];
private _proofs = (_object getVariable ["lilc_proofs_proofs", []]);
if (_sArr in _proofs) exitWith {};
_proofs pushback _sArr;

_object setVariable ["lilc_proofs_proofs", _proofs];
