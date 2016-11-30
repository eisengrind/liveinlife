
private ["_unit", "_inventory", "_headgear", "_assignedItems", "_items", "_magazines", "_weapons", "_weaponAccessories"];
_unit = param [0, ObjNull, [ObjNull]];
if (isNull _unit) exitWith { []; };

_inventory = [];

_headgear = [(headgear _unit), (goggles _unit), (hmd _unit), (binocular _unit)];
_inventory pushBack _headgear;

_assignedItems = (assignedItems _unit);
_inventory pushBack _assignedItems;

_items = (items _unit);
_inventory pushBack _items;

_magazines = [];
if (!isNil {(magazinesAmmo uniformContainer _unit)}) then {
    {
        _magazines pushBack _x;
    } forEach (magazinesAmmo uniformContainer _unit);
};

if (!isNil {(magazinesAmmo vestContainer _unit)}) then {
    {
        _magazines pushBack _x;
    } forEach (magazinesAmmo vestContainer _unit);
};

if (!isNil {(magazinesAmmo backpackContainer _unit)}) then {
    {
        _magazines pushBack _x;
    } forEach (magazinesAmmo backpackContainer _unit);
};
_inventory pushBack _magazines;

_weapons = weapons _unit;
_inventory pushBack _weapons;

_weaponAccessories = [];
{
    _weaponAccessories pushBack (_unit weaponAccessories _x);
} forEach _weapons;
_inventory pushBack _weaponAccessories;

_inventory;
