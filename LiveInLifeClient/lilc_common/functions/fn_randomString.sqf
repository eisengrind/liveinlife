
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

try {
    if (_length <= 0) throw "";

    private _availableNumbers = "0123456789";
    private _availableLetters = "abcdefghijklmnopqrstuvwxyz";
    private _availableSpecials = "!?/\`´§$%&()[]{}""'*+~#°^<>|.:,;-_@";

    private _letters = "";
    if (_lower) then { _letters = (_letters + _availableLetters); };
    if (_upper) then { _letters = (_letters + toUpper(_availableLetters)); };
    if (_special) then { _letters = (_letters + _availableSpecials); };
    if (_numbers) then { _letters = (_letters + _availableNumbers); };
    if (_letters == "") throw "";

    private _result = [];
    _letters = toArray(_letters);

    for [{_i = 0}, {_i < _length}, {_i = _i + 1}] do { _result pushBack (selectRandom _letters); };

    throw (toString _result);
} catch {
    _exception;
};
