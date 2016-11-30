
params [
    ["_classname", "", ["", []]],
    ["_object", player, [ObjNull, []]]
];

try {
    if (_classname isEqualType "") then {
        if (_classname == "") throw 0;
        _classname = [_classname];
    };

    if !(_object isEqualType []) then {
        _object = [_object];
    };

    private _objects = [];
    {
        if !(_x in _objects && isNull _x) then {
            _objects pushBack _x;
        };
    } forEach _object;

    private _items = [];
    {
        if (_x isKindOf "Man") then {
            _items = (_items + (items _x) + (if ((headgear _x) != "") then { [(headgear _x)]; } else { []; }) + (if ((binocular _x) != "") then { [(binocular _x)]; } else { []; }) + (if ((hmd _x) != "") then { [(hmd _x)]; } else { []; }) + (if ((goggles _x) != "") then { [(goggles _x)]; } else { []; }) + (assignedItems _x) + (weapons _x) + (magazineCargo _x) + (if ((backpack _x) != "") then { [(backpack _x)]; } else { []; }) + (if ((vest _x) != "") then { [(vest _x)] } else { []; }) + (if ((uniform _x) != "") then { [(uniform _x)]; } else { []; }));
        } else {
            _items = (_items + (itemCargo _x) + (weaponCargo _x) + (magazineCargo _x) + (backpackCargo _x));
        };
    } forEach _objects;
    if ((count _items) <= 0) throw 0;

    private _count = 0;
    private _itemsCopy = _items;

    {
        private _index = _forEachIndex;
        private _itemName = _x;

        {
            if (_x in _items) then {
                _items set [_index, ""];
                _count = _count + 1;
            };
        } forEach _classname;
    } forEach _items;

    throw _count;
} catch {
    _exception;
};
