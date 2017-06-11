
class lilci_item;
class lilci_itemInfo;

//#define MASS(AMOUNT) class ItemInfo : lilci_itemInfo { mass = AMOUNT; };

class lilci_waterBottle_F : lilci_item {
    displayName = "$STR_lilci_waterBottle_F";
    picture = "\x\lilc\addons\food\icons\waterBottle.paa";
    model = "a3\structures_f_epa\items\food\bottleplastic_v2_f.p3d";
    lilc_dropDownOptions[] = {
        {"Trinken", "true", "['lilci_waterBottle_F', 0, 40] call lilc_food_fnc_consumeItem;"}
    };

    class ItemInfo : lilci_itemInfo {
        mass = 6;
    };
};

class lilci_wodka_F : lilci_item {
    displayName = "$STR_lilci_wodka_F";
    picture = "\x\lilc\addons\food\icons\plasticBottle.paa";
    model = "a3\structures_f\items\food\bottleplastic_v1_f.p3d";
    lilc_dropDownOptions[] = {
        {"Trinken", "true", "['lilci_wodka_F', 0, 20] call lilc_food_fnc_consumeItem;"}
    };
    
    class ItemInfo : lilci_itemInfo {
        mass = 16;
    };
};

class lilci_ramazzotti_F : lilci_item {
    displayName = "$STR_lilci_ramazzotti_F";
    picture = "\x\lilc\addons\food\icons\ramazzottiBottle.paa";
    model = "a3\structures_f\items\food\bottleplastic_v1_f.p3d";
    lilc_dropDownOptions[] = {
        {"Trinken", "true", "['lilci_ramazzotti_F', 0, 20] call lilc_food_fnc_consumeItem;"}
    };
    
    class ItemInfo : lilci_itemInfo {
        mass = 16;
    };
};

class lilci_bountainMew_F : lilci_item {
    displayName = "$STR_lilci_bountainMew_F";
    picture = "\x\lilc\addons\food\icons\can.paa";
    model = "a3\structures_f\items\food\can_v3_f.p3d";
    lilc_dropDownOptions[] = {
        {"Trinken", "true", "['lilci_bountainMew_F', 0, 30] call lilc_food_fnc_consumeItem;"}
    };
    
    class ItemInfo : lilci_itemInfo {
        mass = 8;
    };
};

class lilci_schiffWasser_F : lilci_item {
    displayName = "$STR_lilci_schiffWasser_F";
    picture = "\x\lilc\addons\food\icons\plasticBottle.paa";
    model = "a3\structures_f\items\food\bottleplastic_v1_f.p3d";
    lilc_dropDownOptions[] = {
        {"Trinken", "true", "['lilci_schiffWasser_F', 0, 25] call lilc_food_fnc_consumeItem;"}
    };
    
    class ItemInfo : lilci_itemInfo {
        mass = 12;
    };
};

class lilci_bonsterMenergy_F : lilci_item {
    displayName = "$STR_lilci_bonsterMenergy_F";
    picture = "\x\lilc\addons\food\icons\plasticBottle.paa";
    model = "a3\structures_f\items\food\bottleplastic_v1_f.p3d";
    lilc_dropDownOptions[] = {
        {"Trinken", "true", "['lilci_bonsterMenergy_F', 0, 30] call lilc_food_fnc_consumeItem;"}
    };
    
    class ItemInfo : lilci_itemInfo {
        mass = 8;
    };
};

class lilci_whiteCola_F : lilci_item {
    displayName = "$STR_lilci_whiteCola_F";
    picture = "\x\lilc\addons\food\icons\plasticBottle.paa";
    model = "a3\structures_f\items\food\bottleplastic_v1_f.p3d";
    lilc_dropDownOptions[] = {
        {"Trinken", "true", "['lilci_whiteCola_F', 0, 35] call lilc_food_fnc_consumeItem;"}
    };
    
    class ItemInfo : lilci_itemInfo {
        mass = 12;
    };
};

class lilci_bebsi_F : lilci_item {
    displayName = "$STR_lilci_bebsi_F";
    picture = "\x\lilc\addons\food\icons\can.paa";
    model = "a3\structures_f\items\food\can_v1_f.p3d";
    lilc_dropDownOptions[] = {
        {"Trinken", "true", "['lilci_bebsi_F', 0, 35] call lilc_food_fnc_consumeItem;"}
    };
    
    class ItemInfo : lilci_itemInfo {
        mass = 8;
    };
};

class lilci_bJuice_F : lilci_item {
    displayName = "$STR_lilci_bJuice_F";
    picture = "\x\lilc\addons\food\icons\plasticBottle.paa";
    model = "a3\structures_f\items\food\bottleplastic_v1_f.p3d";
    lilc_dropDownOptions[] = {
        {"Trinken", "true", "['lilci_bJuice_F', 0, 40] call lilc_food_fnc_consumeItem;"}
    };
    
    class ItemInfo : lilci_itemInfo {
        mass = 8;
    };
};

class lilci_emptyWaterBottle_F : lilci_item {
    displayName = "$STR_lilci_emptyWaterBottle_F";
    picture = "\x\lilc\addons\food\icons\waterBottle.paa";
    lilc_dropDownOptions[] = {
        {"Aufuellen", "true", "call lilc_food_fnc_refuelWaterBottle"}
    };

