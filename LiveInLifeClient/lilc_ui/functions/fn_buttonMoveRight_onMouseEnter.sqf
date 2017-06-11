
disableSerialization;
params [
	["_control", controlNull, [controlNull]],
	["_config", configNull, [configNull]],
	["_timeout", 0.2, [0]],
	["_distance", 0.05, [0]]
];

_control ctrlSetPosition [
	getNumber(_config >> "x") + _distance,
	getNumber(_config >> "y")
];
_control ctrlCommit _timeout;
