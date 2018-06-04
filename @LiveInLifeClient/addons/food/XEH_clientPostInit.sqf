
[
    "lilci_waterBottle_F",
    "Trinken",
    {
        true;
    },
    {
        ["lilci_waterBottle_F", 0, 40] call lilc_food_fnc_consumeItem;
    }
] call lilc_inventory_menu_fnc_addItemOption;

[
    "lilci_wodka_F",
    "Trinken",
    {
        true;
    },
    {
        ["lilci_wodka_F", 0, 20] call lilc_food_fnc_consumeItem;
    }
] call lilc_inventory_menu_fnc_addItemOption;

[
    "lilci_ramazzotti_F",
    "Trinken",
    {
        true;
    },
    {
        ["lilci_ramazzotti_F", 0, 20] call lilc_food_fnc_consumeItem;
    }
] call lilc_inventory_menu_fnc_addItemOption;

[
    "lilci_bountainMew_F",
    "Trinken",
    {
        true;
    },
    {
        ["lilci_bountainMew_F", 0, 30] call lilc_food_fnc_consumeItem;
    }
] call lilc_inventory_menu_fnc_addItemOption;

[
    "lilci_schiffWasser_F",
    "Trinken",
    {
        true;
    },
    {
        ["lilci_schiffWasser_F", 0, 25] call lilc_food_fnc_consumeItem;
    }
] call lilc_inventory_menu_fnc_addItemOption;

[
    "lilci_bonsterMenergy_F",
    "Trinken",
    {
        true;
    },
    {
        ["lilci_bonsterMenergy_F", 0, 30] call lilc_food_fnc_consumeItem;
    }
] call lilc_inventory_menu_fnc_addItemOption;

[
    "lilci_whiteCola_F",
    "Trinken",
    {
        true;
    },
    {
        ["lilci_whiteCola_F", 0, 35] call lilc_food_fnc_consumeItem;
    }
] call lilc_inventory_menu_fnc_addItemOption;

[
    "lilci_bebsi_F",
    "Trinken",
    {
        true;
    },
    {
        ["lilci_bebsi_F", 0, 35] call lilc_food_fnc_consumeItem;
    }
] call lilc_inventory_menu_fnc_addItemOption;

[
    "lilci_bJuice_F",
    "Trinken",
    {
        true;
    },
    {
        ["lilci_bJuice_F", 0, 40] call lilc_food_fnc_consumeItem;
    }
] call lilc_inventory_menu_fnc_addItemOption;

[
    "lilci_emptyWaterBottle_F",
    "Auffüllen",
    {
        true;
    },
    {
        call lilc_food_fnc_refuelWaterBottle;
    }
] call lilc_inventory_menu_fnc_addItemOption;

[
    "lilci_emptyPlasticBottle_F",
    "Auffüllen",
    {
        true;
    },
    {
        call lilc_food_fnc_refuelPlasticBottle;
    }
] call lilc_inventory_menu_fnc_addItemOption;

[
    "lilci_goatFlesh_F",
    "Essen",
    {
        true;
    },
    {
        ["lilci_goatFlesh_F", 30, 0] call lilc_food_fnc_consumeItem;
    }
] call lilc_inventory_menu_fnc_addItemOption;

[
    "lilci_foodCan_F",
    "Essen",
    {
        true;
    },
    {
        ["lilci_foodCan_F", 60, 0] call lilc_food_fnc_consumeItem;
    }
] call lilc_inventory_menu_fnc_addItemOption;

[
    "lilci_crunchinChrisps_F",
    "Essen",
    {
        true;
    },
    {
        ["lilci_crunchinChrisps_F", 40, 0] call lilc_food_fnc_consumeItem;
    }
] call lilc_inventory_menu_fnc_addItemOption;

[
    "lilci_ketchup_F",
    "Essen",
    {
        true;
    },
    {
        ["lilci_ketchup_F", 10, 0] call lilc_food_fnc_consumeItem;
    }
] call lilc_inventory_menu_fnc_addItemOption;

[
    "lilci_mustard_F",
    "Essen",
    {
        true;
    },
    {
        ["lilci_mustard_F", 10, 0] call lilc_food_fnc_consumeItem;
    }
] call lilc_inventory_menu_fnc_addItemOption;

[
    "lilci_milkPowder_F",
    "Essen",
    {
        true;
    },
    {
        ["lilci_milkPowder_F", 25, 0] call lilc_food_fnc_consumeItem;
    }
] call lilc_inventory_menu_fnc_addItemOption;

[
    "lilci_rice_F",
    "Essen",
    {
        true;
    },
    {
        ["lilci_rice_F", 10, 0] call lilc_food_fnc_consumeItem;
    }
] call lilc_inventory_menu_fnc_addItemOption;

[
    "lilci_tacticalBacon_F",
    "Essen",
    {
        true;
    },
    {
        ["lilci_tacticalBacon_F", 60, 0] call lilc_food_fnc_consumeItem;
    }
] call lilc_inventory_menu_fnc_addItemOption;

[
    "lilc_schiffWasser",
    "Trinken",
    {
        true;
    },
    {
        ["lilc_schiffWasser", 0, 15] call lilc_food_fnc_consumeItem;
        [player, 20] call lilc_drugs_fnc_addAlcohol;
    }
] call lilc_inventory_menu_fnc_addItemOption;
