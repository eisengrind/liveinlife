
params [
    ["_vehicle", objNull, [objNull]],
    ["_id", "", [""]],
    ["_sound", "", [""]],
    ["_timeout", 0, [0]],
    ["_loop", true, [false]]
];

if (isNull _vehicle || !alive _vehicle) exitWith {};
if (isNil "_id" || { _id == ""; }) exitWith {};
if (isNil "_sound" || { _sound == ""; }) exitWith {};
if (_timeout <= 0) exitWith {};
if (!(_vehicle getVariable ["lilc_sirens_active", false])) exitWith {};

private _s = format["lilc_sirens_sirene_%1", _id];
private _sObjN = format["%1_object", _s];
private _sObj = _vehicle getVariable [_sObjN, objNull];

if (isNull _sObj) then {
    _sObj = "logic" createVehicleLocal [0, 0, 0];
    _sObj attachTo [_vehicle, [0, 0, 2]];
    _vehicle setVariable [_sObjN, _sObj];

    _evhDeathId = ["lils_vehicles_vehicleDeath", {
        params [
            ["_vehicle", objNull, [objNull]]
        ];

        private _sObj = _vehicle getVariable [format["lilc_sirens_sirene_%1_object", _thisArgs], objNull];

        deleteVehicle _sObj;
        _vehicle setVariable [format["lilc_sirens_sirene_%1_deathEVH", _thisArgs], nil];
        [_thisType, _thisId] call CBA_fnc_removeEventHandler;
    }, _id] call CBA_fnc_addEventHandlerArgs;

    _vehicle setVariable [format["%1_deathEVH", _s], _evhDeathId];
};

_sObj say3D _sound;

if (_loop) then {
    [lilc_sirens_fnc_startSireneLocal, [_vehicle, _id, _sound, _timeout, _loop], _timeout] call CBA_fnc_waitAndExecute;
} else {
    deleteVehicle _sObj;
};
