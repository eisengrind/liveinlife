
/*
    Filename:
        fn_formatGameTime.sqf
    Author:
        Vincent Heins
    Description:
        Formats the gameTime to digital time format.
    Param(s):
        (_this select 0) : given gameTime : <ARRAY>
    Result(s):
        the gameTime in digital time format : <STRING>
*/

private _gameTime = param [0, [], [[]]];

try {
    if ((count _gameTime) != 2) throw "";
    throw format["%1:%2", (if ((_gameTime select 0) <= 9 && (_gameTime select 1) >= 0) then { format["0%1", (_gameTime select 0)]; } else { (_gameTime select 0); }), (if ((_gameTime select 1) <= 9 && (_gameTime select 1) >= 0) then { format["0%1", (_gameTime select 1)]; } else { (_gameTime select 1); })];
} catch {
    _exception;
};
