
lilc_time_events params ["", "_keys", "_values"];

private _time = lilc_time_currentTime;
{
	private _k = _x;
	private _v = (_values select _forEachIndex);
	private _t = (_v select 0);
	private _c = (_v select 1);

	private _exec = false;
	_exec = (switch (count _t) do
	{
		case 1:
		{
			((_t select 0) isEqualTo (_time select 0));
		};

		case 2:
		{
			(
				(_t select 0) isEqualTo (_time select 0) &&
				(_t select 1) isEqualTo (_time select 1)
			);
		};

		case 3:
		{
			(
				(_t select 0) isEqualTo (_time select 0) &&
				(_t select 1) isEqualTo (_time select 1) &&
				(_t select 2) isEqualTo (_time select 2)
			);
		};

		case 4:
		{
			(
				(_t select 0) isEqualTo (_time select 0) &&
				(_t select 1) isEqualTo (_time select 1) &&
				(_t select 2) isEqualTo (_time select 2) &&
				(_t select 3) isEqualTo (_time select 3)
			);
		};

		case 5:
		{
			(
				(_t select 0) isEqualTo (_time select 0) &&
				(_t select 1) isEqualTo (_time select 1) &&
				(_t select 2) isEqualTo (_time select 2) &&
				(_t select 3) isEqualTo (_time select 3) &&
				(_t select 4) isEqualTo (_time select 4)
			);
		};

		case 6:
		{
			(
				(_t select 0) isEqualTo (_time select 0) &&
				(_t select 1) isEqualTo (_time select 1) &&
				(_t select 2) isEqualTo (_time select 2) &&
				(_t select 3) isEqualTo (_time select 3) &&
				(_t select 4) isEqualTo (_time select 4) &&
				(_t select 5) isEqualTo (_time select 5)
			);
		};
	});

	if (_exec) then
	{
		_t call _c;
	};
} forEach _keys;
