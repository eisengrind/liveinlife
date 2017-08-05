
params [
	["_magazineName", "", [""]],
	["_rmMagC", 0, [0]]
];

if (_rmMagC == 0) exitWith { true; };

private _mAF = (magazinesAmmoFull player);

_mAF = (_mAF select {
	((_x select 0) == _magazineName);
});

private _index = -1;
private _num = 0;
{
	private _count = (_x select 1);
	if ((_index <= -1 && (_count - _rmMagC) >= 0) || ((_count - _rmMagC) >= 0 && _count < _num)) then
	{
		_index = _forEachIndex;
		_num = _count;
	};
} forEach _mAF;

if (_index <= -1) exitWith { false; };

_mAF = (_mAF apply {
	player removeMagazine (_x select 0);
	_x;
});

{
	if (_forEachIndex == _index) then
	{
		private _count = ((_x select 1) - _rmMagC);
		if (_count > 0) then
		{
			player addMagazine [_magazineName, _count];
		};
	}
	else
	{
		player addMagazine [_magazineName, (_x select 1)];
	};
} forEach _mAF;

true;