
params [
	["_secs", 0, [0]],
	["_format", "HH:MM:SS", [""]]
];

private _h = floor (_secs / 3600);
private _m = (floor ((_secs - (_h * 3600)) / 60));
private _s = (floor (_secs - (_h * 3600) - (_m * 60)) max 0);

private _HH = ([(str _h), 2, "0"] call lilc_common_fnc_fillString);
private _MM = ([(str _m), 2, "0"] call lilc_common_fnc_fillString);
private _SS = ([(str _s), 2, "0"] call lilc_common_fnc_fillString);

_format = [_format, "HH", _HH] call KRON_Replace;
_format = [_format, "MM", _MM] call KRON_Replace;
_format = [_format, "SS", _SS] call KRON_Replace;
_format;
