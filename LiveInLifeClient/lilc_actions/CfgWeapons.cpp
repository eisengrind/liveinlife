
//#define massInfo(MASS) class ItemInfo : lilci_itemInfo { mass = ##MASS; };

class lilci_bracelets_F : lilci_item {
    displayName = "Handschellen"; //TODO: $STR_lilci_bracelets_F
    picture = "\lilc_actions\icons\lilci_bracelets_F.paa";
    
    class ItemInfo : lilci_itemInfo {
        mass = 4;
    };
};

class lilci_earPlugs_F : lilci_item {
    displayName = "Ohrenstöpsel"; //TODO: $STR_lilci_earPlugs_F
    picture = "\lilc_actions\icons\lilci_earPlugs_F.paa";
    menuOptions[] = {{"Nutzen", "call lilc_actions_fnc_earPlugs;"}};
};

class lilci_wire_F : lilci_item {
    displayName = "Draht"; // TODO: $STR_lilci_wire_F
    picture = "\lilc_actions\icons\lilci_wire_F.paa";

    class ItemInfo : lilci_itemInfo {
        mass = 3;
    };
};


