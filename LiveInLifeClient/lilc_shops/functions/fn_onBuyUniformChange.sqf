
private _index = param [0, -1, [0]];

try {
    if (_index <= -1) throw false;

    disableSerialization;
    _ui = (findDisplay 1201);
    if (isNull _ui) throw false;

    private _data = call compile format["%1;", lbData [1202, _index]];
    private _classname = (_data select 0);
    private _skin = (_data select 2);
    private _cost = (lbValue [1202, _index]);
    if (_classname == "") throw false;
    [player, lilc_shops_playerInventory] call lilc_inventory_fnc_setInventory;

    private _uiTextBalance = (_ui displayCtrl 1204);
    _uiTextBalance ctrlSetStructuredText parseText format["<t align='left' font='PuristaLight' size='0.9'>Summe: <t color='#6EE6A2'>%1 $</t></t>", _cost];

    if !([_classname] call lilc_shops_fnc_isUniformItem) throw false;

    if (([_classname] call lilc_shops_fnc_getCategory) in ["Glasses", "Headgear", "Vest", "Uniform", "Backpack"]) then {
        [player, _classname] call lilc_inventory_fnc_add;
        //TODO: insert texture handling...
        throw true;
    };

    throw false;
} catch {
    _exception;
};
