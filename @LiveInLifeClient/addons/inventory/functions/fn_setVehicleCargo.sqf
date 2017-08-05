
params [
    ["_vehicle", ObjNull, [ObjNull]],
    ["_gear", [], []]
];
if (isNull _vehicle || !alive _vehicle) exitWith {};
if ((count _gear) <= 0) exitWith {};

[_vehicle] call lilc_inventory_fnc_clearVehicleCargo;

{
    _vehicle addItemCargoGlobal [_x, (((_gear select 0) select 1) select _forEachIndex)];
} forEach ((_gear select 0) select 0);

[_vehicle, (_gear select 1)] call lilc_inventory_fnc_addMagazinesAmmoCargoStacked;

{
    _vehicle addWeaponCargoGlobal [_x, (((_gear select 2) select 1) select _forEachIndex)];
} forEach ((_gear select 2) select 0);

private _usedBackpacks = [];
private _containers = (_gear select 3);

{
    private _inv = (_x select 1);
    if !(isNull (configFile >> "CfgVehicles" >> (_x select 0))) then
    {//backpacks
        _vehicle addBackpackCargoGlobal [(_x select 0), 1];
    }
    else
    {//vests/uniforms
    	_vehicle addItemCargoGlobal [(_x select 0), 1];
    };

    private _eC = (everyContainer _vehicle);
    private _ct = ((_eC select ((count _eC) - 1)) select 1);
    
    if !(isNull _ct) then
    {
        {
            _ct addItemCargoGlobal [_x, (((_inv select 0) select 1) select _forEachIndex)];
        } forEach ((_inv select 0) select 0);

        [_cT, (_inv select 1)] call lilc_inventory_fnc_addMagazinesAmmoCargoStacked;

        {
            _ct addWeaponCargoGlobal [_x, (((_inv select 2) select 1) select _forEachIndex)];
        } forEach ((_inv select 2) select 0);
    };
} forEach _containers;
