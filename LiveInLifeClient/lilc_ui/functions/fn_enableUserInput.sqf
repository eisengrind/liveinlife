
(findDisplay 46) displayRemoveEventHandler ["KeyDown", lilc_ui_disableUserInput_KeyDown_index];
(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown", lilc_ui_disableUserInput_MouseButtonDown_index];
lilc_ui_disableUserInput_KeyDown_index = -1;
lilc_ui_disableUserInput_MouseButtonDown_index = -1;
call lilc_ui_fnc_enableActions;
