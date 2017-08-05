
disableSerialization;
params [
    ["_victim", ObjNull, [ObjNull]],
    ["_killer", ObjNull, [ObjNull]]
];

//lilc_respawn_isRespawning -> lilc_respawn_isRespawning != lilc_respawn_isRespawn...
lilc_player_corpse = _victim;
if (isNil "lilc_respawn_isRespawn") then
{
    lilc_respawn_isRespawn = false;
};

try {
    if (isNull _victim) throw false;
    //if !(isPlayer _victim) throw false;

    if (lilc_player_isRespawning) then
    {
        waitUntil
        {
            lilc_finished
        };

        [0.01] call lilc_ui_fnc_fadeInBlack;
        call lilc_ui_fnc_disableUserInput;
        call lilc_ui_fnc_disableHud;
        call lilc_tags_fnc_disableTags;
        call lilc_ui_fnc_disableHints;

        player allowDamage false;
        [200, "lilc_respawn", 1, false] call lilc_ui_fnc_fadeInTitles;

        private _ui = (uiNamespace getVariable ["lilc_respawn", displayNull]);
        if (isNull _ui) throw 0;
        private _uiTextTimer = (_ui displayCtrl 1041);
        
        private _time = time;
        [0.1] call lilc_ui_fnc_enableLoadingIcon;
        lilc_respawn_currentTimeout = lilc_player_deathTimeout;

        while
        {
            lilc_respawn_currentTimeout > 0
        }
        do
        {
            _uiTextTimer ctrlSetStructuredText parseText format [
                "<t font='PuristaMedium' align='center' size='2.5'>%1</t>",
                ([lilc_respawn_currentTimeout, "HH:MM:SS"] call BIS_fnc_secondsToString)
            ];

            lilc_respawn_currentTimeout = lilc_respawn_currentTimeout - 1;
            sleep 1;
        };

        [200, 1] call lilc_ui_fnc_fadeOutTitles;
        call lilc_factions_fnc_init;
        player setVariable ["lilc_isDead", false, true];
        player setVariable ["lilc_isStabilized", false, true];

        lilc_player_isRespawning = false;
        lilc_respawn_isRespawning = false;
        lilc_player_deathTimeout = 0;
        lilc_respawn_currentTimeout = 0;
        ["deathInfo"] call lilc_login_fnc_updatePlayerDataPartial;

        lilc_respawn_corpsePosition = lilc_player_lastPosition;
        if ((count lilc_respawn_corpsePosition) != 2) then
        {
            lilc_respawn_corpsePosition = ([player] call lilc_common_fnc_getPosition);
        };

        [player, (call lilc_respawn_fnc_getRemotestSpawnPosition)] call lilc_common_fnc_setPosition;
        [player, ""] call lilc_common_fnc_switchMove;

        call lilc_ui_fnc_enableUserInput;
        call lilc_ui_fnc_enableHud;
        call lilc_tags_fnc_enableTags;
        call lilc_ui_fnc_enableHints;

        player allowDamage true;

        call lilc_ui_fnc_disableLoadingIcon;
        [2] call lilc_ui_fnc_fadeOutBlack;
    }
    else
    {
        if (lilc_respawn_isRespawn) then
        {
            closeDialog 0;
            waitUntil
            {
                alive player
            };

            call lilc_factions_fnc_init;
            player setVariable ["lilc_isDead", false, true];
            player setVariable ["lilc_isStabilized", false, true];
            private _position = (call lilc_respawn_fnc_getRemotestSpawnPosition);
            [player, _position] call lilc_common_fnc_setPosition;
            [player, ""] call lilc_common_fnc_switchMove;
            
            if !(isNil "lilc_medical_onDeadUnitGetInVehicleIndex") then
            {
                player removeEventHandler ["GetIn", lilc_medical_onDeadUnitGetInVehicleIndex];
            };

            if !(isNil "lilc_medical_onDeadUnitGetOutVehicleIndex") then
            {
                player removeEventHandler ["GetOut", lilc_medical_onDeadUnitGetOutVehicleIndex];
            };

            call lilc_ui_fnc_enableUserInput;
            call lilc_ui_fnc_enableHud;

            private _factionID = (player getVariable ["lilc_factionID", -1]);
            private _respawnInit = "";

            /* Everybody's init */
            //Trigger Eventhandler
            //["lilc_respawn_respawned_init"] call lilc_events_fnc_executeEventHandler;

            [2] call lilc_ui_fnc_fadeOutBlack;
            player allowDamage true;
            sleep 2;

            lilc_respawn_isRespawn = false;
        }
        else
        {
            if (!lilc_respawn_isRespawning || isNil "lilc_respawn_isRespawning") then
            {
                lilc_respawn_isRespawning = true;
            };

            [0.5] call lilc_ui_fnc_fadeInBlack;
            call lilc_ui_fnc_disableUserInput;
            waitUntil { alive player };

            lilc_player_hunger = 100;
            lilc_player_thirst = 100;

            lilc_respawn_corpsePosition = ([lilc_player_corpse] call lilc_common_fnc_getPosition);

            player setVariable ["lilc_isDead", true, true];
            player setVariable ["lilc_isStabilized", false, true];

            if !(isNil "lilc_medical_onDeadUnitGetInVehicleIndex") then
            {
                player removeEventHandler ["GetInMan", lilc_medical_onDeadUnitGetInVehicleIndex];
            };

            if !(isNil "lilc_medical_onDeadUnitGetOutVehicleIndex") then
            {
                player removeEventHandler ["GetOutMan", lilc_medical_onDeadUnitGetOutVehicleIndex];
            };

            lilc_medical_onDeadUnitGetInVehicleIndex = player addEventHandler ["GetInMan", { _this call lilc_medical_fnc_onDeadUnitGetInVehicle; }];
            lilc_medical_onDeadUnitGetOutVehicleIndex = player addEventHandler ["GetOutMan", { _this call lilc_medical_fnc_onDeadUnitGetOutVehicle; }];

            player allowDamage false;
            player hideObjectGlobal true;
            sleep 0.5;

            call lilc_ui_fnc_disableHud;

            if (dialog) then
            {
                closeDialog 0;
            };

            player switchCamera "INTERNAL";
            [player, ([lilc_player_corpse] call lilc_inventory_fnc_getInventory)] call lilc_inventory_fnc_setInventory;
            [player, "lilcas_AinjPpneMstpSnonWrflDnon"] call lilc_common_fnc_switchMove;
            [player, ([lilc_player_corpse] call lilc_common_fnc_getPosition)] call lilc_common_fnc_setPosition;
            player hideObjectGlobal false;
            deleteVehicle lilc_player_corpse;

            /* Sets the Cameraview to grey and chromy :) */
            private _ppEffectChromeAberration = ppEffectCreate ["ChromAberration", 1000];
            _ppEffectChromeAberration ppEffectEnable true;
            _ppEffectChromeAberration ppEffectAdjust [0.02, 0.02, true];
            _ppEffectChromeAberration ppEffectCommit 0;
            waitUntil
            {
                ppEffectCommitted _ppEffectChromeAberration
            };

            private _ppEffectColorCorrections = ppEffectCreate ["ColorCorrections", 1200];
            _ppEffectColorCorrections ppEffectEnable true;
            _ppEffectColorCorrections ppEffectAdjust [1, 0.4, 0, 0, 0, 0, 0, 1, 1, 1, 0.2, 1, 1, 1, 0];
            _ppEffectColorCorrections ppEffectCommit 0;
            waitUntil
            {
                ppEffectCommitted _ppEffectColorCorrections
            };
            /* ---------------------------------- */

            try
            {
                [200, "lilc_respawn", 1, false] call lilc_ui_fnc_fadeInTitles;
                
                if (isNil "lilc_respawn_timeout") then
                {
                    lilc_respawn_timeout = (10 * 60);
                };

                lilc_respawn_currentTimeout = lilc_respawn_timeout;

                private _ui = (uiNamespace getVariable ["lilc_respawn", displayNull]);
                if (isNull _ui) throw 0;
                private _uiTextTimer = (_ui displayCtrl 1041);
                private _time = time;
                [1] call lilc_ui_fnc_fadeOutBlack;

                while
                {
                    ((_time + lilc_respawn_currentTimeout) >= time) &&
                    lilc_respawn_isRespawning &&
                    (player getVariable ["lilc_isDead", false])
                }
                do
                {
                    _uiTextTimer ctrlSetStructuredText parseText format["<t font='PuristaMedium' align='center' size='2.5'>%1</t>", ([(lilc_respawn_currentTimeout - (time - _time)), "HH:MM:SS"] call BIS_fnc_secondsToString)];
                    sleep 1;
                };
                
                [1] call lilc_ui_fnc_fadeInBlack;
                [200, 1] call lilc_ui_fnc_fadeOutTitles;
                sleep 1;

                if ((_time + lilc_respawn_currentTimeout) < time) throw 2;
                if (!(player getVariable ["lilc_isDead", false]) && !lilc_respawn_isRespawning) throw 1;
                if (((_time + lilc_respawn_currentTimeout) >= time) && !lilc_respawn_isRespawning) throw 3;
                throw 0;
            }
            catch
            {
                /* 0 = error, 1 = respawned by suicide, 2 = respawned by timeout, 3 = revived */
                            
                _ppEffectChromeAberration ppEffectEnable false;
                _ppEffectColorCorrections ppEffectEnable false;
                ppEffectDestroy _ppEffectChromeAberration;
                ppEffectDestroy _ppEffectColorCorrections;

                switch (_exception) do
                {
                    case 0;
                    case 1;
                    case 2:
                    {
                        lilc_respawn_isRespawn = true;
                        player setDamage 1;

                        if !(isNil "lilc_medical_onDeadUnitGetInVehicleIndex") then
                        {
                            player removeEventHandler ["GetInMan", lilc_medical_onDeadUnitGetInVehicleIndex];
                        };

                        if !(isNil "lilc_medical_onDeadUnitGetOutVehicleIndex") then
                        {
                            player removeEventHandler ["GetOutMan", lilc_medical_onDeadUnitGetOutVehicleIndex];
                        };
                        
                        throw true;
                    };

                    case 3:
                    {
                        player setVariable ["lilc_isDead", false, true];
                        lilc_respawn_isRespawning = false;
                        lilc_respawn_isRespawn = false;

                        lilc_player_hunger = 100;
                        lilc_player_thirst = 100;

                        if !(isNil "lilc_medical_onDeadUnitGetInVehicleIndex") then
                        {
                            player removeEventHandler ["GetInMan", lilc_medical_onDeadUnitGetInVehicleIndex];
                        };

                        if !(isNil "lilc_medical_onDeadUnitGetOutVehicleIndex") then
                        {
                            player removeEventHandler ["GetOutMan", lilc_medical_onDeadUnitGetOutVehicleIndex];
                        };

                        call lilc_ui_fnc_enableUserInput;
                        call lilc_ui_fnc_enableHud;
                        [player, ""] call lilc_common_fnc_switchMove;
                        [2] call lilc_ui_fnc_fadeOutBlack;
                        player allowDamage true;

                        sleep 2;
                        throw true;
                    };
                };
            };

            lilc_respawn_isRespawning = false;
            throw true;
        };
    };
}
catch
{
    _exception;
};
