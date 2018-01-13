
private _unit = param [0, objNull, [objNull]];
params [
    ["_unit", objNull, [objNull]],
    ["_onlyContent", true, [false]]
];

try
{
    if (isNull _unit) throw [];

    private _inventory = [];

    _inventory = _inventory + (items _unit);
    _inventory = _inventory + (magazines _unit);
    _inventory = _inventory + (weapons _unit);

    if (_onlyContent) then
    {
        _inventory = _inventory + (primaryWeaponItems _unit);
        _inventory = _inventory + (secondaryWeaponItems _unit);
        _inventory = _inventory + (handgunItems _unit);
        _inventory = _inventory + [(headgear _unit), (goggles _unit), (hmd _unit), (binocular _unit)];
        _inventory = _inventory + (assignedItems _unit);
        _inventory = _inventory + [(vest _unit)];
        _inventory = _inventory + [(uniform _unit)];
        _inventory = _inventory + [(backpack _unit)];
    };

    private _result = [];
    {
        if (_x != "") then
        {
            _result pushBack _x;
        };
    } forEach _inventory;

    throw _result;
}
catch
{
    _exception;
};

/*_inventory = [];

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

_inventory;*/
