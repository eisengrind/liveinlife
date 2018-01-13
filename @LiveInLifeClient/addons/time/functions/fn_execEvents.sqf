
lilc_time_events params ["", "_keys", "_values"];

private _time = lilc_time_currentTime;
{
    private _k = _x;
    private _v = (_values select _forEachIndex);
    private _t = +(_v select 0);
    private _c = (_v select 1);

    for "_i" from (count _t) to 5 do
    {
        _t pushBack (_time select _i);
    };

    if (_t isEqualTo _time) then
    {
        [_t, (_v select 2)] call _c;
    };
} forEach _keys;
