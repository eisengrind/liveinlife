
if (!isNil "player_tagsIndex") then { call lilc_tags_fnc_disableTags; };
lilc_settings_tagsEnabled = true;
player_tagsIndex = ["lilc_playerTags","onEachFrame","lilc_tags_fnc_onEachFrame"] call BIS_fnc_addStackedEventHandler;

if (dialog) then { call lilc_settings_fnc_updateMenu; };
