
disableSerialization;
params [
	["_control", controlNull, [controlNull]],
	["_config", configNull, [configNull]],
	["_timeout", 0.2, [0]]
];

_control ctrlSetPosition [
	getNumber(_config >> "x"),
	getNumber(_config >> "y")
];
_control ctrlCommit _timeout;
