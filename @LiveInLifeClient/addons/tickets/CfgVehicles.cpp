
class Man;
class CAManBase : Man {
    class ACE_Actions {
        class ACE_MainActions {
            class lilc_tickets_createTicket {
                displayName = "$STR_lilc_tickets_Config_CreateTicket";
                condition = "[_target] call lilc_tickets_fnc_canCreateTicket";
                statement = "[_target] call lilc_tickets_fnc_createTicket;";
            };
        };
    };
};
