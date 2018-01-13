
private _unit = param [0, objNull, [objNull]];

try {
    if (isNull _unit) throw [];
    if !(isPlayer _unit) throw [];

    private _vestContainer = (vestContainer _unit);
    throw [(itemCargo _vestContainer), (magazinesAmmo _vestContainer), (weaponCargo _vestContainer)];
} catch {
    _exception;
};
