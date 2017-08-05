
class Air;
class Plane : Air
{
    class ACE_Actions
    {
        class ACE_MainActions
        {
            class lilc_repair_repairVehicle
            {
                displayName = "Reparieren"; //TODO: Localize
                condition = "([_target] call lilc_repair_fnc_canRepairVehicleEasy)";
                statement = "[_target] spawn lilc_repair_fnc_doRepairVehicleEasy;";
            };
        };
    };
};

class Helicopter : Air
{
    class ACE_Actions
    {
        class ACE_MainActions
        {
            class lilc_repair_repairVehicle
            {
                displayName = "Reparieren";
                condition = "([_target] call lilc_repair_fnc_canRepairVehicleEasy)";
                statement = "[_target] spawn lilc_repair_fnc_doRepairVehicleEasy;";
            };
        };
    };
};

class LandVehicle;
class Car : LandVehicle
{
    class ACE_Actions
    {
        class ACE_MainActions
        {
            class lilc_repair_repairVehicle
            {
                displayName = "Reparieren";
                condition = "([_target] call lilc_repair_fnc_canRepairVehicleEasy)";
                statement = "[_target] spawn lilc_repair_fnc_doRepairVehicleEasy;";
            };
        };
    };
};

class Ship;
class Ship_F : Ship
{
    class ACE_Actions
    {
        class ACE_MainActions
        {
            class lilc_repair_repairVehicle
            {
                displayName = "Reparieren";
                condition = "([_target] call lilc_repair_fnc_canRepairVehicleEasy)";
                statement = "[_target] spawn lilc_repair_fnc_doRepairVehicleEasy;";
            };
        };
    };
};
