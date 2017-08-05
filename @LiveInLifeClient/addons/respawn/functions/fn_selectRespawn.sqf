
if (lilc_player_isRespawning) then
{
    [player, objNull] spawn lilc_respawn_fnc_init;
}
else
{
    if ((player getVariable ["lilc_factionID", -1]) == -1) then
    {
        if (lilc_player_isNew == 1) then
        {
            private _filePath = (["firstspawnInit", "STRING", ""] call lilc_common_fnc_getSetting);
            if (_filePath != "") then
            {
                call compile preprocessFileLineNumbers _filePath;
            };
            [""] call lilc_ui_fnc_setLoadingText;
            private _handle = [] spawn lilc_firstspawn_fnc_init;
            waitUntil
            {
                scriptDone _handle;
            };
            [0.1] call lilc_ui_fnc_enableLoadingIcon;

            [player, player] call ACE_medical_fnc_treatmentAdvanced_fullHealLocal;
            player setDamage 0;
        }
        else
        {
            [player, lilc_player_lastPosition] call lilc_common_fnc_setPosition;
        };
    }
    else
    {
        private _respawnSelection = (lilc_player_respawnName select 0);
        if (lilc_player_isNew == 1) then
        {
            [player, _respawnSelection] call lilc_common_fnc_setDynamicPosition;
        }
        else
        {
            if (_respawnSelection != "" || isNil "_respawnSelection" && ((count lilc_player_lastPosition) == 2)) then
            {
                [player, lilc_player_lastPosition] call lilc_common_fnc_setPosition;
            }
            else
            {
                ["mission ended because of a invalid player spawnpoint", "lilc_common", 1] call lilc_common_fnc_diag_log;
                endMission "END6";
            };
        };
    };
};
