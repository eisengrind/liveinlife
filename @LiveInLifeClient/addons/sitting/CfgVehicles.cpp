
class Man;
class CAManBase : Man {
    class ACE_SelfActions {
        class lilc_sitting_getUp {
            displayName = "$STR_lilc_sitting_ActionTitle_getUp";
            condition = "call lilc_sitting_fnc_canGetUp";
            statement = "call lilc_sitting_fnc_doGetUp;";
        };
    };
};
