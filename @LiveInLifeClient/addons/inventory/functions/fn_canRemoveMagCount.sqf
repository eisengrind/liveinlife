
params [
	["_magazineName", "", [""]],
	["_rmMagC", 0, [0]]
];

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
true;
