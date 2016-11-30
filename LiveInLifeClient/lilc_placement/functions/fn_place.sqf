
params [
    ["_classname", "", [""]],
    ["_positionASL", [], [[]]]
];

try {
    if !([_positionASL] call lilc_housing_fnc_inHouse) throw false;
    _globalObject = _classname createVehicle [0, 0, 0];
    if (isNull _globalObject) throw false;

    _globalObject enableSimulation false;
    _globalObject setPosASL _positionASL;
    //Call saving of object...

    //nothing here yet...
    throw true;
} catch {
    _exception;
};