    class ItemInfo : lilci_itemInfo {
        mass = 2;
    };
};

class lilci_emptyCan_F : lilci_item {
    displayName = "$STR_lilci_emptyCan_F";
    picture = "\x\lilc\addons\food\icons\dentedCan.paa";
    
    class ItemInfo : lilci_itemInfo {
        mass = 2;
    };
};

class lilci_emptyPlasticBottle_F : lilci_item {
    displayName = "$STR_lilci_emptyPlasticBottle_F";
    picture = "\x\lilc\addons\food\icons\plasticBottle.paa";
    lilc_dropDownOptions[] = {
        {"Aufuellen", "true", "call lilc_food_fnc_refuelPlasticBottle"}
    };
    
    class ItemInfo : lilci_itemInfo {
        mass = 2;
    };
};

class lilci_goatFlesh_F : lilci_item {
    displayName = "Ziegenfleisch";
    picture = "\x\lilc\addons\food\icon\meat.paa";
    model = "\x\lilc\addons\food\models\meat";
    lilc_dropDownOptions[] = {
        {"Essen", "true", "['lilci_goatFlesh_F', 30, 0] call lilc_food_fnc_consumeItem;"}
    };

    class ItemInfo : lilci_itemInfo {
        mass = 6;
    };
};

class lilci_foodCan_F : lilci_item {
    displayName = "Thunfisch Dose";
    picture = "\x\lilc\addons\food\icons\foodCan.paa";
    model = "\a3\structures_f_epa\items\food\bakedbeans_f.p3d";
    lilc_dropDownOptions[] = {
        {"Essen", "true", "['lilci_foodCan_F', 60, 0] call lilc_food_fnc_consumeItem;"}
    };

    class ItemInfo : lilci_itemInfo {
        mass = 6;
    };
};

class lilci_crunchinChrisps_F : lilci_item {
    displayName = "knirschende Kornflakes";
    picture = "\x\lilc\addons\food\icons\foodCan.paa";
    model = "\a3\structures_f_epa\items\food\bakedbeans_f.p3d";
    lilc_dropDownOptions[] = {
        {"Essen", "true", "['lilci_crunchinChrisps_F', 40, 0] call lilc_food_fnc_consumeItem;"}
    };

    class ItemInfo : lilci_itemInfo {
        mass = 8;
    };
};

class lilci_ketchup_F : lilci_item {
    displayName = "Ketchup";
    picture = "\x\lilc\addons\food\icons\ketchup.paa";
    model = "\a3\structures_f_heli\items\food\ketchup_01_f.p3d";
    lilc_dropDownOptions[] = {
        {"Essen", "true", "['lilci_ketchup_F', 10, 0] call lilc_food_fnc_consumeItem;"}
    };

    class ItemInfo : lilci_itemInfo {
        mass = 1;
    };
};

class lilci_mustard_F : lilci_item {
    displayName = "Senf";
    picture = "\x\lilc\addons\food\icons\mustard.paa";
    model = "\a3\structures_f_heli\items\food\mustard_01_f.p3d";
    lilc_dropDownOptions[] = {
        {"Essen", "true", "['lilci_mustard_F', 10, 0] call lilc_food_fnc_consumeItem;"}
    };

    class ItemInfo : lilci_itemInfo {
        mass = 1;
    };
};

class lilci_milkPowder_F : lilci_item {
    displayName = "Milchpulver";
    picture = "\x\lilc\addons\food\icons\milkPowder.paa";
    model = "\a3\structures_f_epa\items\food\powderedmilk_f.p3d";
    lilc_dropDownOptions[] = {
        {"Essen", "true", "['lilci_milkPowder_F', 25, 0] call lilc_food_fnc_consumeItem;"}
    };

    class ItemInfo : lilci_itemInfo {
        mass = 2;
    };
};

class lilci_rice_F : lilci_item {
    displayName = "Reis";
    picture = "\x\lilc\addons\food\icons\rice.paa";
    model = "\a3\structures_f_epa\items\food\ricebox_f.p3d";
    lilc_dropDownOptions[] = {
        {"Essen", "true", "['lilci_rice_F', 10, 0] call lilc_food_fnc_consumeItem;"}
    };

    class ItemInfo : lilci_itemInfo {
        mass = 2;
    };
};

class lilci_tacticalBacon_F : lilci_item {
    displayName = "Tactical Bacon";
    picture = "\x\lilc\addons\food\icons\tacticalBacon.paa";
    model = "\a3\structures_f\items\food\tacticalbacon_f.p3d";
    lilc_dropDownOptions[] = {
        {"Essen", "true", "['lilci_tacticalBacon_F', 60, 0] call lilc_food_fnc_consumeItem;"}
    };

    class ItemInfo : lilci_itemInfo {
        mass = 6;
    };
};

class lilci_bounty_F : lilci_item {
    displayName = "Bounty, du kleiner Splasher!";
    picture = "";
    model = "";
    lilc_dropDownOptions[] = {
        {}
    };
};
