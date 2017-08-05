
try {
    disableSerialization;
    private _ui = (findDisplay 1201);
    if (isNull _ui) throw false;

    private _uiListItems = (_ui displayCtrl 1202);
    private _uiComboCategories = (_ui displayCtrl 1203);
    private _uiTextBalance = (_ui displayCtrl 1204);

    private _currentItem = (lbCurSel _uiListItems);
    if (_currentItem <= -1) throw false;

    private _itemData = (call compile (_uiListItems lbData _currentItem)); // [<classname>, <color>]
    private _itemValue = (_uiListItems lbValue _currentItem); // <cost>
    systemChat str _itemData;
    if !([(_itemData select 0)] call lilc_shops_fnc_isUniformItem) throw false;

    _uiTextBalance ctrlSetStructuredText parseText format["<t align='left' font='PuristaMedium'>Summe: <t color='#6EE6A2'>%1</t></t>", (if (_itemValue <= -1) then { "-"; } else { format["%1$", _itemValue]; })];

    if (isNil "lilc_shops_clothing_lastClassname") then { lilc_shops_clothing_lastClassname = ""; };

    if ((_itemData select 0) != lilc_shops_clothing_lastClassname) then {
        if (([(_itemData select 0)] call lilc_shops_fnc_getCategory) != ([lilc_shops_clothing_lastClassname] call lilc_shops_fnc_getCategory)) then {
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
        
        if ((_itemData select 0) in ["no_glasses", "no_headgear", "no_vest", "no_uniform", "no_backpack"]) then {
            [player, ([(_itemData select 0)] call lilc_shops_fnc_getCategory)] call lilc_inventory_fnc_removeUniformCategory;
        } else {
            [player, (_itemData select 0), -1, true, false] call lilc_inventory_fnc_add;
        };

        private _itemType = ([(_itemData select 0)] call BIS_fnc_itemType);
        switch (_itemType select 0) do {
            case "Equipment": {
                switch (_itemType select 1) do {
                    case "Uniform": { (uniformContainer player) setVariable ["lilc_color", (_itemData select 1), true]; [(_itemData select 1), player, 0] call lilc_textures_fnc_setUniform; };
                    case "Backpack": { (backpackContainer player) setVariable ["lilc_color", (_itemData select 1), true]; [(_itemData select 1), (backpackContainer player), 0] call lilc_textures_fnc_setBackpack; };
                    //case "Vest": { (vestContainer player) setVariable ["lilc_color", (_data select 1), true]; };
                };
            };
        };

        lilc_shops_clothing_lastClassname = (_itemData select 0);
    };

    //begin to change appearance


    /*if (_index <= -1) throw false;

    disableSerialization;
    _ui = (findDisplay 1201);
    if (isNull _ui) throw false;

    private _data = call compile format["%1;", lbData [1202, _index]];
    private _classname = (_data select 0);
    private _skin = (_data select 2);
    private _cost = (lbValue [1202, _index]);
    if (_classname == "") throw false;
    //[player, lilc_shops_playerInventory] call lilc_inventory_fnc_setInventory;

    private _uiTextBalance = (_ui displayCtrl 1204);
    _uiTextBalance ctrlSetStructuredText parseText format["<t align='left' font='PuristaLight' size='0.9' shadow='0'>Summe: <t color='#6EE6A2'>%1 $</t></t>", _cost];

    if !([_classname] call lilc_shops_fnc_isUniformItem) throw false;

    //if !(isNil "lilc_shops_lastClassname") then {
    //    [player, lilc_shops_lastClassname, -1, true, false] call lilc_inventory_fnc_add;
    //};

    if (isNil "lilc_shops_lastClassname") then { lilc_shops_lastClassname = ""; };

    if (([lilc_shops_lastClassname] call lilc_shops_fnc_getCategory) != ([_classname] call lilc_shops_fnc_getCategory)) then {
        [player, lilc_shops_lastClassname, -1, true, false] call lilc_inventory_fnc_add;
        lilc_shops_lastClassname = (switch ([_classname] call lilc_shops_fnc_getCategory) do {
            case "Glasses": { (goggles player); };
            case "Headgear": { (headgear player); };
            case "Vest": { (vest player); };
            case "Uniform": { (uniform player); };
            case "Backpack": { (backpack player); };
        });
    };

    if (([_classname] call lilc_shops_fnc_getCategory) in ["Glasses", "Headgear", "Vest", "Uniform", "Backpack"]) then {
        if (_classname in ["no_glasses", "no_headgear", "no_vest", "no_uniform", "no_backpack"]) then {
            [player, ([_classname] call lilc_shops_fnc_getCategory)] call lilc_inventory_fnc_removeUniformCategory;
        } else {
            [player, _classname, -1, true, false] call lilc_inventory_fnc_add;
            //TODO: insert texture handling...
        };
        throw true;
    };

    private _itemType = ([_classname] call BIS_fnc_itemType);
    switch (_itemType select 0) do {
        case "Equipment": {
            switch (_itemType select 1) do {
                case "Uniform": { (uniformContainer player) setVariable ["lilc_color", (_data select 1), true]; [(_data select 1), player, 0] call lilc_textures_fnc_setUniform; };
                case "Backpack": { (backpackContainer player) setVariable ["lilc_color", (_data select 1), true]; [(_data select 1), (backpackContainer player), 0] call lilc_textures_fnc_setBackpack; };
                //case "Vest": { (vestContainer player) setVariable ["lilc_color", (_data select 1), true]; };
            };
        };
    };

    throw false;
    */
} catch {
    _exception;
};
