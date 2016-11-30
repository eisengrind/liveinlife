
params [
    ["_classname", "", [""]],
    ["_position", [], [ObjNull, []]],
    ["_vehicleID", 0, [0]],
    ["_accountID", 0, [0]],
    ["_steam64ID", "", [""]],
    ["_accurate", true, [false]]
];

try {
    if (isNull _unit) throw ObjNull;
    if (_classname == "") throw ObjNull;
    if (_position isEqualType ObjNull) then {
        if (isNull _position) throw ObjNull;
        _position = [(getPosASL _position), (getDir _position)];
    };
    if (_position isEqualType []) then {
        if ((count _position) != 2) throw ObjNull;
        if ((count (_position select 0)) != 3) throw ObjNull;
    };
    if (_vehicleID <= 0) throw objNull;
    if (_accountID <= 0) throw objNull;
    if (_steam64ID == "") throw objNull;
    if !(isClass (configFile >> "CfgVehicles" >> _classname)) throw ObjNull;

    private _vehicle = ObjNull;
    if (_accurate) then {
        _vehicle = _classname createVehicle [0, 0, 0];
        [_vehicle, _position] call lilc_common_fnc_setPosition;
    } else {
        _vehicle = _classname createVehicle ASLToAGL (_position select 0);
    };

    if (isNull _vehicle) throw ObjNull;

    _vehicle allowDamage false;
    _vehicle setVariable ["lilc_vehicleID", _vehicleID, true];
    _vehicle setVariable ["lils_accountID", _accountID];
    _vehicle setVariable ["lils_steam64ID", _steam64ID];
    _vehicle addEventHandler ["Killed", { [(_this select 0)] call lils_vehicles_fnc_death; }];
    _vehicle allowDamage true;

    [_vehicle] call lils_vehicles_fnc_save;
    throw _vehicle;
} catch {
    _exception;
};
