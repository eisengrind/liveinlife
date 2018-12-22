#include "..\script_component.hpp"

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

private _uniformObject = [_json, "uniform"] call a3uf_json_fnc_get;
if !(isNil "_uniformObject") then {
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
if !(isNil "_backpackObject") then {
    _unit forceAddUniform ([_vestObject, "classname"] call a3uf_json_fnc_get);
    {
        (uniformContainer _unit) addItemCargoGlobal [
            [_x, "classname"] call a3uf_json_fnc_get,
            [_x, "amount"] call a3uf_json_fnc_get
        ];
    } forEach ([_vestObject, "items"] call a3uf_json_fnc_get);

    {
        (uniformContainer _unit) addWeaponCargoGlobal [
            [_x, "classname"] call a3uf_json_fnc_get,
            [_x, "amount"] call a3uf_json_fnc_get
        ];
    } forEach ([_vestObject, "weapons"] call a3uf_json_fnc_get);

    {
        (uniformContainer _unit) addMagazineAmmoCargo [
            [_x, "classname"] call a3uf_json_fnc_get,
            [_x, "amount"] call a3uf_json_fnc_get,
            [_x, "ammo"] call a3uf_json_fnc_get
        ];
    } forEach ([_vestObject, "magazines"] call a3uf_json_fnc_get);
};

private _backpackObject = [_json, "backpack"] call a3uf_json_fnc_get;
if !(isNil "_backpackObject") then {
    _unit forceAddUniform ([_backpackObject, "classname"] call a3uf_json_fnc_get);
    {
        (uniformContainer _unit) addItemCargoGlobal [
            [_x, "classname"] call a3uf_json_fnc_get,
            [_x, "amount"] call a3uf_json_fnc_get
        ];
    } forEach ([_backpackObject, "items"] call a3uf_json_fnc_get);

    {
        (uniformContainer _unit) addWeaponCargoGlobal [
            [_x, "classname"] call a3uf_json_fnc_get,
            [_x, "amount"] call a3uf_json_fnc_get
        ];
    } forEach ([_backpackObject, "weapons"] call a3uf_json_fnc_get);

    {
        (uniformContainer _unit) addMagazineAmmoCargo [
            [_x, "classname"] call a3uf_json_fnc_get,
            [_x, "amount"] call a3uf_json_fnc_get,
            [_x, "ammo"] call a3uf_json_fnc_get
        ];
    } forEach ([_backpackObject, "magazines"] call a3uf_json_fnc_get);
};
