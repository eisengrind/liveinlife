
class Air;
class Plane : Air {
    class ACE_SelfActions {
        class lilc_actions_flipVehicle {
            displayName = "$STR_lilc_transponder_ActionTitle_transponder";
            condition = "true"; //([(vehicle _target)] call lilc_transponder_fnc_canHaveTransponder)
            exceptions[] = {};
            statement = "[(vehicle _target)] call lilc_transponder_fnc_openMenu;";
            position = [0, 0, 0];
        };
    };
};

class Helicopter : Air {
    class ACE_SelfActions {
        class lilc_actions_flipVehicle {
            displayName = "$STR_lilc_transponder_ActionTitle_transponder";
            condition = "true"; //([(vehicle _target)] call lilc_transponder_fnc_canHaveTransponder)
            exceptions[] = {};
            statement = "[(vehicle _target)] call lilc_transponder_fnc_openMenu;";
            position = [0, 0, 0];
        };
    };
};
