
params [
    ["_unit", objNull, [objNull]],
    ["_position", "", [""]],
    ["_vehicle", objNull, [objNull]],
    ["_turret", [], [[]]]
];

try {
    if (isNull _vehicle) throw false;
    if (isNull _unit) throw false;
    //if !(_unit isEqualTo player) throw false;
    if !(isPlayer _unit) throw false;

    [player, "lilcas_AinjPpneMstpSnonWrflDnon"] call lilc_common_fnc_switchMove;
    throw false;
} catch {
    _exception;
};
