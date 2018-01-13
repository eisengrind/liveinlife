
params [
    ["_object", objNull, [objNull]],
    ["_positionName", "", [""]]
];

try {
    if (isNull player) throw false;
    if !(isPlayer player) throw false;
    if (isNull _object) throw false;
    if !([(typeOf _object), _positionName] call lilc_sitting_fnc_isPositionName) throw false;
    if !(isNull (_object getVariable [(format["lilc_sitting_position_%1", _positionName]), objNull])) throw false;

    throw true;
} catch {
    _exception;
};
