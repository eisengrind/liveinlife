/*
    Date:
        17.10.2016
    Author:
        Vincent Heins
    Description:
        Alias for remoteExec.
    Params:
        (_this select 0) : Parameters to send to object : <ANY>
        (_this select 1) : Function name to call : <STRING>
        (_this select 2) : Unit/Server to call the function on : <OBJECTNULL>, <SCALAR/INT>
        (_this select 3) : Send request to jip unit? : <BOOL>
    Returns:
        true / false - Returns true if request was send; otherwise false - <BOOL>
    License:
        @LiveInLifeClient\license.txt
*/

params [
    ["_parameters", []],
    ["_functionName", "", [""]],
    ["_target", ObjNull, [ObjNull, [], GrpNull, "", 0, sideUnknown]],
    ["_jip", false, [false, "", ObjNull, GrpNull]]
];

if (isNil "_functionName") exitWith { false; };

private _result = "";
[(format["Function '%1' was called", _functionName])] call lilc_log_fnc_diag_log;
(_parameters remoteExec [_functionName, _target, _jip]) isEqualType "";
