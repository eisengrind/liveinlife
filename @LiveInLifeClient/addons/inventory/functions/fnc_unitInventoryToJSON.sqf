#include "..\script_component.hpp"

params [
    ["_headInventory", [], [[]]],
    ["_assignedItems", [], [[]]],
    ["_uniformInventory", [], [[]]],
    ["_vestInventory", [], [[]]],
    ["_backpackInventory", [], [[]]],
    ["_equippedWeapons", [], [[]]],
    ["_insignia", "", [""]]
];

_headInventory params [
    ["_headgear", "", [""]],
    ["_goggles", "", [""]],
    ["_hmd", "", [""]],
    ["_binocular", "", [""]]
];

_uniformInventory params [
    ["_uniform", "", [""]],
    ["_uniformColor", "", [""]],
    ["_uniformItems", [], [[]]],
    ["_uniformMagazines", [], [[]]],
    ["_uniformWeapons", [], [[]]]
];

_vestInventory params [
    ["_vest", "", [""]],
    ["_vestItems", [], [[]]],
    ["_vestMagazines", [], [[]]],
    ["_vestWeapons", [], [[]]]
];

_backpackInventory params [
    ["_backpack", "", [""]],
    ["_backpackColor", "", [""]],
    ["_backpackItems", [], [[]]],
    ["_backpackMagazines", [], [[]]],
    ["_backpackWeapons", [], [[]]]
];

_equippedWeapons params [
    ["_primaryEquippedWeapon", [], [[]]],
    ["_secondaryEquippedWeapon", [], [[]]],
    ["_handgunEquippedWeapon", [], [[]]]
];

_primaryEquippedWeapon params [
    ["_primaryWeapon", "", [""]],
    ["_primaryWeaponMagazines", [], [[]]],
    ["_primaryWeaponItems", [], [[]]]
];

_secondaryEquippedWeapon params [
    ["_secondaryWeapon", "", [""]],
    ["_secondaryWeaponMagazines", [], [[]]],
    ["_secondaryWeaponItems", [], [[]]]
];

_handgunEquippedWeapon params [
    ["_handgunWeapon", "", [""]],
    ["_handgunWeaponMagazines", [], [[]]],
    ["_handgunWeaponItems", [], [[]]]
];

["object", [
    ["head", ["object", [
        ["headgear", _headgear],
        ["goggles", _goggles],
        ["hmd", _hmd],
        ["binocular", _binocular]
    ]]],
    ["assigned_items", ["array", _assignedItems]],
    ["uniform", [["object", [
        ["classname", _uniform],
        ["items", _uniformItems call FUNC(unitInventoryItemsArray)],
        ["weapons", _uniformWeapons call FUNC(unitInventoryItemsArray)],
        ["magazines", _uniformMagazines call FUNC(unitInventoryMagazinesArray)]
    ]], nil] select (_uniform == "")],
    ["vest", [["object", [
        ["classname", _vest],
        ["items", _vestItems call FUNC(unitInventoryItemsArray)],
        ["weapons", _vestWeapons call FUNC(unitInventoryItemsArray)],
        ["magazines", _vestMagazines call FUNC(unitInventoryMagazinesArray)]
    ]], nil] select (_vest == "")],
    ["backpack", [["object", [
        ["classname", _backpack],
        ["items", _backpackItems call FUNC(unitInventoryItemsArray)],
        ["weapons", _backpackWeapons call FUNC(unitInventoryItemsArray)],
        ["magazines", _backpackMagazines call FUNC(unitInventoryMagazinesArray)]
    ]], nil] select (_backpack == "")],
    ["weapons", ["object", [
        ["primary", [["object", [
            ["classname", _primaryWeapon],
            ["magazines", ["array", _primaryWeaponMagazines]],
            ["items", ["array", _primaryWeaponItems]]
        ]], nil] select (_primaryWeapon == "")],
        ["secondary", [["object", [
            ["classname", _primaryWeapon],
            ["magazines", ["array", _secondaryWeaponMagazines]],
            ["items", ["array", _secondaryWeaponItems]]
        ]], nil] select (_primaryWeapon == "")],
        ["handgun", [["object", [
            ["classname", _handgunWeapon],
            ["magazines", ["array", _handgunWeaponMagazines]],
            ["items", ["array", _handgunWeaponItems]]
        ]], nil] select (_primaryWeapon == "")]
    ]]],
    ["insignia", _insignia]
]] call EFUNC(api,toJSON);
