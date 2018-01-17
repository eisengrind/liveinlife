
class Man;
class CAManBase: Man {
    class ACE_Actions {
        class ACE_MainActions {
            class lilc_proofs_searchProofs {
                displayName = "Beweise suchen";
                condition = "([_target] call lilc_proofs_fnc_canSearchProofs);";
                statement = "[_target] spawn lilc_proofs_fnc_doSearchProofs;";
            };
        };
    };
};

class Air;
class Plane : Air {
    class ACE_Actions {
        class ACE_MainActions {
            class lilc_proofs_searchProofs {
                displayName = "Beweise suchen";
                condition = "([_target] call lilc_proofs_fnc_canSearchProofs);";
                statement = "[_target] spawn lilc_proofs_fnc_doSearchProofs;";
            };
        };
    };
};

class LandVehicle;
class Car: LandVehicle {
    class ACE_Actions {
        class ACE_MainActions {
            class lilc_proofs_searchProofs {
                displayName = "Beweise suchen";
                condition = "([_target] call lilc_proofs_fnc_canSearchProofs);";
                statement = "[_target] spawn lilc_proofs_fnc_doSearchProofs;";
            };
        };
    };
};

class Ship;
class Ship_F: Ship {
    class ACE_Actions {
        class ACE_MainActions {
            class lilc_proofs_searchProofs {
                displayName = "Beweise suchen";
                condition = "([_target] call lilc_proofs_fnc_canSearchProofs);";
                statement = "[_target] spawn lilc_proofs_fnc_doSearchProofs;";
            };
        };
    };
};
