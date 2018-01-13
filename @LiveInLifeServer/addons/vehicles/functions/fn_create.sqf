
params [
    ["_classname", "", [""]],
    ["_position", [], [ObjNull, []]],
    ["_vehicleID", 0, [0]],
    ["_accountID", 0, [0]],
    ["_steam64ID", "", [""]],
    ["_accurate", true, [false]],
    ["_factionID", -1, [-1]]
];

try {
    //if (isNull _unit) throw ObjNull;
    if (_classname == "") throw ObjNull;
    if (_position isEqualType ObjNull) then {
        if (isNull _position) throw ObjNull;
        _position = [(getPosASL _position), (getDir _position)];
    };
    if (_position isEqualType []) then {
        if ((count _position) != 2) throw ObjNull;
        if ((count (_position select 0)) != 3) throw ObjNull;
        _position set [0, ((_position select 0) vectorAdd [0, 0, 0.2])];
    };
    
    if (_accountID <= 0) throw objNull;
    if (_steam64ID == "") throw objNull;
    if !(isClass (configFile >> "CfgVehicles" >> _classname)) throw ObjNull;

    private _vehicle = ObjNull;
    if (_accurate) then {
        _vehicle = _classname createVehicle [0, 0, 0];
        [_vehicle, _position] call lilc_common_fnc_setPosition;
    } else {
        private _watermode = (if ([_classname, ["Ship"]] call lilc_common_fnc_isKindOf) then { 2; } else { 0; });
        
        _vehicle = _classname createVehicle [0, 0, 0];
 
        private _pos = ((_position select 0) findEmptyPosition [5, 80, _classname]);

        _vehicle setPos _pos;
    };

    if (isNull _vehicle) throw ObjNull;
    [_vehicle] call lilc_inventory_fnc_clearVehicleCargo;
    ["lils_vehicles_created", [_vehicle, _vehicleID, _accountID, _steam64ID, _factionID]] call CBA_fnc_localEvent;

    _vehicle allowDamage false;
    _vehicle setVariable ["lilc_vehicleID", _vehicleID, true];
    _vehicle setVariable ["lilc_accountID", _accountID, true];
    _vehicle setVariable ["lilc_steam64ID", _steam64ID, true];
    _vehicle setVariable ["lilc_factionID", _factionID, true];
    _vehicle setVariable ["lilc_uniqueObjectID", (parseNumber (((_vehicle call BIS_fnc_netId) splitString ":") select 1)), true];
    _vehicle addEventHandler [
        "Killed",
        {
            [
                "lils_vehicles_vehicleDeath",
                _this
            ] call CBA_fnc_localEvent;
        }
    ];
    _vehicle allowDamage true;

    //[_vehicle] call lils_vehicles_fnc_save;
    throw _vehicle;
} catch {
    _exception;
};
