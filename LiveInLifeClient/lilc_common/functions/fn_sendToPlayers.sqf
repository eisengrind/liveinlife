/*
    Date:
        17.10.2016
    Author:
        Vincent Heins
    Description:
        Alias for remoteExec to every client.
    Params:
        0 - Parameters to send to object - <ANY>
        1 - Function name to call - <STRING>
        3 - Send request to jip unit? - <BOOLEAN>
    Returns:
        true / false - Returns true if request was send; otherwise false - <BOOLEAN>
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

    private _playerList = [];
    {
        if (!isNull _x && isPlayer _x) then {
            _playerList pushBack _x;
        };
    } forEach playableUnits;
    if ((count _playerList) <= 0) throw false;

    throw ([_parameters, _functionName, _playerList, _jip] call lilc_common_fnc_send);
} catch {
	_exception;
};
