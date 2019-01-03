/*
    Date:
        17.10.2016
    Author:
        Vincent Heins
    Description:
        Alias for remoteExec to every client.
    Params:
        (_this select 0) : Parameters to send to object : <ANY>
        (_this select 1) : Function name to call : <STRING>
        (_this select 2) : Send request to jip unit? : <BOOL>
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

if (isNil "_functionName") exitWith { false; };
[_parameters, _functionName, (playableUnits select { !isNull _x && isPlayer _x; }) apply { owner _x; }, _jip] call lilc_common_fnc_send;
