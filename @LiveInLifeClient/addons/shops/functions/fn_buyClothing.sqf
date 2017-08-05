
try
{
    private _itemData = (call compile (lbData [1202, (lbCurSel 1202)]));
    private _itemValue = (lbValue [1202, (lbCurSel 1202)]);
    systemChat str _itemValue;
    if ((count _itemData) != 2) throw false;

    if (_itemValue > 0) then
    {
        if !([_itemValue] call lilc_cash_fnc_have) then
        {
            ["Du hast nicht genügend Geld!", "ERROR"] call lilc_ui_fnc_hint;
            throw false;
        };

        if !([player, _itemValue] call lilc_cash_fnc_remove) then
        {
            ["Du konntest nicht bezahlen!", "ERROR"] call lilc_ui_fnc_hint;
            throw false;
        };
    };

    if ((_itemData select 0) in ["no_glasses", "no_headgear", "no_vest", "no_uniform", "no_backpack"]) then
    {
        [player, ([(_itemData select 0)] call lilc_shops_fnc_getCategory)] call lilc_inventory_fnc_removeUniformCategory;
        ["Dein Kleideungsstück wurde erfolgreich entfernt!"] call lilc_ui_fnc_hint;

        switch (_itemData select 0) do
        {
            case "no_glasses":
            {
                lilc_shops_clothing_defaultGlasses = "";
            };
            
            case "no_headgear":
            {
                lilc_shops_clothing_defaultHeadgear = "";
            };

            case "no_vest":
            {
                lilc_shops_clothing_defaultVest = "";
            };

            case "no_uniform":
            {
                lilc_shops_clothing_defaultUniform = "";
            };

            case "no_backpack":
            {
                lilc_shops_clothing_defaultBackpack = "";
            };
        };

        throw true;
    }
    else
    {
        if !([player, (_itemData select 0), -1, true, false] call lilc_inventory_fnc_add) then
        {
            ["Du konntest das Kleidungsstück nicht kaufen!", "ERROR"] call lilc_ui_fnc_hint;
            throw false;
        };
    };

    switch ([(_itemData select 0)] call lilc_shops_fnc_getCategory) do
    {
        case "Glasses":
        {
            lilc_shops_clothing_defaultGlasses = (_itemData select 0);
        };

        case "Headgear":
        {
            lilc_shops_clothing_defaultHeadgear = (_itemData select 0);
        };

        case "Uniform":
        {
            (uniformContainer player) setVariable ["lilc_color", (_itemData select 1), true];
            [(_itemData select 1), player, 0] call lilc_textures_fnc_setUniform;
            lilc_shops_clothing_defaultUniform = (_itemData select 0);
        };

        case "Vest":
        {
            lilc_shops_clothing_defaultVest = (_itemData select 0);
        };

        case "Backpack":
        {
            (backpackContainer player) setVariable ["lilc_color", (_itemData select 1), true];
            [(_itemData select 1), (backpackContainer player), 0] call lilc_textures_fnc_setBackpack;
            lilc_shops_clothing_defaultBackpack = (_itemData select 0);
        };
    };

    lilc_shops_clothing_lastClassname = "";
    ["Du hast das Kleidungsstück gekauft!"] call lilc_ui_fnc_hint;

    throw true;
}
catch
{
    _exception;
};
