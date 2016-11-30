
params [
    ["_unit", ObjNull, [ObjNull]],
    ["_animation", "", [""]],
    ["_incoming", false, [false]]
];

try {
    if (isNil "_animation") throw false;
    if (isNull _unit) throw false;
    if !(alive _unit) throw false;

    if (_incoming) then {
        _unit switchMove _animation;
    } else {
        [[_unit, _animation, true], "lilc_common_fnc_switchMove"] call lilc_common_fnc_sendToPlayers;
    };
} catch {
    _exception;
};
