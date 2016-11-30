
private _classname = param [0, "", [""]];

try {
    if (_classname == "") throw false;
    if (lilc_placement_active) throw false;
    
    lilc_placement_object = _classname createVehicleLocal [0, 0, 0];
    if (isNull lilc_placement_object) throw false;    
    lilc_placement_active = true;

    if (call lilc_housing_fnc_inHouse) then {
        lilc_placement_inHouse = true;
    } else {
        lilc_placement_inHouse = false;
        lilc_placement_origin = (getPosASL player);
    };

    private _result = call lilc_placement_fnc_placing;
    systemChat str _result;
    detach lilc_placement_object;
    private _positionASL = getPosASL lilc_placement_object;
    deleteVehicle lilc_placement_object;

    if (_result) then {
        if ([_classname, _positionASL] call lilc_placement_fnc_place) throw true;
    };

    throw false;
    //if !(call lilc_housing_fnc_inHouse)
} catch {
    lilc_placement_active = false;
    lilc_placement_inHouse = false;
    lilc_placement_finished = false;
    lilc_placement_objectMoving = false;
    lilc_placement_displacement = 0;
    lilc_placement_origin = [0,0,0];
    _exception;
};
