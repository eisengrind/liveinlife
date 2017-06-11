
params [
    ["_position", [], [[]]],
    ["_items", [], [[]]]
];

try {
    if ((count _position) <= 1) throw false;
    if ((count _items) <= 0) throw false;

    private _groundWeaponHolder = ObjNull;
    {
        if ((typeOf _x) == "GroundWeaponHolder") exitWith { _groundWeaponHolder = _x; };
    } forEach nearestObjects [(ASLToAGL _position), [], 5];

    if (isNull _groundWeaponHolder) then {
        _groundWeaponHolder = "GroundWeaponHolder" createVehicle [0, 0, 0];
        _groundWeaponHolder setPosASL _position;
    };
    
    {
        [_groundWeaponHolder, _x] call lilc_inventory_fnc_addVehicle;
    } forEach _items;
} catch {
    _exception;
};
