
try {
    private _yHeight = 1;
    lilc_placement_object attachTo [player, [0, 1.5, _yHeight]];

    while {true} do {
        waitUntil { lilc_placement_objectMoving; };
        if (isNull lilc_placement_object) throw false;

        if (lilc_placement_inHouse) then {
            if !([player] call lilc_housing_fnc_inHouse) throw false;
            if !([lilc_placement_object] call lilc_housing_fnc_inHouse) throw false;
        } else {
            if ((lilc_placement_origin distance (getPosASL player)) > 6) throw false;
        };

        _yHeight = _yHeight + lilc_placement_displacement;
        if (_yHeight > 10 || _yHeight < -10) throw false;
        lilc_placement_object attachTo [player, [0, 1.5, _yHeight]];
        lilc_placement_displacement = 0;
        
        if !(alive player) throw false;
        if (lilc_placement_finished) exitWith {};
        sleep 0.05;
        lilc_placement_objectMoving = false;
    };

    if !(lilc_placement_finished) throw false;
    throw true;
} catch {
    _exception;
};
