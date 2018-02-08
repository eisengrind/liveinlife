
class LandVehicle;
class Car: LandVehicle {
    class ACE_Actions {
        class ACE_MainActions {
            class lilc_vehicles_getInformation {
                displayName = "Fahrzeuginformationen";
                condition = "[_target] call lilc_vehicles_fnc_canShowVehicleInformation";
                statement = "[_target] call lilc_vehicles_fnc_doShowVehicleInformation;";
            };
        };
    };
};


class Air;
class Plane: Air {
    class ACE_Actions {
        class ACE_MainActions {
            class lilc_vehicles_getInformation {
                displayName = "Fahrzeuginformationen";
                condition = "[_target] call lilc_vehicles_fnc_canShowVehicleInformation";
                statement = "[_target] call lilc_vehicles_fnc_doShowVehicleInformation;";
            };
        };
    };
};


class Ship;
class Ship_F: Ship {
    class ACE_Actions {
        class ACE_MainActions {
            class lilc_vehicles_getInformation {
                displayName = "Fahrzeuginformationen";
                condition = "[_target] call lilc_vehicles_fnc_canShowVehicleInformation";
                statement = "[_target] call lilc_vehicles_fnc_doShowVehicleInformation;";
            };
        };
    };
};
