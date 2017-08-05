
if (isNil "lilc_ui_disableUserInput_KeyDown_index") then { lilc_ui_disableUserInput_KeyDown_index = -1; };
if (isNil "lilc_ui_disableUserInput_MouseButtonDown_index") then { lilc_ui_disableUserInput_MouseButtonDown_index = -1; };
if (lilc_ui_disableUserInput_KeyDown_index > -1) exitWith {};
if (lilc_ui_disableUserInput_MouseButtonDown_index > -1) exitWith {};
lilc_ui_disableUserInput_KeyDown_index = (findDisplay 46) displayAddEventHandler ["KeyDown", {
    if ((_this select 1) in actionKeys "IngamePause") then { false; } else { true; };
}];

lilc_ui_disableUserInput_MouseButtonDown_index = (findDisplay 46) displayAddEventHandler ["MouseButtonDown", {
    true;
}];

call lilc_ui_fnc_disableActions;
