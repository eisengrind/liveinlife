
params [
	["_time", [], [[]]],
	["_code", nil]
];

if ((count _time) != 6) exitWith { -1; };
if (isNil "_code") exitWith { -1; };

private _keys = ([lilc_time_events] call CBA_fnc_hashKeys);

private _i = 0;

while
{
	!(_i in _keys);
}
do
{
	_i = _i + 1;
};

lilc_time_events = ([lilc_time_events, _i, _code] call CBA_fnc_hashSet);
_i;
