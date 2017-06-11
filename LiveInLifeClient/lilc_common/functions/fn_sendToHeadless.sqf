/*
    Date:
        17.10.2016
    Author:
        Vincent Heins
    Description:
        Alias for remoteExec to the server
    Params:
        (_this select 0) : Parameters to send to object : <ANY>
        (_this select 1) : Function name to call : <STRING>
    Returns:
        true / false - Returns true if request was send; otherwise false : <BOOL>
    License:
        @LiveInLifeClient\license.txt
*/

params [
    ["_parameters", nil],
    ["_functionName", "", [""]],
    ["_jip", false, [false, "", ObjNull, GrpNull]]
];

try {
	if (isNil "_functionName") throw false;

    private _headlessList = [];
	{
		if (!isNull _x) then {
			_headlessList pushBack _x;
		};
	} forEach (entities "HeadlessClient_F");
    if ((count _headlessList) <= 0) throw false;
	
    throw ([_parameters, _functionName, (selectRandom _headlessList), _jip] call lilc_common_fnc_send);
} catch {
	_exception;
};
