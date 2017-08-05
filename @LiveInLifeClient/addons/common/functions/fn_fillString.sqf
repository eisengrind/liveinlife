
/*
    Filename:
        fn_fillString.sqf
    Author:
        Vincent Heins
    Description:
        Fills a string up to a given length with custom character/s. Default setting will put the character/s before the initial string.
    Param(s):
        (_this select 0) : string to edit : <STRING>
		(_this select 1) : length to fill up to (lengths < length of string will return the initial string) : <SCALAR/INT>
		(optional)(_this select 2) : will the character/s be attached to the string or not : <BOOL>
    Result(s):
        the filled string : <STRING>
*/

params [
    ["_string", "", [""]],
    ["_length", 0, [0]],
    ["_char", "", [""]],
    ["_append", false, [false]]
];

try {
    if (_length <= 0) throw _string;
    if (_char == "") throw _string;
    if ((count _char) != 1) throw _string;

    private _count = (count _string);
    if (_count >= _length) throw _string;
    
    private _result = _string;
    for [{private _i = 0}, {_i < (_length - _count)}, {_i = _i + 1}] do {
        if (_append) then {
            _result = _result + _char;
        } else {
            _result = _char + _result;
        };
    };

    throw _result;
} catch {
    _exception;
};
