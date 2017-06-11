
/*
    Filename:
        fn_executeFile.sqf
    Author:
        Vincent Heins
    Description:
        Compiles and executes given file and filepath in scheduled environment.
    Param(s):
        (_this select 0) : file path to .sqf file location : <STRING>
    Result(s):
        true/false : true on success; false on error : <BOOL>
*/

private _path = param [0, "", [""]];

try {
    if (_path == "") throw false;
    (call compile preprocessFileLineNumbers _path);
    throw true;
} catch {
    _exception;
};
