
if (isNil "lilc_player_isRespawning") exitWith
{
    endMission "End4";
};

if (lilc_player_isRespawning) then
{
    [player, objNull] spawn lilc_respawn_fnc_init;
}
else
{
    private _fID = (player getVariable ["lilc_factionID", -1]);
    if (_fID == -1) then
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
        private _fCfg = ([_fID] call lilc_factions_fnc_getFactionConfig);
        private _fRT = getNumber(_fCfg >> "respawn_type"); //0, 1, 2
        private _pPos = (getPos vehicle player);

        switch (_fRT) do
        {
            case 0:
            { //furthest
                private _l = (lilc_respawn_respawns select 0);
                private _d = ((([_l] call lilc_common_fnc_getDynamicPosition) select 0) distance _pPos);

                {
                    private _tD = ((([_x] call lilc_common_fnc_getDynamicPosition) select 0) distance _pPos);
                    if (_tD < _d) then
                    {
                        _l = _x;
                        _d = _tD;
                    };
                } forEach lilc_respawn_respawns;

                [player, _l] call lilc_common_fnc_setDynamicPosition;
            };

            case 1:
            { //nearest
                private _l = (lilc_respawn_respawns select 0);
                private _d = ((([_l] call lilc_common_fnc_getDynamicPosition) select 0) distance _pPos);

                {
                    private _tD = ((([_x] call lilc_common_fnc_getDynamicPosition) select 0) distance _pPos);
                    if (_tD > _d) then
                    {
                        _l = _x;
                        _d = _tD;
                    };
                } forEach lilc_respawn_respawns;

                [player, _l] call lilc_common_fnc_setDynamicPosition;
            };
            
            case 2:
            { //last
                [player, lilc_player_lastPosition] call lilc_common_fnc_setPosition;
            };
            
            case 3:
            { //static
                [player, (lilc_respawn_respawns select 0)] call lilc_common_fnc_setDynamicPosition;
            };

            default
            {
                ["mission ended because of a invalid player spawnpoint", "lilc_common", 1] call lilc_common_fnc_diag_log;
                endMission "END6";
            };
        };
    };
};
