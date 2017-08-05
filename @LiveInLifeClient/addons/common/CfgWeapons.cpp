
class lilci_itemInfo : InventoryItem_Base_F {};
class lilci_item : ItemCore {
    scope = 2;
    author = "Vincent Heins";
    displayName = "This is the LiveInLife template for Items.";
    descriptionShort = "";
    simulation = "ItemMineDetector";
    picture = "\x\lilc\addons\common\icons\lilci_default.paa";

    class ItemInfo : lilci_itemInfo {
        mass = 2;
    };
};

class lilci_rock_F : lilci_item
{
    displayName = "Stein";
    author = "James Stark";
    description = "";
    descriptionShort = "";
    picture = "";
    model = "a3\rocks_f_exp\cliff\cliff_stone_small_f.p3d";

    class ItemInfo : lilci_itemInfo
    {
        mass = 10;
    };
};
