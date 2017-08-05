
/*
    Filename:
        fn_gameTimeDiff.sqf
    Author:
        Vincent Heins
    Description:
        Calculates the range between two gameTime's. Say i want the difference from 22.00 to 03.00 = 5h
    Param(s):
        (_this select 0) : the gameTime stamp to begin with : <ARRAY>
		(_this select 1) : the gameTime stamp to calculate to : <ARRAY>
    Result(s):
        the difference in decimal number : <SCALAR/INT/FLOAT>
*/

params [
    ["_dateTimeFirst", [], [[]]],
    ["_dateTimeSecond", [], [[]]]
];

try {
    if ((count _dateTimeFirst) != 2) throw 0;
    if ((count _dateTimeSecond) != 2) throw 0;

    private _dateTimeFirstFloat = ([_dateTimeFirst] call lilc_common_fnc_gameTimeToFloat); // eg. 23.5 == 23:30 
    private _dateTimeSecondFloat = ([_dateTimeSecond] call lilc_common_fnc_gameTimeToFloat);

    if (_dateTimeFirstFloat >= 24) throw 0;
    if (_dateTimeSecondFloat >= 24) throw 0;
    if (_dateTimeFirstFloat < 0) throw 0;
    if (_dateTimeSecondFloat < 0) throw 0;

    if (_dateTimeSecondFloat == _dateTimeFirstFloat) throw 24;

    if (_dateTimeSecondFloat < _dateTimeFirstFloat) throw (24 - (_dateTimeFirstFloat - _dateTimeSecondFloat));
    if (_dateTimeFirstFloat < _dateTimeSecondFloat) throw (_dateTimeSecondFloat - _dateTimeFirstFloat);

    throw 0;
} catch {
    _exception;
};
