
class Animal_Base_F;
class Sheep_random_F : Animal_Base_F {
    class ACE_Actions {
        class ACE_MainActions {
            class lilc_animals_cutWool {
                displayName = "$STR_lilc_actions_ActionTitle_cutWool";
                condition = "([_target] call lilc_animals_fnc_canCutWool)";
                statement = "[_target] call lilc_animals_fnc_doCutWool;";
            };
        };
    };
};
