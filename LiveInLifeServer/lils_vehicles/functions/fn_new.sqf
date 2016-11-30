
params [
    ["_unit", ObjNull, [ObjNull]],
    ["_classname", "", [""]],
    ["_position", [], [ObjNull, []]],
    ["_accurate", true, [false]]
};

try {
    if (isNull _unit) throw false;
    if (_classname == "") throw false;
    if (_position isEqualType ObjNull) then {
        if (isNull _position) throw false;
        _position = [(getPosASL _position), (getDir _position)];
    };
    if (_position isEqualType []) then {
        if ((count _position) != 2) throw false;
        if ((count (_position select 0)) < 2) throw false;
    };
    if !(isClass (configFile >> "CfgVehicles" >> _classname)) throw false;
    if !([_unit, _classname] call lilc_inventory_fnc_canAdd) throw false;

    private _vehicleInfo = [_unit, _classname] call lils_garage_fnc_insert; //vehicleID, accountID, steam64ID
    if ((count _vehicleInfo) != 3) throw false;
    
    private _vehicle = [_classname, _position, (_vehicleInfo select 0), (_vehicleInfo select 1), (_vehicleInfo select 2), _accurate] call lils_vehicles_fnc_create;
    _vehicle lock true;
    _vehicle setFuel 1;
    [_vehicle] call lilc_inventory_fnc_clearVehicleCargo;

    _unit addMagazine [(format["lilci_key_%1_F", _classname]), (_vehicleInfo select 0)];

    throw true;
} catch {
    _exception;
};
