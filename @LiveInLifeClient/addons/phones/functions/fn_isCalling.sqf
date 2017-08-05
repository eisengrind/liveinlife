
params [
	["_target", objNull, [objNull]]
];

if (isNull _target) exitWith {};

(_target getVariable ["lilc_phones_calling", false]);
