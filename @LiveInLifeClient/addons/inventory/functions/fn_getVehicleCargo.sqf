
_vehicle = param [0, ObjNull, [ObjNull]];
if (isNull _vehicle || !alive _vehicle) exitWith { []; };

private _containers = [];
{
    _containers pushBack [
        (_x select 0),
        [
            getItemCargo (_x select 1),
            ([(_x select 1)] call lilc_inventory_fnc_magazinesAmmoCargoStacked),
            getWeaponCargo (_x select 1)
        ]
    ];
} forEach everyContainer _vehicle;

private _eC = ((everyContainer _vehicle) apply { (_x select 0); });
private _c = (getItemCargo _vehicle);
private _items = [[], []];
{
    if !(_x in _eC) then
    {
        (_items select 0) pushBack _x;
        (_items select 1) pushBack ((_c select 1) select _forEachIndex);
    };
} forEach (_c select 0);

_gear = [
    _items,
    ([_vehicle] call lilc_inventory_fnc_magazinesAmmoCargoStacked),
    (getWeaponCargo _vehicle),
    _containers
];

_gear;
