
class Man;
class CAManBase : Man {
    class ACE_Actions {
        class ACE_MainActions {
            class lilc_butt_inventory_open {
                displayName = "Hintern öffnen";
                condition = "[_target] call lilc_butt_inventory_fnc_canHideItems;";
                statement = "[_target] call lilc_butt_inventory_fnc_doHideItems;";
            };
        };
    };

    class ACE_SelfActions {
        class lilc_butt_inventory_open {
            displayName = "Hintern öffnen";
            condition = "[ACE_player] call lilc_butt_inventory_fnc_canHideItems;";
            statement = "[ACE_player] call lilc_butt_inventory_fnc_doHideItems;";
        };
    };
};
