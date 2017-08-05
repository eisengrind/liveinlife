
/*
    Filename:
        fn_inGameTime.sqf
    Author:
        Vincent Heins
    Description:
        This is the file which i meant in inBusinessHours... This module will check if a given gameTime is between two other gameTime's.
    Param(s):
        (_this select 0) : opening gameTime : <ARRAY(2)>
		(_this select 1) : closing gameTime : <ARRAY(2)>
		(_this select 2) : gameTime to check : <ARRAY(2)>
    Result(s):
        true = is in game time; false != true : <BOOL>
*/

params [
    ["_dateTimeStart", [], [[]]],
    ["_dateTimeEnd", [], [[]]],
    ["_dateTimeToCheck", [], [[]]]
];

try {
    if ((count _dateTimeStart) != 2) throw false;
    if ((count _dateTimeEnd) != 2) throw false;
    if ((count _dateTimeToCheck) != 2) throw false;

    private _dateTimeStartFloat = ([_dateTimeStart] call lilc_common_fnc_gameTimeToFloat); // eg. 23.5 == 23:30 
    private _dateTimeEndFloat = ([_dateTimeEnd] call lilc_common_fnc_gameTimeToFloat);
    private _dateTimeToCheckFloat = ([_dateTimeToCheck] call lilc_common_fnc_gameTimeToFloat);

    if (_dateTimeEndFloat >= 24) throw false;
    if (_dateTimeStartFloat >= 24) throw false;
    if (_dateTimeToCheckFloat >= 24) throw false;
    if (_dateTimeEndFloat < 0) throw false;
    if (_dateTimeStartFloat < 0) throw false;
    if (_dateTimeToCheckFloat < 0) throw false;

    if (_dateTimeEndFloat == _dateTimeStartFloat) throw false; //not possible date...

    if (_dateTimeEndFloat < _dateTimeStartFloat) then {
        if (_dateTimeToCheckFloat <= _dateTimeEndFloat) then { throw true; } else {
            if (_dateTimeToCheckFloat >= _dateTimeStartFloat) throw true;
        };
    };

    if (_dateTimeStartFloat < _dateTimeEndFloat) then {
        if (_dateTimeToCheckFloat <= _dateTimeEndFloat && _dateTimeToCheckFloat >= _dateTimeStartFloat) throw true;
    };

    throw false;
} catch {
    _exception;
};
