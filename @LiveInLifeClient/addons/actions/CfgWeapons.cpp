
//#define massInfo(MASS) class ItemInfo : lilci_itemInfo { mass = ##MASS; };

class lilci_bracelets_F : lilci_item {
    displayName = "Handschellen"; //TODO: $STR_lilci_bracelets_F
    picture = "\x\lilc\addons\actions\icons\lilci_bracelets_F.paa";
    
    class ItemInfo : lilci_itemInfo {
        mass = 4;
    };
};

class lilci_earPlugs_F : lilci_item {
    displayName = "Ohrenstöpsel"; //TODO: $STR_lilci_earPlugs_F
    picture = "\x\lilc\addons\actions\icons\lilci_earPlugs_F.paa";
    lilc_dropDownOptions[] = {{"Nutzen", "true", "call lilc_actions_fnc_earPlugs;"}};
};
