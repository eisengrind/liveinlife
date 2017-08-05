
lilc_tags_maximumRadius = 6;
lilc_tags_maximumFadeRadius = 5.6;
lilc_tags_unknownHeadgears = [];
lilc_tags_defaultColor = [1, 1, 1, 0]; //rgba(0) color

[
	"lilce_common_postFinished",
	{
		lilc_factions_factions = [];
		{
			lilc_factions_factions pushBack [
				getNumber(_x >> "id"),
				getText(_x >> "title"),
				getText(_x >> "description"),
				getArray(_x >> "respawn"),
				getArray(_x >> "color"),
				(getArray(_x >> "color") call BIS_fnc_colorRGBAToHTML),
				(getNumber(_x >> "nameVisible")),
				getNumber(_x >> "markers"),
				getText(_x >> "markerColorUnit"),
				getText(_x >> "markerTypeUnit"),
				getText(_x >> "markerColorGroup"),
				getText(_x >> "markerTypeGroup"),
				getText(_x >> "markerColorGroupUnit"),
				getText(_x >> "markerTypeGroupUnit")
			];
			true;
		} count ("true" configClasses (missionConfigFile >> "CfgFactions"));

		call lilc_tags_fnc_enableTags;
	}
] call CBA_fnc_addEventHandler;

[
	"lilc_setting_tags_drawSoundwave",
	"CHECKBOX",
	"Tag Sprachanzeige", //TODO: localize
	"LiveInLife",
	true,
	0,
	{}
] call CBA_Settings_fnc_init;

[
	"lilc_setting_tags_scale",
	"LIST",
	"Tag Größe", //TODO: localize
	"LiveInLife",
	[
		[0.833, 0.666],
		["Groß", "Klein"],
		0
	],
	0,
	{}
] call CBA_Settings_fnc_init;

[
	"lilc_setting_tags_defaultAlpha",
	"LIST",
	"Tag Größe", //TODO: localize
	"LiveInLife",
	[
		[0.833, 0.666],
		["Groß", "Klein"],
		0
	],
	0,
	{}
] call CBA_Settings_fnc_init;
