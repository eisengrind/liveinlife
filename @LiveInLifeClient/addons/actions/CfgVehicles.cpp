
class Man;
class CAManBase : Man
{
    class ACE_Actions
    {
        class ACE_MainActions
        {
            class lilc_actions_hideCorpse {
                displayName = "$STR_lilc_actions_ActionTitle_hideCorpse";
                condition = "[_target] call lilc_actions_fnc_canHideCorpse";
                exceptions[] = {};
                statement = "[_target] call lilc_actions_fnc_doHideCorpse;";
            };

            class lilc_actions_giveMoney
            {
                displayName = "$STR_lilc_actions_ActionTitle_giveMoney";
                condition = "[_target] call lilc_actions_fnc_canGiveMoney";
                statement = "[_target] call lilc_actions_fnc_doGiveMoney;";
            };

            class lilc_actions_showPersonalcard
            {
                displayName = "$STR_lilc_actions_ActionTitle_showPersonalcard";
                condition = "[_target] call lilc_pcard_fnc_canShowPersonalcard";
                statement = "[_target] call lilc_pcard_fnc_doShowPersonalcard;";
            };

            class lilc_actions_robPerson
            {
                displayName = "$STR_lilc_actions_ActionTitle_robPerson";
                condition = "[cursorTarget] call lilc_actions_fnc_canRobPerson";
                statement = "[cursorTarget] call lilc_actions_fnc_doRobPerson;";
            };
        };
    };
};

class Items_Base_F;
class Land_WaterCooler_01_new_F : Items_Base_F
{
    class ACE_Actions
    {
        class ACE_MainActions
        {
            class lilc_actions_waterDispenser
            {
                displayName = "$STR_lilc_actions_ActionTitle_waterDispenser";
                condition = "[_target] call lilc_actions_fnc_canUseWaterDispenser";
                statement = "call lilc_actions_fnc_useWaterDispenser;";
            };
        };
    };
};

class AllVehicles;
class Air : AllVehicles
{
    class ACE_Actions
    {
        class ACE_MainActions
        {
            class lilc_actions_flipVehicle
            {
                displayName = "$STR_lilc_actions_ActionTitle_flipVehicle";
                condition = "[_target] call lilc_actions_fnc_canFlipVehicle";
                exceptions[] = {};
                statement = "[_target] call lilc_actions_fnc_doFlipVehicle;";
            };
        };
    };
};

class Ship : AllVehicles {
    class ACE_Actions {
        class ACE_MainActions {
            class lilc_actions_flipVehicle {
                displayName = "$STR_lilc_actions_ActionTitle_flipVehicle";
                condition = "[_target] call lilc_actions_fnc_canFlipVehicle";
                statement = "[_target] call lilc_actions_fnc_doFlipVehicle;";
                //position = [0, 0, 0];
            };
        };
    };
};

class Land : AllVehicles
{
    class ACE_Actions
    {
        class ACE_MainActions
        {
            class lilc_actions_flipVehicle
            {
                displayName = "$STR_lilc_actions_ActionTitle_flipVehicle";
                condition = "[_target] call lilc_actions_fnc_canFlipVehicle";
                statement = "[_target] call lilc_actions_fnc_doFlipVehicle;";
                //position = [0, 0, 0];
            };
        };
    };
};

/*
class LandVehicle;
class Car : LandVehicle {
};

class Air;
class Plane : Air {
    class ACE_Actions {
        class ACE_MainActions {
            class lilc_actions_flipVehicle {
                displayName = "$STR_lilc_actions_ActionTitle_flipVehicle";
                condition = "true";
                exceptions[] = {};
                statement = "[_target] call lilc_actions_fnc_flipVehicle;";
                position = [0, 0, 0];
            };
        };
    };
};
*/
