
if (call lilc_factions_fnc_add) then
{
    _groupID = (lilc_player_faction select 0);
    _groupName = (lilc_player_faction select 1);
    _groupConfig = ([_groupID] call lilc_factions_fnc_getFactionConfig);
    lilc_respawn_respawns = getArray(_groupConfig >> "respawn");

    private _scriptPath = getText(_groupConfig >> "init");

    if (_scriptPath != "") then
    {
        call compile preProcessFileLineNumbers _scriptPath;
    };
}
else
{
    lilc_respawn_respawns = (["respawn_civilian", "ARRAY", []] call lilc_common_fnc_getSetting);
};
