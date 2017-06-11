
params [
    ["_unit", ObjNull, [ObjNull]],
    ["_inventory", [], [[]]]
];
if ((count _inventory) <= 0) exitWith {};
if (isNull _unit) exitWith { false; };

[_unit] call lilc_inventory_fnc_clearInventory;

_headgear = ((_inventory select 0) select 0);
_goggles = ((_inventory select 0) select 1);
_hmd = ((_inventory select 0) select 2);
_binocular = ((_inventory select 0) select 3);

_unit addHeadgear _headgear;
_unit addGoggles _goggles;
_unit linkItem _hmd;
_unit linkItem _binocular;

{
    _unit linkItem _x;
} forEach (_inventory select 1);

if ((count (_inventory select 2)) > 0) then {
    _unit forceAddUniform ((_inventory select 2) select 0);
    _clothingName = ((_inventory select 2) select 1);
    if (_clothingName != "-1") then { [_clothingName, _unit, 0] call lilc_textures_fnc_setUniform; };
    
    {
        (uniformContainer _unit) addItemCargo [_x, ((((_inventory select 2) select 2) select 1) select _forEachIndex)];
    } forEach (((_inventory select 2) select 2) select 0);

    {
        (uniformContainer _unit) addMagazineAmmoCargo [(_x select 0), 1, (_x select 1)];
    } forEach ((_inventory select 2) select 3);

    {
        (uniformContainer _unit) addWeaponCargoGlobal [_x, ((((_inventory select 2) select 4) select 1) select _forEachIndex)];
    } forEach (((_inventory select 2) select 4) select 0);
};

if ((count (_inventory select 3)) > 0) then {
    _unit addVest ((_inventory select 3) select 0);
    
    {
        (vestContainer _unit) addItemCargo [_x, ((((_inventory select 3) select 1) select 1) select _forEachIndex)];
    } forEach (((_inventory select 3) select 1) select 0);

    {
        (vestContainer _unit) addMagazineAmmoCargo [(_x select 0), 1, (_x select 1)];
    } forEach ((_inventory select 3) select 2);

    {
        (vestContainer _unit) addWeaponCargoGlobal [_x, ((((_inventory select 3) select 3) select 1) select _forEachIndex)];
    } forEach (((_inventory select 3) select 3) select 0);
};

if ((count (_inventory select 4)) > 0) then {
    _unit addBackpack ((_inventory select 4) select 0);
    _backpackColor = ((_inventory select 4) select 1);
    if (_backpackColor != "-1") then { [_backpackColor, (backpackContainer _unit), 0] call lilc_textures_fnc_setBackpack; };

    {
        (backpackContainer _unit) addItemCargo [_x, ((((_inventory select 4) select 2) select 1) select _forEachIndex)];
    } forEach (((_inventory select 4) select 2) select 0);

    {
        (backpackContainer _unit) addMagazineAmmoCargo [(_x select 0), 1, (_x select 1)];
    } forEach ((_inventory select 4) select 3);

    {
        (backpackContainer _unit) addWeaponCargoGlobal [_x, ((((_inventory select 4) select 3) select 1) select _forEachIndex)];
    } forEach (((_inventory select 4) select 4) select 0);
};

_equippedWeapons = (_inventory select 5);
_primaryWeapon = _equippedWeapons select 0;
_secondaryWeapon = _equippedWeapons select 1;
_handgunWeapon = _equippedWeapons select 2;

if ((count _primaryWeapon) > 0) then {
    _unit addWeapon (_primaryWeapon select 0);
    _unit addMagazine (_primaryWeapon select 1);

    {
        _unit addPrimaryWeaponItem _x;
    } forEach (_primaryWeapon select 2);
};

if ((count _secondaryWeapon) > 0) then {
    _unit addWeapon (_secondaryWeapon select 0);
    _unit addMagazine (_secondaryWeapon select 1);
    
    {
        _unit addPrimaryWeaponItem _x;
    } forEach (_secondaryWeapon select 2);
};

if ((count _handgunWeapon) > 0) then {
    _unit addWeapon (_handgunWeapon select 0);
    _unit addMagazine (_handgunWeapon select 1);
    
    {
        _unit addPrimaryWeaponItem _x;
    } forEach (_handgunWeapon select 2);
};

[(_inventory select 6), _unit] call lilc_textures_fnc_setRankInsignia;
