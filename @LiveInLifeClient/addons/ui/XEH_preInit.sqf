#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

lilc_ui_hudRefresh_handle = nil;
lilc_ui_hudCurrentHealth = 0;
lilc_ui_hudCurrentCash = 0;
lilc_ui_hudCurrentHunger = 0;
lilc_ui_hudCurrentThirst = 0;
lilc_ui_hudTransparency = 1;
lilc_ui_disableUserInput_KeyDown_index = -1;
lilc_action_active = false;
lilc_action_interrupted = false;
lilc_ui_hint_lastControls = [];

ADDON = true;
