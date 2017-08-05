
/*
    Filename:
        fn_randomString.sqf
    Author:
        Vincent Heins
    Description:
        Generates a random String with alphabetic and special chars on request.
    Param(s):
        (_this select 0) : lenght of the string : <SCALAR/INT>
		(_this select 1) : should numbers be generated? : <BOOL>
		(_this select 2) : should lower-case-letters be generated? : <BOOL>
		(_this select 3) : should upper-case-letters be generated? : <BOOL>
		(_this select 4) : should special chars be generated? : <BOOL>
    Result(s):
        the generated string with specific parameters : <STRING>
*/

params [
    ["_length", 0, [0]],
    ["_numbers", false, [false]],
    ["_lower", false, [false]],
    ["_upper", false, [false]],
    ["_special", false, [false]]
];

private _chars = format[
    "%1%2%3%4",
    (if (_numbers) then { "0123456789"; } else { ""; }),
    (if (_upper) then { "ABCDEFGHIJKLMNOPQRSTUVWXYZ"; } else { ""; }),
    (if (_lower) then { "abcdefghijklmnopqrstuvwxyz"; } else { ""; }),
    (if (_special) then { "!?/\`´§$%&()[]{}""'*+~#°^<>|.:,;-_@"; } else { ""; })
];

private _result = "";
for "_i" from 0 to (_length - 1) do
{
    _result = format["%1%2", _result, (_chars select [(round (random ((count _chars) - 1))), 1])]
};

_result;
