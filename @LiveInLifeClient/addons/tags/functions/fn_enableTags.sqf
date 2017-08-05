
if (!isNil "lilc_player_tagsIndex") then
{
	call lilc_tags_fnc_disableTags;
};

/*lilc_settings_tagsEnabled = true;
["lilc_playerTags", "lilc_playerTags", 0, true] call lilc_ui_fnc_fadeInTitles;*/
lilc_player_tagsIndex = (addMissionEventHandler [
	"Draw3D",
	{
		call lilc_tags_fnc_onDraw3D;
	}
]);
