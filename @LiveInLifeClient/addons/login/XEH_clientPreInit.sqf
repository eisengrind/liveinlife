
lilc_player_isNew = -1;

[
    "set_lil_login_id",
    {
        lilc_player_ID = _this;
    }
] call lilc_login_fnc_addPackage;

[
    "set_lil_login_thirst",
    {
        lilc_player_thirst = _this;
    }
] call lilc_login_fnc_addPackage;

[
    "set_lil_login_hunger",
    {
        lilc_player_hunger = _this;
    }
] call lilc_login_fnc_addPackage;

[
    "set_lil_login_cash",
    {
        [_this] call lilc_cash_fnc_set;
    }
] call lilc_login_fnc_addPackage;

[
    "set_lil_login_endurance",
    {
        lilc_player_endurance = _this;
    }
] call lilc_login_fnc_addPackage;

[
    "set_lil_login_lastPosition",
    {
        lilc_player_lastPosition = _this;
    }
] call lilc_login_fnc_addPackage;

[
    "set_lil_login_identity",
    {
        //sex, first-, lastname
        lilc_player_sex = (_this select 0);
        player setVariable ["lilc_identity", [lilc_player_sex, (_this select 1), (_this select 2)], true];
    }
] call lilc_login_fnc_addPackage;

[
    "set_lil_login_charisma",
    {
        lilc_player_charisma = _this;
    }
] call lilc_login_fnc_addPackage;

[
    "set_lil_login_status", //this is the status of the unit, like beeing handcuffed, surrendering, etc.
    {
        private _status = _this;
        if (_status isEqualType 0) then {
            switch (_status) do {
                case 0: {};
                case 1: {
                    [player, true] call ace_captives_fnc_setSurrendered;
                };
                case 2: {
                    [player, true] call ace_captives_fnc_setHandcuffed;
                };
            };
        };
    }
] call lilc_login_fnc_addPackage;

[
    "set_lil_respawn_deathTimeout",
    {
        lilc_player_deathTimeout = _this;
        lilc_player_isRespawning = true;
    }
] call lilc_login_fnc_addPackage;

[
    "set_lil_login_statusTimeout",
    {
        lilc_player_statusTimeout = _this;
    }
] call lilc_login_fnc_addPackage;

[
    "set_lil_login_damage",
    {
        [player, _this] call lilc_common_fnc_setACEDamage;
    }
] call lilc_login_fnc_addPackage;

[
    "set_lil_respawn_isNew",
    {
        lilc_player_isNew = _this;
    }
] call lilc_login_fnc_addPackage;

/**********
SET END / UPDATE START
**********/

lilc_login_update_defPackages = [
    "update_lil_login_thirst",
    "update_lil_login_hunger",
    "update_lil_login_cash",
    "update_lil_login_endurance",
    "update_lil_inventory_gear",
    "update_lil_login_lastPosition",
    "update_lil_login_charisma",
    "update_lil_login_status",
    "update_lil_login_statusTimeout",
    "update_lil_perms_perms",
    "update_lil_respawn_statusTimeout",
    "update_lil_respawn_currentTimeout",
    "update_lil_paycheck_active",
    "update_lil_respawn_isNew",
    "update_lil_virtualInventory_inventory",
    "update_lil_respawn_deathTimeout"
];

[
    "update_lil_respawn_deathTimeout",
    {
        lilc_respawn_currentTimeout;
    }
] call lilc_login_fnc_addPackage;

[
    "update_lil_respawn_isNew",
    {
        lilc_player_isNew;
    }
] call lilc_login_fnc_addPackage;

[
    "update_lil_login_thirst",
    {
        lilc_player_thirst;
    }
] call lilc_login_fnc_addPackage;

[
    "update_lil_login_hunger",
    {
        lilc_player_hunger;
    }
] call lilc_login_fnc_addPackage;

[
    "update_lil_login_cash",
    {
        (player getVariable ['lilc_cash_balance', 0]);
    }
] call lilc_login_fnc_addPackage;

[
    "update_lil_login_endurance",
    {
        lilc_player_endurance;
    }
] call lilc_login_fnc_addPackage;

[
    "update_lil_inventory_gear",
    {
        ([player] call lilc_inventory_fnc_getInventory);
    }
] call lilc_login_fnc_addPackage;

[
    "update_lil_login_lastPosition",
    {
        private _pos = [player] call lilc_common_fnc_getPosition;
        if (player != vehicle player) then {
            _pos set [0, (_pos select 0) vectorAdd [2, 2, 0]];
        };
        _pos;
    }
] call lilc_login_fnc_addPackage;

[
    "update_lil_login_charisma",
    {
        lilc_player_charisma;
    }
] call lilc_login_fnc_addPackage;

[
    "update_lil_login_status",
    {
        (switch (true) do {
            case (player getVariable ["ace_captives_isSurrendering", false]): { 1; };
            case (player getVariable ["ace_captives_isHandcuffed", false]): { 2; };
            default { 0; };
        });
    }
] call lilc_login_fnc_addPackage;

[
    "update_lil_login_statusTimeout",
    {
        lilc_player_statusTimeout;
    }
] call lilc_login_fnc_addPackage;

[
    "update_lil_perms_perms",
    {
        lilc_permissions_permissions;
    }
] call lilc_login_fnc_addPackage;

[
    "update_lil_respawn_respawning",
    {
        (parseNumber lilc_respawn_isRespawning);
    }
] call lilc_login_fnc_addPackage;

[
    "update_lil_respawn_currentTimeout",
    {
        lilc_respawn_currentTimeout;
    }
] call lilc_login_fnc_addPackage;

lilc_login_createprofile = false;
