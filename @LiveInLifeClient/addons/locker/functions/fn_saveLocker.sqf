
params [
	["_lName", "", [""]]
];

if (_lName == "") exitWith {};

private _lGear = ([lilc_locker_lockers, _lName] call CBA_fnc_hashGet);

[
	[
		_lName,
		_lGear
	],
	"lils_locker_fnc_saveLocker"
] call lilc_common_fnc_sendToServer;
