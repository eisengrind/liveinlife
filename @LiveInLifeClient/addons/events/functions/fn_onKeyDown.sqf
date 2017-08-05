
private ["_uiControl", "_keyCode", "_isShift", "_isCtrl", "_isAlt"];
params [
    ["_uiControl", displayNull, [displayNull]],
    ["_keyCode", -1, [0]],
    ["_isShift", false, [false]],
    ["_isCtrl", false, [false]],
    ["_isAlt", false, [false]]
];
if (isNull _uiControl) exitWith { false; };
if (_keyCode == -1) exitWith { false; };

private _interuptionKeys = [] + (actionKeys "MoveForward") + (actionKeys "MoveBack") + (actionKeys "turnRight") + (actionKeys "turnLeft");
if (_keyCode in _interuptionKeys) then {
    lilc_action_interrupted = true;
} else {
    lilc_action_interrupted = false;
};

false;
