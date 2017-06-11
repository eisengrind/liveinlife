
/*
    Filename:
        fn_addMinutesToGameTime.sqf
    Author:
        Vincent Heins
    Description:
        Add minute/s to gameTime-format.
    Param(s):
        (_this select 0) : gameTime to edit : <ARRAY>
		(_this select 1) : _minute/s to add : <SCALAR/INT>
    Result(s):
        <gameTime> : newly edited gameTime : <ARRAY>
*/

params [
    ["_gameTime", [], []],
    ["_minutes", 0, [0]]
];

try {
    if ((count _gameTime) <= 0) throw [];

    private _gameTimeFloat = ([_gameTime] call lilc_common_fnc_gameTimeToFloat);

    _gameTimeFloat = (_gameTimeFloat + ((1 / 60) * _minutes));

    if (_gameTimeFloat >= 24) then {
        _gameTimeFloat = (_gameTimeFloat - 24);
    } else {
        if (_gameTimeFloat < 0) then {
            _gameTimeFloat = (24 + _gameTimeFloat);
        };
    };

    throw [(floor _gameTimeFloat), (round ((_gameTimeFloat - (floor _gameTimeFloat)) * 60))];
} catch {
    _exception;
};
