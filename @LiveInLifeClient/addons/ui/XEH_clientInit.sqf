#include "script_component.hpp"

["lilce_common_postFinished", {
    call lilc_ui_fnc_enableHints;
}] call CBA_fnc_addEventHandler;

["lilce_login_unload", {
        call lilc_ui_fnc_disableHints;
}] call CBA_fnc_addEventHandler;
