
params [
	["_unit", objNull, [objNull]]
];

if (isNull _unit) exitWith {};

[
	[
		((getAllHitPointsDamage _unit) select 0),
		((getAllHitPointsDamage _unit) select 2)
	],
	(_unit getVariable ["ace_medical_morphine", 0]),
	(_unit getVariable ["ace_medical_openwounds", []]),
	(_unit getVariable ["ace_medical_bloodpressure", 0]),
	(_unit getVariable ["ace_medical_incardiacarrest", false]),
	(_unit getVariable ["ace_medical_internalwounds", []]),
	(_unit getVariable ["ace_medical_heartrate", 0]),
	(_unit getVariable ["ace_medical_pain", 0]),
	(_unit getVariable ["ace_medical_isbleeding", false]),
	(_unit getVariable ["ace_medical_bloodvolume", 100]),
	(_unit getVariable ["ace_medical_fractures", []]),
	(_unit getVariable ["ace_medical_triagelevel", 0]),
	(_unit getVariable ["ace_medical_haspain", false]),
	(_unit getVariable ["ace_medical_occludedmedications", []]),
	(_unit getVariable ["ace_medical_triagecard", []]),
	(_unit getVariable ["ace_medical_bodypartstatus", []]),
	(_unit getVariable ["ace_medical_allusedmedication", []]),
	(_unit getVariable ["ace_medical_bandagedwounds", []]),
	(_unit getVariable ["ace_medical_peripheralresistance", 100]),
	(_unit getVariable ["ace_medical_painsupress", 0]),
	(_unit getVariable ["ace_isunconsious", false]),
	(_unit getVariable ["ace_dragging_cancarry", false]),
	(_unit getVariable ["ace_dragging_candrag", false])
];
