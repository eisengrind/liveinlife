
if (lilc_player_deathTimeout > 0 && lilc_player_isRespawning) then
{
    [player] spawn lilc_respawn_fnc_init;
}
else
{
    if (isNil "lilc_player_isNew") then
    {
        lilc_player_isNew = 0;
    };

    private _fID = (player getVariable ["lilc_factionID", -1]);
    if (_fID == -1) then
    {
        if (lilc_player_isNew == 1) then
        {
            [(["startBalance", "NUMBER"] call lilc_common_fnc_getSetting)] call lilc_cash_fnc_set;
            ["lilce_respawn_firstspawn", [player]] call CBA_fnc_localEvent;
            lilc_player_isNew = 0;
        }
        else
        {
            [player, lilc_player_lastPosition] call lilc_common_fnc_setPosition;
        };
    }
    else
    {
        private _fCfg = ([_fID] call lilc_factions_fnc_getFactionConfig);
        private _fRT = getNumber(_fCfg >> "respawnType"); //0, 1, 2
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
                ["mission ended because of a invalid player spawnpoint", "lilc_common", 1] call lilc_log_fnc_diag_log;
                endMission "END6";
            };
        };
    };
};
