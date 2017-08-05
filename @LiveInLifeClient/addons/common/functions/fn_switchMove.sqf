
/*
    Filename:
        fn_switchMove.sqf
    Author:
        Vincent Heins
    Description:
        SwitchMove alias for network purposes.
		If this function is executed by the local player on a server, the animation will be broadcasted over the network.
    Param(s):
        (_this select 0) : the unit on which to execute the animation : <OBJECTNULL>
		(_this select 1) : the animation to be played; can be any animation, gesture or playMove : <STRING>
		(not needed/optional)(_this select 2) : this parameter is needed to check, if this function is "incoming" or "outgoing". Otherwise, if the function is broadcasted over network, it will be iterated unlimited times.
    Result(s):
        true = success; false != true : <BOOL>
*/

params [
    ["_unit", ObjNull, [ObjNull]],
    ["_animation", "", [""]]
];

try {
    if (isNil "_animation") throw false;
    if (isNull _unit) throw false;
    if !(alive _unit) throw false;

    _unit switchMove _animation;
    if !(isRemoteExecuted) then
    {
        if (_animation != (animationState _unit)) throw false;
        [[_unit, _animation, true], "lilc_common_fnc_switchMove"] call lilc_common_fnc_sendToOtherPlayers;
    };

    throw true;
} catch {
    _exception;
};
