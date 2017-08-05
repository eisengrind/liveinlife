
params [
	["_unit", objNull, [objNull]],
	["_damage", [], [[]]]
];

if (isNull _unit) exitWith {};
if ((count _damage) <= 0) exitWith {};

private _hitpoints = (_damage select 0);
{
	_unit setHitPointDamage [
		_x,
		((_hitpoints select 1) select _forEachIndex)
	];
} forEach (_hitpoints select 0);

(_unit setVariable ["ace_medical_morphine", (_damage select 1)]);
(_unit setVariable ["ace_medical_openwounds", (_damage select 2)]);
(_unit setVariable ["ace_medical_bloodpressure", (_damage select 3)]);
(_unit setVariable ["ace_medical_incardiacarrest", (_damage select 4)]);
(_unit setVariable ["ace_medical_internalwounds", (_damage select 5)]);
(_unit setVariable ["ace_medical_heartrate", (_damage select 6)]);
(_unit setVariable ["ace_medical_pain", (_damage select 7)]);
(_unit setVariable ["ace_medical_isbleeding", (_damage select 8)]);
(_unit setVariable ["ace_medical_bloodvolume", (_damage select 9)]);
(_unit setVariable ["ace_medical_fractures", (_damage select 10)]);
(_unit setVariable ["ace_medical_triagelevel", (_damage select 11)]);
(_unit setVariable ["ace_medical_haspain", (_damage select 12)]);
(_unit setVariable ["ace_medical_occludedmedications", (_damage select 13)]);
(_unit setVariable ["ace_medical_triagecard", (_damage select 14)]);
(_unit setVariable ["ace_medical_bodypartstatus", (_damage select 15)]);
(_unit setVariable ["ace_medical_allusedmedication", (_damage select 16)]);
(_unit setVariable ["ace_medical_bandagedwounds", (_damage select 17)]);
(_unit setVariable ["ace_medical_peripheralresistance", (_damage select 18)]);
(_unit setVariable ["ace_medical_painsupress", (_damage select 19)]);
(_unit setVariable ["ace_isunconsious", (_damage select 20)]);
(_unit setVariable ["ace_dragging_cancarry", (_damage select 21)]);
(_unit setVariable ["ace_dragging_candrag", (_damage select 22)]);

true;
