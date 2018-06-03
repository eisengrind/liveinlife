
params [
    ["_unit", player, [objNull]],
    ["_volume", 0, [0]] //direct amount of alcohol (g) to add
];

if (!isPlayer _unit) exitWith {};
if (_volume <= 0) exitWith {};
if (_volumeFraction <= 0) exitWith {};

//lilc_drugs_bac is the bac-value times 100
_unit setVariable ["lilc_drugs_bac", 0.75*_volume/(75 * 0.69) + (_unit getVariable ["lilc_drugs_bac", 0]), true];
