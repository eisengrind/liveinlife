/*
[
	[
		"HandGrenade",
		"30Rnd_65x39_caseless_mag"
	],
	[
		[
			1, 1,
			0, 1
		],
		[
			30, 4
		]
	]
]
*/

params [
	["_container", objNull, [objNull]]
];

private _mAC = (magazinesAmmoCargo _container);

private _mACS = [[], []];
{
	private _mag = _x;
	private _i = -1;
	{
		private _cMag = _x;
		if (_cMag == (_mag select 0)) exitWith
		{
			_i = _forEachIndex;			
			{
				if ((_forEachIndex % 2) == 0) then
				{
					systemChat str _x;
					private _c = _x;
					private _a = (((_mACS select 1) select _i) select (_forEachIndex + 1));

					if (_c == (_mag select 1)) then
					{
						((_mACS select 1) select _i) set [(_forEachIndex + 1), (_a + 1)];
					}
					else
					{
						((_mACS select 1) select _i) pushBack (_mag select 1);
						((_mACS select 1) select _i) pushBack 1;
					};
				};
			} forEach ((_mACS select 1) select _i);
		};
	} forEach (_mACS select 0);

	if (_i <= -1) then
	{
		(_mACS select 0) pushBack (_mag select 0);
		(_mACS select 1) pushBack [(_mag select 1), 1];
	};
} forEach _mAC;

_mACS;
