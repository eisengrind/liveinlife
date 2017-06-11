
private _unit = param [0, objNull, [objNull]];

try {
    if (isNull _unit) throw [];
    if !(isPlayer _unit) throw [];

    private _uniformContainer = (uniformContainer _unit);
    throw [(itemCargo _uniformContainer), (magazinesAmmo _uniformContainer), (weaponCargo _uniformContainer)];
} catch {
    _exception;
};
