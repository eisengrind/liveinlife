
params [
	["_unit", objNull, [objNull]]
];

(
	!(isNull _unit) &&
	(alive _unit) &&
	!(_unit getVariable ["lilc_isDead", false])
);
