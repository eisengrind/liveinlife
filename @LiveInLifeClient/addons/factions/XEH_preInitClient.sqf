
[
	"lilce_login_postAccountInit",
	{
		call lilc_common_fnc_setObjectLocks;
	}
] call CBA_fnc_addEventHandler;

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

[
	"set_lil_factions_faction",
	{
		private _fCfg = ([_this] call lilc_common_fnc_getFactionConfig);
		lilc_player_faction = [
			_this,
			(_fCfg select 0),
			(_fCfg select 4)
		];
	}
] call lilc_login_fnc_addPackage;
