
params [
    ["_unit", objNull, [objNull]],
    ["_position", "", [""]],
    ["_vehicle", objNull, [objNull]],
    ["_turret", [], [[]]]
];

try {
    if (isNull _vehicle) throw false;
    if (isNull _unit) throw false;
    if !(_unit isEqualTo player) throw false;
    if !(isPlayer _unit) throw false;

    private _animation = "";

    switch (true) do {
        case (_vehicle isKindOf "Quadbike_01_base_F"): {
            _animation = "KIA_passenger_quadbike";
        };

        default {
            _animation = (selectRandom [/*"lilcaa_driver_lsv01_kia", "lilcaa_KIA_passenger_mantisrear",*/ "KIA_passenger_VAN_codriver01"/*, "lilcaa_KIA_pilot_Heli_Transport_03"*/]);
        };
    };
    if (_animation == "") throw false;
    
    [player, _animation] call lilc_common_fnc_switchMove;
    throw false;
} catch {
    _exception;
};
