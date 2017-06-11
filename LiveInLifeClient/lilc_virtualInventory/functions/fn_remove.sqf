
param [
    //["_object", player, [objNull]],
    ["_ViClassname", "", [""]],
    ["_ViNames", [], ["", []]],
    ["_ViData", nil]
];

try {
    /*if (isNull _object) throw false;
    if (isPlayer _object && !(_object isEqualTo player)) throw false;*/

    private _itemConfig = ([_ViClassname] call lilc_virtualInventory_fnc_getVirtualItemConfig);
    if (isNull _itemConfig) throw false;

    if (_ViNames isEqualType []) then { if ((count _ViNames) != 2) throw false; };
    if (_ViNames isEqualType "") then { _ViNames = [_ViNames, ""]; };

    if (isNil "lilc_virtualInventory_inventory") then { lilc_virtualInventory_inventory = []; throw false; };

    _ViNames = [
        (if ((_ViNames select 0) == "" && getNumber(_itemConfig >> "modifyDisplayName") != 1) then { getText(_itemConfig >> "displayName"); } else { (_ViNames select 0); }),
        (if ((_ViNames select 0) == "" && getNumber(_itemConfig >> "modifyDescriptionShort") != 1) then { getText(_itemConfig >> "descriptionShort"); } else { (_ViNames select 0); })
    ];

    {
        if ((_x select 0) isEqualTo _ViClassname && (_x select 1) isEqualTo _ViNames && (_x select 2) isEqualTo _ViData) then { lilc_virtualInventory_inventory deleteAt _forEachIndex; throw true; };
    } forEach lilc_virtualInventory_inventory;
    throw false;
} catch {
    _exception;
};
