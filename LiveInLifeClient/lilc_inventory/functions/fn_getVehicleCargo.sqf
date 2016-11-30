
_vehicle = param [0, ObjNull, [ObjNull]];
if (isNull _vehicle || !alive _vehicle) exitWith { []; };

private _backpacks = [];
{
    _backpacks pushBack [
        (typeOf _x),
        [
            getItemCargo _x,
            magazinesAmmoCargo _x,
            getWeaponCargo _x
        ]
    ];
} forEach everyBackpack _vehicle;

_gear = [
    (getItemCargo _vehicle),
    (magazinesAmmoCargo _vehicle),
    (getWeaponCargo _vehicle),
    _backpacks
];

_gear;
