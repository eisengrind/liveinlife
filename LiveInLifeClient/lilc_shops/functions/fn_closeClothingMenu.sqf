
try
{
    if (isNull (findDisplay 1201)) throw false;
    closeDialog 1201;
    
    [0.5] call lilc_ui_fnc_fadeInBlack;
    sleep 0.5;

    {
        if !(isNull _x) then {
            clearWeaponCargoGlobal _x;
            clearMagazineCargoGlobal _x;
            clearItemCargoGlobal _x;
        };
    } forEach [(uniformContainer player), (vestContainer player), (backpackContainer player)];

    [
        player,
        ([lilc_shops_clothing_lastClassname] call lilc_shops_fnc_getCategory)
    ] call lilc_inventory_fnc_removeUniformCategory;
    [
        player,
        (switch ([lilc_shops_clothing_lastClassname] call lilc_shops_fnc_getCategory) do
        {
            case "Glasses":
            {
                lilc_shops_clothing_defaultGlasses;
            };

            case "Headgear":
            {
                lilc_shops_clothing_defaultHeadgear;
            };

            case "Vest":
            {
                lilc_shops_clothing_defaultVest;
            };

            case "Uniform":
            {
                lilc_shops_clothing_defaultUniform;
            };

            case "Backpack":
            {
                lilc_shops_clothing_defaultBackpack;
            };

            default
            {
                "";
            };
        }),
        -1,
        true,
        false
    ] call lilc_inventory_fnc_add;

    [player, lilc_shops_clothing_uniformContent] call lilc_inventory_fnc_setUniformInventory;
    [player, lilc_shops_clothing_vestContent] call lilc_inventory_fnc_setVestInventory;
    [player, lilc_shops_clothing_backpackContent] call lilc_inventory_fnc_setBackpackInventory;

    lilc_shops_clothing_uniformContent = [];
    lilc_shops_clothing_vestContent = [];
    lilc_shops_clothing_backpackContent = [];

    lilc_shops_clothing_defaultUniform = "";
    lilc_shops_clothing_defaultVest = "";
    lilc_shops_clothing_defaultBackpack = "";
    lilc_shops_clothing_defaultHeadgear = "";
    lilc_shops_clothing_defaultGlasses = "";

    lilc_shops_currentShopname = "";

    lilc_shops_clothing_camera cameraEffect ["terminate", "back"];
    camDestroy lilc_shops_clothing_camera;
    lilc_shops_clothing_camera = objNull;
    [1] call lilc_ui_fnc_fadeOutBlack;
}
catch
{
    _exception;
};
