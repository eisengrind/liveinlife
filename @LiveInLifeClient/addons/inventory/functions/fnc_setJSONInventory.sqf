#include "..\script_component.hpp"

//TODO: add magazines ammo of equipped weapons

params [
    ["_unit", objNull, [objNull]],
    ["_json", [], [[]]]
];

[_unit] call FUNC(clearInventory);

private _headObject = [_json, "head"] call a3uf_json_fnc_get;
private _headgear = [_headObject, "headgear"] call a3uf_json_fnc_get;
if (_headgear != "") then {
    _unit addHeadgear _headgear;
};

private _goggles = [_headObject, "goggles"] call a3uf_json_fnc_get;
if (_goggles != "") then {
    _unit addGoggles _goggles;
};

private _hmd = [_headObject, "hmd"] call a3uf_json_fnc_get;
if (_hmd != "") then {
    _unit linkItem _hmd;
};

private _binocular = [_headObject, "binocular"] call a3uf_json_fnc_get;
if (_binocular != "") then {
    _unit linkItem _binocular;
};

{
    _unit linkItem _x;
} forEach ([_json, "assignedItems"] call a3uf_json_fnc_get);

private _primaryWeaponObject = [_json, "weapons.primary"] call a3uf_json_fnc_get;
if !(_primaryWeaponObject isEqualType objNull) then {
    _unit addWeaponGlobal ([_primaryWeaponObject, "classname"] call a3uf_json_fnc_get);

    {
        _unit addPrimaryWeaponItem _x;
    } forEach ([_primaryWeaponObject, "magazines"] call a3uf_json_fnc_get);

    {
        _unit addPrimaryWeaponItem _x;
    } forEach ([_primaryWeaponObject, "items"] call a3uf_json_fnc_get);
};

private _secondaryWeaponObject = [_json, "weapons.secondary"] call a3uf_json_fnc_get;
if !(_secondaryWeaponObject isEqualType objNull) then {
    _unit addWeaponGlobal ([_secondaryWeaponObject, "classname"] call a3uf_json_fnc_get);

    {
        _unit addSecondaryWeaponItem _x;
    } forEach ([_secondaryWeaponObject, "magazines"] call a3uf_json_fnc_get);

    {
        _unit addSecondaryWeaponItem _x;
    } forEach ([_secondaryWeaponObject, "items"] call a3uf_json_fnc_get);
};

private _handgunWeaponObject = [_json, "weapons.handgun"] call a3uf_json_fnc_get;
if !(_handgunWeaponObject isEqualType objNull) then {
    _unit addWeaponGlobal ([_handgunWeaponObject, "classname"] call a3uf_json_fnc_get);

    {
        _unit addHandgunItem _x;
    } forEach ([_handgunWeaponObject, "magazines"] call a3uf_json_fnc_get);

    {
        _unit addHandgunItem _x;
    } forEach ([_handgunWeaponObject, "items"] call a3uf_json_fnc_get);
};

private _uniformObject = [_json, "uniform"] call a3uf_json_fnc_get;
if !(_uniformObject isEqualType objNull) then {
    _unit forceAddUniform ([_uniformObject, "classname"] call a3uf_json_fnc_get);
    {
        (uniformContainer _unit) addItemCargoGlobal [
            [_x, "classname"] call a3uf_json_fnc_get,
            [_x, "amount"] call a3uf_json_fnc_get
        ];
    } forEach ([_uniformObject, "items"] call a3uf_json_fnc_get);

    {
        (uniformContainer _unit) addWeaponCargoGlobal [
            [_x, "classname"] call a3uf_json_fnc_get,
            [_x, "amount"] call a3uf_json_fnc_get
        ];
    } forEach ([_uniformObject, "weapons"] call a3uf_json_fnc_get);

    {
        (uniformContainer _unit) addMagazineAmmoCargo [
            [_x, "classname"] call a3uf_json_fnc_get,
            [_x, "amount"] call a3uf_json_fnc_get,
            [_x, "ammo"] call a3uf_json_fnc_get
        ];
    } forEach ([_uniformObject, "magazines"] call a3uf_json_fnc_get);
};

private _vestObject = [_json, "vest"] call a3uf_json_fnc_get;
if !(_vestObject isEqualType objNull) then {
    _unit addVest ([_vestObject, "classname"] call a3uf_json_fnc_get);
    {
        (vestContainer _unit) addItemCargoGlobal [
            [_x, "classname"] call a3uf_json_fnc_get,
            [_x, "amount"] call a3uf_json_fnc_get
        ];
    } forEach ([_vestObject, "items"] call a3uf_json_fnc_get);

    {
        (vestContainer _unit) addWeaponCargoGlobal [
            [_x, "classname"] call a3uf_json_fnc_get,
            [_x, "amount"] call a3uf_json_fnc_get
        ];
    } forEach ([_vestObject, "weapons"] call a3uf_json_fnc_get);

    {
        (vestContainer _unit) addMagazineAmmoCargo [
            [_x, "classname"] call a3uf_json_fnc_get,
            [_x, "amount"] call a3uf_json_fnc_get,
            [_x, "ammo"] call a3uf_json_fnc_get
        ];
    } forEach ([_vestObject, "magazines"] call a3uf_json_fnc_get);
};

private _backpackObject = [_json, "backpack"] call a3uf_json_fnc_get;
if !(_backpackObject isEqualType objNull) then {
    _unit addBackpackGlobal ([_backpackObject, "classname"] call a3uf_json_fnc_get);
    {
        (backpackContainer _unit) addItemCargoGlobal [
            [_x, "classname"] call a3uf_json_fnc_get,
            [_x, "amount"] call a3uf_json_fnc_get
        ];
    } forEach ([_backpackObject, "items"] call a3uf_json_fnc_get);

    {
        (backpackContainer _unit) addWeaponCargoGlobal [
            [_x, "classname"] call a3uf_json_fnc_get,
            [_x, "amount"] call a3uf_json_fnc_get
        ];
    } forEach ([_backpackObject, "weapons"] call a3uf_json_fnc_get);

    {
        (backpackContainer _unit) addMagazineAmmoCargo [
            [_x, "classname"] call a3uf_json_fnc_get,
            [_x, "amount"] call a3uf_json_fnc_get,
            [_x, "ammo"] call a3uf_json_fnc_get
        ];
    } forEach ([_backpackObject, "magazines"] call a3uf_json_fnc_get);
};

[
    [_json, "insignia"] call a3uf_json_fnc_get,
    _unit
] call EFUNC(textures,setRankInsignia);
