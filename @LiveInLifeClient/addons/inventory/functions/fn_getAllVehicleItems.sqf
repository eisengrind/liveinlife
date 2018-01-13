
private _vehicle = param [0, objNull, [objNull]];

try {
    if (isNull _vehicle) throw [];
    private _inventory = [];

    _inventory = _inventory + (itemCargo _vehicle);
    _inventory = _inventory + (weaponCargo _vehicle);
    _inventory = _inventory + (magazineCargo _vehicle);
    _inventory = _inventory + (backpackCargo _vehicle);
    
    private _result = [];
    { if (_x != "") then { _result pushBack _x; }; } forEach _inventory;

    throw _result;
} catch {
    _exception;
};
