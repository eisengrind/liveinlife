
lilc_tags_visibleFactionNames = [];
{
    lilc_tags_visibleFactionNames pushBack [(getNumber(_x >> "id")), (getNumber(_x >> "nameVisible"))];
} forEach ("true" configClasses (missionConfigFile >> "CfgFactions"));

[100, "lilc_playerTags", 0.01, false] call lilc_ui_fnc_fadeInTitles;
call lilc_tags_fnc_enableTags;
