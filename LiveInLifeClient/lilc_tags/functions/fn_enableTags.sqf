
if (!isNil "lilc_player_tagsIndex") then
{
	call lilc_tags_fnc_disableTags;
};

lilc_settings_tagsEnabled = true;
["lilc_playerTags", "lilc_playerTags", 0, true] call lilc_ui_fnc_fadeInTitles;
lilc_player_tagsIndex = ["lilc_playerTags", "onEachFrame", "lilc_tags_fnc_onEachFrame"] call BIS_fnc_addStackedEventHandler;
