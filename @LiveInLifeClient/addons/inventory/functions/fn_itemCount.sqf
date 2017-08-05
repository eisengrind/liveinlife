
params [
    ["_classname", "", ["", []]],
    ["_object", player, [ObjNull, []]]
];

try {
    if (_classname isEqualType "") then {
        if (_classname == "") throw 0;
        _classname = [_classname];
    };

    if (_object isEqualType objNull) then {
        if (isNull _object) throw 0;
        _object = [_object];
    };

    private _objects = [];
    {
        if !(_x in _objects) then
        {
            _objects pushBack _x;
        };
    } forEach _object;

    private _itemCount = 0;
    {
        private _classname = _x;
        {
            if (_x isKindOf "Man") then {
                _itemCount = _itemCount + ({ ([_classname, _x] call lilc_common_fnc_isEqualStringToLower) } count ([_x] call lilc_inventory_fnc_getAllUnitItems));
            } else {
                _itemCount = _itemCount + ({ ([_classname, _x] call lilc_common_fnc_isEqualStringToLower) } count ([_x] call lilc_inventory_fnc_getAllVehicleItems));
            };
        } forEach _objects;
    } forEach _classname;

    throw _itemCount;
} catch {
    _exception;
};
