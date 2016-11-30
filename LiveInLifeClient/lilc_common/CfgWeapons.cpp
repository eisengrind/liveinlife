
class lilci_itemInfo : InventoryItem_Base_F {};
class lilci_item : ItemCore {
    scope = 2;
    author = "Vincent Heins";
    displayName = "This is the LiveInLife template for Items.";
    descriptionShort = "";
    simulation = "ItemMineDetector";
    picture = "\lilc_common\icons\lilci_default.paa";

    class ItemInfo : lilci_itemInfo {
        mass = 2;
    };
};
