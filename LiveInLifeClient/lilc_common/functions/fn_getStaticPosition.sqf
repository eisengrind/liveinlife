
private ["_name"];

_name = param [0, "", [""]];
if (_name == "") exitWith { []; };
if (isNull (missionConfigFile >> "CfgStaticPositions" >> _name)) exitWith {};

_position = getArray(missionConfigFile >> "CfgStaticPositions" >> _name >> "position");
_direction = getNumber(missionConfigFile >> "CfgStaticPositions" >> _name >> "direction");

switch (_direction) do {
    case -1: { _direction = direction player; };
    case -2: { _direction = direction (vehicle player); };
    case -3: {
        if (!isNull cursorTarget) then {
            _direction = direction cursorTarget;
        };
    };
};

[_position, _direction];
