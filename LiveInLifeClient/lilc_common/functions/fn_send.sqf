/*
    Date:
        17.10.2016
    Author:
        Vincent Heins
    Description:
        Alias for remoteExec.
    Params:
        0 - Parameters to send to object - <ANY>
        1 - Function name to call - <STRING>
        2 - Unit/Server to call the function on - <OBJECT/INTEGER/SCALAR>
        3 - Send request to jip unit? - <BOOLEAN>
    Returns:
        true / false - Returns true if request was send; otherwise false - <BOOLEAN>
    License:
        @LiveInLifeClient\license.txt
*/

params [
    ["_parameters", nil],
    ["_functionName", "", [""]],
    ["_target", ObjNull, [ObjNull, [], GrpNull, "", 0, sideUnknown]],
    ["_jip", false, [false, "", ObjNull, GrpNull]]
];

try {
    if (isNil "_functionName") throw false;
    private _result = _parameters remoteExec [_functionName, _target, _jip];

    if ((typeName _result) == "") throw true;
    throw false;
} catch {
    _exception;
};
