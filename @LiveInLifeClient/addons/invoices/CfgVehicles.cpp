
class Man;
class CAManBase : Man {
    class ACE_Actions {
        class ACE_MainActions {
            class lilc_invoices_createTicket {
                displayName = "$STR_lilc_invoices_Config_CreateInvoice";
                condition = "[_target] call lilc_invoices_fnc_canCreateInvoice";
                statement = "[_target] call lilc_invoices_fnc_createInvoice;";
            };
        };
    };
};
