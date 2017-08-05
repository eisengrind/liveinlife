
private _currentCategory = (lbData [1203, (lbCurSel 1203)]);

if (_currentCategory != ([lilc_shops_clothing_lastClassname] call lilc_shops_fnc_getCategory)) then {
    [player, ([lilc_shops_clothing_lastClassname] call lilc_shops_fnc_getCategory)] call lilc_inventory_fnc_removeUniformCategory;
    [player, (switch ([lilc_shops_clothing_lastClassname] call lilc_shops_fnc_getCategory) do {
        case "Glasses": { lilc_shops_clothing_defaultGlasses; };
        case "Headgear": { lilc_shops_clothing_defaultHeadgear; };
        case "Vest": { lilc_shops_clothing_defaultVest; };
        case "Uniform": { lilc_shops_clothing_defaultUniform; };
        case "Backpack": { lilc_shops_clothing_defaultBackpack; };
        default { ""; };
    }), -1, true, false] call lilc_inventory_fnc_add;
};

call lilc_shops_fnc_updateClothingMenu;

/*
lilc_shops_clothing_lastWeared = (
    switch (_currentCategory) do {
        case "Glasses": { };
        case "Headgear": { };
        case "Vest": { };
        case "Uniform": { };
        case "Backpack": { };
    };
);
*/