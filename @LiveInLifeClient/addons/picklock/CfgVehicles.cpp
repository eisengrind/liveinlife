
class Air;
class Plane : Air {
    class ACE_Actions {
        class ACE_MainActions {
            class lilca_picklock_doPickLockEngineIgnition {
                displayName = "Picklock Engine";
                condition = "([_target] call lilc_picklock_fnc_canPickLockEngineIgnition)";
                statement = "[_target, [10, 20, 30], 0.8] call lilc_picklock_fnc_doPickLockEngineIgnition";
            };

            class lilca_picklock {
                displayName = "$STR_lilc_actions_ActionTitle_picklock";
                condition = "true;";
                statement = "false;";
                
                class lilca_picklock_picklock {
                    displayName = "Picklock";
                    condition = "([_target, 'lilci_picklock_F'] call lilc_picklock_fnc_canPickLockVehicle)";
                    statement = "[_target, 'lilci_picklock_F', [7, 20, 40], 0.6] call lilc_picklock_fnc_doPickLockVehicle;";
                };

                class lilca_picklock_paperclip {
                    displayName = "Paperclip";
                    condition = "([_target, 'lilci_paperclip_F'] call lilc_picklock_fnc_canPickLockVehicle)";
                    statement = "[_target, 'lilci_paperclip_F', [5, 10, 40], 0.02] call lilc_picklock_fnc_doPickLockVehicle;";
                };
            };
        };
    };
};

class Helicopter : Air {
    class ACE_Actions {
        class ACE_MainActions {
            class lilca_picklock_doPickLockEngineIgnition {
                displayName = "Picklock Engine";
                condition = "([_target] call lilc_picklock_fnc_canPickLockEngineIgnition)";
                statement = "[_target, [7, 15, 20], 0.6] call lilc_picklock_fnc_doPickLockEngineIgnition";
            };

            class lilca_picklock {
                displayName = "$STR_lilc_actions_ActionTitle_picklock";
                condition = "true;";
                statement = "false;";
                
                class lilca_picklock_picklock {
                    displayName = "Picklock";
                    condition = "([_target, 'lilci_picklock_F'] call lilc_picklock_fnc_canPickLockVehicle)";
                    statement = "[_target, 'lilci_picklock_F', [7, 20, 40], 0.6] call lilc_picklock_fnc_doPickLockVehicle;";
                };

                class lilca_picklock_paperclip {
                    displayName = "Paperclip";
                    condition = "([_target, 'lilci_paperclip_F'] call lilc_picklock_fnc_canPickLockVehicle)";
                    statement = "[_target, 'lilci_paperclip_F', [5, 10, 40], 0.02] call lilc_picklock_fnc_doPickLockVehicle;";
                };
            };
        };
    };
};

class LandVehicle;
class Car : LandVehicle {
    class ACE_Actions {
        class ACE_MainActions {
            class lilca_picklock_doPickLockEngineIgnition {
                displayName = "Picklock Engine";
                condition = "([_target] call lilc_picklock_fnc_canPickLockEngineIgnition)";
                statement = "[_target, [3, 10, 15], 0.7] call lilc_picklock_fnc_doPickLockEngineIgnition";
            };

            class lilca_picklock_attachSteeringWheel {
                displayName = "Attach steering wheel lock";
                condition = "([_target] call lilc_picklock_fnc_canAttachSteeringWheelLock)";
                statement = "[_target] call lilc_picklock_fnc_doAttachSteeringWheelLock;";
            };

            class lilca_picklock_detachSteeringWheel {
                displayName = "Detach steering wheel lock";
                condition = "([_target] call lilc_picklock_fnc_canDetachSteeringWheelLock)";
                statement = "[_target] call lilc_picklock_fnc_doDetachSteeringWheelLock;";
            };

            class lilca_picklock_doPickLockSteeringWheelLock {
                displayName = "Picklock steering wheel lock";
                condition = "([_target] call lilc_picklock_fnc_canPickLockSteeringWheelLock)";
                statement = "[_target] call lilc_picklock_fnc_doPickLockSteeringWheelLock;";
            };

            class lilca_picklock {
                displayName = "$STR_lilc_actions_ActionTitle_picklock";
                condition = "true;";
                statement = "false;";
                
                class lilca_picklock_picklock {
                    displayName = "Picklock";
                    condition = "([_target, 'lilci_picklock_F'] call lilc_picklock_fnc_canPickLockVehicle)";
                    statement = "[_target, 'lilci_picklock_F', [7, 20, 40], 0.6] call lilc_picklock_fnc_doPickLockVehicle;";
                };

                class lilca_picklock_paperclip {
                    displayName = "Paperclip";
                    condition = "([_target, 'lilci_paperclip_F'] call lilc_picklock_fnc_canPickLockVehicle)";
                    statement = "[_target, 'lilci_paperclip_F', [5, 10, 40], 0.02] call lilc_picklock_fnc_doPickLockVehicle;";
                };
            };
        };
    };
};

class Ship;
class Ship_F : Ship {
    class ACE_Actions {
        class ACE_MainActions {
            class lilca_picklock_doPickLockEngineIgnition {
                displayName = "Picklock Engine";
                condition = "([_target] call lilc_picklock_fnc_canPickLockEngineIgnition)";
                statement = "[_target, [3, 10, 15], 0.9] call lilc_picklock_fnc_doPickLockEngineIgnition";
            };

            class lilca_picklock {
                displayName = "$STR_lilc_actions_ActionTitle_picklock";
                condition = "true;";
                statement = "false;";
                
                class lilca_picklock_picklock {
                    displayName = "Picklock";
                    condition = "([_target, 'lilci_picklock_F'] call lilc_picklock_fnc_canPickLockVehicle)";
                    statement = "[_target, 'lilci_picklock_F', [7, 20, 40], 0.6] call lilc_picklock_fnc_doPickLockVehicle;";
                };

                class lilca_picklock_paperclip {
                    displayName = "Paperclip";
                    condition = "([_target, 'lilci_paperclip_F'] call lilc_picklock_fnc_canPickLockVehicle)";
                    statement = "[_target, 'lilci_paperclip_F', [5, 10, 40], 0.02] call lilc_picklock_fnc_doPickLockVehicle;";
                };
            };
        };
    };
};
