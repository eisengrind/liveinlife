
params [
	["_container", objNull, [objNull]],
	["_magazines", [[], []], []]
];

if (isNull _container || !(alive _container)) exitWith {};
if ((count _magazines) <= 0) exitWith {};

{
	private _mag = _x;
	private _i = _forEachIndex;
	{
		if ((_forEachIndex % 2) == 0) then
		{
			private _a = (((_magazines select 1) select _i) select (_forEachIndex + 1));
			_container addMagazineAmmoCargo [_mag, _a, _x];
		};
	} forEach ((_magazines select 1) select _i);
} forEach (_magazines select 0);
