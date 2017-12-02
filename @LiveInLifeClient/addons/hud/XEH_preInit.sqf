
lilc_hud_infos = ([[], []] call CBA_fnc_hashCreate);

{
	private _stmt = (compile getText(_x >> "statement"));
	private _cond = (compile getText(_x >> "condition"));

	if (isNil "_cond") then
	{
		_cond = { true; };
	};

	if !(isNil "_stmt") then
	{
		lilc_hud_infos = ([lilc_hud_infos, (tolower (configName _x)), [_stmt, _cond]] call CBA_fnc_hashSet);
	};
} forEach ("true" configClasses (missionConfigFile >> "CfgHud"));

private _cfg = (configFile >> "RscTitles" >> "lilc_hud");
lilc_hud_borderHeight = ((getNumber(_cfg >> "controls" >> "TextInformation" >> "y")) - (getNumber(_cfg >> "controlsBackground" >> "PictureBackground" >> "y"))) * 2;
