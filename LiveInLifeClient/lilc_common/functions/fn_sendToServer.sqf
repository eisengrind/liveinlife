/*
    Date:
        17.10.2016
    Author:
        Vincent Heins
    Description:
        Alias for remoteExec to the server
    Params:
        0 - Parameters to send to object - <ANY>
        1 - Function name to call - <STRING>
    Returns:
        true / false - Returns true if request was send; otherwise false - <BOOLEAN>
    License:
        @LiveInLifeClient\license.txt
*/


params [
    ["_parameters", nil],
    ["_functionName", "", [""]]
];

try {
	if (isNil "_functionName") throw false;
    throw ([_parameters, _functionName, 2, false] call lilc_common_fnc_send);
} catch {
	_exception;
};
