
private _unit = param [0, objNull, [objNull]];

try {
    if (isNull _unit) throw [];
    if !(isPlayer _unit) throw [];

    private _backpackContainer = (backpackContainer _unit);
    throw [(itemCargo _backpackContainer), (magazinesAmmo _backpackContainer), (weaponCargo _backpackContainer)];
} catch {
    _exception;
};
