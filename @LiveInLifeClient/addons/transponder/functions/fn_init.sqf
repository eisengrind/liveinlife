
lilc_transponder_codes = [];
{
    private _code = getText(_x >> "code");
    private _factions = getArray(_x >> "factions");
    if (!(_code in lilc_transponder_codes) && ((count _code) == 4) && ((lilc_player_faction select 0) in _factions || (count _factions) <= 0)) then {
        lilc_transponder_codes pushBack _code;
    };
} forEach (("true" configClasses (missionConfigFile >> "CfgTransponderCodes")) + ("true" configClasses (configFile >> "CfgTransponderCodes")) + ("true" configClasses (campaignConfigFile >> "CfgTransponderCodes")));
