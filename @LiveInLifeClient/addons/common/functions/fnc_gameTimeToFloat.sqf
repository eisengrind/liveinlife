
/*
    Filename:
        fn_gameTimeToFloat.sqf
    Author:
        Vincent Heins
    Description:
        Converts gameTime to float time (range 0-23.9~).
    Param(s):
        (_this select 0) : gameTime to calculate : <ARRAY>
    Result(s):
        the gameTime as decimal number : <SCALAR/INT/FLOAT>
*/

private _gameTime = param [0, [], [[]]];

try {
    if ((count _gameTime) != 2) throw -1;
    _gameTime = ((_gameTime select 0) + ((1 / 60) * (_gameTime select 1)));

    if (_gameTime < 0) throw -1;
    if (_gameTime >= 24) throw -1;

    throw _gameTime;
} catch {
    _exception;
};
