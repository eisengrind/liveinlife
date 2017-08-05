
class Man;
class CAManBase : Man {
    class ACE_SelfActions {       
        /*class lilc_medical_detachDeadUnit {
            displayName = "$STR_lilc_medical_ActionTitle_detachDeadUnit";
            condition = "([lilc_medical_currentMovedDeadUnit] call lilc_medical_fnc_canDetachDeadUnit)";
            statement = "([lilc_medical_currentMovedDeadUnit] spawn lilc_medical_fnc_doDetachDeadUnit)";
        };*/
    };

    class ACE_Actions {
        class ACE_MainActions {
            class lilc_medical_reviveDeadUnit {
                displayName = "$STR_lilc_medical_ActionTitle_reviveDeadUnit";
                condition = "([_target] call lilc_medical_fnc_canReviveDeadUnit)";
                statement = "([_target] spawn lilc_medical_fnc_doReviveDeadUnit);";
            };

            class lilc_medical_stabilizeDeadUnit {
                displayName = "$STR_lilc_medical_ActionTitle_stabilizeDeadUnit";
                condition = "([_target] call lilc_medical_fnc_canStabilizeDeadUnit)";
                statement = "([_target] spawn lilc_medical_fnc_doStabilizeDeadUnit);";
            };

            /*class lilc_medical_moveDeadUnit {
                displayName = "$STR_lilc_medical_ActionTitle_moveDeadUnit";
                condition = "([_target] call lilc_medical_fnc_canMoveDeadUnit)";
                statement = "([_target] spawn lilc_medical_fnc_doMoveDeadUnit);";
            };*/

            class lilc_medical_carryDeadUnit
            {
                displayName = "$STR_ACE_Dragging_Carry";
                icon = "\z\ace\addons\dragging\UI\icons\person_carry.paa";
                condition = "([_target] call lilc_medical_fnc_canCarryDeadUnit)";
                statement = "([_target] call lilc_medical_fnc_doCarryDeadUnit);";
            };

            class lilc_medical_dragDeadUnit
            {
                displayName = "$STR_ACE_Dragging_Drag";
                icon = "\z\ace\addons\dragging\UI\icons\person_drag.paa";
                condition = "([_target] call lilc_medical_fnc_canDragDeadUnit)";
                statement = "([_target] call lilc_medical_fnc_doDragDeadUnit);";
            };

            class lilc_medical_moveInVehicleDeadUnit {
                displayName = "$STR_lilc_medical_ActionTitle_moveInVehicleDeadUnit";
                condition = "(call lilc_medical_fnc_canMoveInVehicleDeadUnit)";
                statement = "([] spawn lilc_medical_fnc_doMoveInVehicleDeadUnit);";
            };
        };
    };
};
