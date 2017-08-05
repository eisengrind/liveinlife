
/*
    Filename:
        fn_secondsToDigital.sqf
    Author:
        Vincent Heins
    Description:
        Formats a second-range to custom (default digital-) format. You have the given magic variables "HH"(hours), "MM"(minutes) and "SS"(seconds).
		It can be filled in the format as you whish.
    Param(s):
        (_this select 0) : the elapsed seconds eg. after restart : <SCALAR/INT>
		(_this select 1) : the format which can be customized; default HH:MM:SS format : <STRING>
    Result(s):
        the formated digital timestamp! : <STRING>
*/

params [
    ["_seconds", 0, [0]],
    ["_format", "HH:MM:SS", [""]] //keywords: HH(hours), MM(minutes), SS(seconds)
];

try {
    if (_seconds <= -1) throw _format;
    private _hours = floor ((_seconds / 60 / 60));
    private _minutes = floor ((_seconds - ((_hours * 60) * 60)) / 60);
    private _seconds = floor (_seconds - ((_minutes * 60) + (_hours * 60 * 60)));

    for [{_i = 0}, {_i <= 0}, {}] do {
        if ((_format find "HH") <= -1 && (_format find "MM") <= -1 && (_format find "SS") <= -1) throw _format;
        _format = [_format, "HH", ([(str _hours), 2, "0"] call lilc_common_fnc_fillString)] call KRON_Replace;
        _format = [_format, "MM", ([(str _minutes), 2, "0"] call lilc_common_fnc_fillString)] call KRON_Replace;
        _format = [_format, "SS", ([(str _seconds), 2, "0"] call lilc_common_fnc_fillString)] call KRON_Replace;
    };

    throw _format;
} catch {
    _exception;
};
