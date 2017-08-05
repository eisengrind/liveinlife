
params [
	["_info", [], [[]]]
];

if (isNull (findDisplay 1304)) exitWith {};
if ((count _info) <= 0) exitWith {};

ctrlShow [1006, false];
for "_i" from 1002 to 1005 do
{
	ctrlShow [_i, true];
};

ctrlSetText [
	1003,
	(format["%1 %2", (_info select 0), (_info select 1)])
];

ctrlSetText [
	1005,
	(_info select 1)
];
