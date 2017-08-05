
params [
    ["_classname", "", [""]],
    ["_object", player, [objNull, []]]
];

try {
    if (_object isEqualType objNull) then {
        if (isNull _object) throw false;
        _object = [_object];
    };

    if (([_classname, _object] call lilc_inventory_fnc_itemCount) > 0) throw true;

    throw false;
} catch {
    _exception;
};
