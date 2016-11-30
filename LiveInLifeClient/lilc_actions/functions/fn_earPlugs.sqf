
if ((["lilci_earPlugs_F"] call lilc_inventory_fnc_itemInInventory) <= 0) exitWith { hint "Du besitzt keine Ohrstöpsel."; };

if (lilc_player_earPlugsStatus) then {
    lilc_player_earPlugsStatus = false;
    1 fadeSound 1;
} else {
    lilc_player_earPlugsStatus = true;
    1 fadeSound 0.2;
};

/*
switch (lilc_player_earPlugsStatus) do {
    case 0: {
        lilc_player_earPlugsStatus = 1;
        1 fadeSound 1;
        hint "Ohrstöpsel sind eingsteckt. Es werden 0% gedämmt.";
    };

    case 1: {
        lilc_player_earPlugsStatus = 2;
        1 fadeSound 0.8;
        hint "Ohrstöpsel sind eingsteckt. Es werden 20% gedämmt.";
    };
    case 2: {
        lilc_player_earPlugsStatus = 3;
        1 fadeSound 0.6;
        hint "Ohrstöpsel sind eingsteckt. Es werden 40% gedämmt.";
    };

    case 3: {
        lilc_player_earPlugsStatus = 4;
        1 fadeSound 0.4;
        hint "Ohrstöpsel sind eingsteckt. Es werden 60% gedämmt.";
    };

    case 4: {
        lilc_player_earPlugsStatus = 5;
        1 fadeSound 0.2;
        hint "Ohrstöpsel sind eingsteckt. Es werden 80% gedämmt.";
    };

    case 5: {
        LiveInLlilc_player_earPlugsStatus = 0;
        1 fadeSound 0.1;
        hint "Ohrstöpsel sind eingsteckt. Es werden 100% gedämmt.";
    };
};
*/
