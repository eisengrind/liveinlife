
lils_login_set_defPackages = [
    "set_lil_login_id",
    "set_lil_login_thirst",
    "set_lil_login_hunger",
    "set_lil_login_cash",
    "set_lil_login_endurance",
    "set_lil_login_lastPosition",
    "set_lil_login_identity",
    "set_lil_login_charisma",
    "set_lil_login_status",
    "set_lil_respawn_deathTimeout",
    "set_lil_login_statusTimeout",
    "set_lil_login_damage",
    /*"set_lil_bank_accounts",*/
    "set_lil_virtualInventory_inventory",
    "set_lil_perms_perms",
    "set_lil_inventory_inventory",
    /*"set_lil_locker_lockers",*/
    "set_lil_factions_faction",
    "set_lil_respawn_isNew",
    "set_lil_paycheck",
    "set_lil_prison_cPment",
    "set_lil_prison_escapeTime",
    "set_lil_prison_waitingTime"
];

[
    "set_lil_login_id",
    {
        _dbCol = [
            "ID",
            true,
            false,
            {
                params [
                    ["_unit", objNull, [objNull]],
                    ["_value", 0, [0]]
                ];

                _unit setVariable ["lilc_accountID", _value, true];
            }
        ];
    }
] call lils_login_fnc_addPackage;

[
    "set_lil_login_thirst",
    {
        _dbCol = ["THIRST", true, false];
    }
] call lils_login_fnc_addPackage;

[
    "set_lil_login_hunger",
    {
        _dbCol = ["HUNGER", true, false];
    }
] call lils_login_fnc_addPackage;

[
    "set_lil_login_cash",
    {
        _dbCol = ["CASH", true, false];
    }
] call lils_login_fnc_addPackage;

[
    "set_lil_login_endurance",
    {
        _dbCol = ["ENDURANCE", true, false];
    }
] call lils_login_fnc_addPackage;

[
    "set_lil_login_lastPosition",
    {
        _dbCol = ["LASTPOSITION", true, true];
    }
] call lils_login_fnc_addPackage;

[
    "set_lil_login_identity",
    {
        _dbCol = [["GENDER", true, false], ["FIRSTNAME", true, false], ["LASTNAME", true, false]];
    }
] call lils_login_fnc_addPackage;

[
    "set_lil_login_charisma",
    {
        _dbCol = ["CHARISMA", true, false];
    }
] call lils_login_fnc_addPackage;

[
    "set_lil_login_status",
    {
        _dbCol = ["STATUS", true, false];
    }
] call lils_login_fnc_addPackage;

[
    "set_lil_respawn_deathTimeout",
    {
        _dbCol = ["DEATHTIMEOUT", true, false];
    }
] call lils_login_fnc_addPackage;

[
    "set_lil_login_statusTimeout",
    {
        _dbCol = ["STATUSTIMEOUT", true, false];
    }
] call lils_login_fnc_addPackage;

[
    "set_lil_login_damage",
    {
        _dbCol = ["health", true, true];
    }
] call lils_login_fnc_addPackage;

[
    "set_lil_respawn_isNew",
    {
        _dbCol = ["NEW", true, false];
    }
] call lils_login_fnc_addPackage;

[
    "set_lil_prison_waitingTime",
    {
        _dbCol = ["prison_waitingTime", true, false];
    }
] call lilc_login_fnc_addPackage;

[
    "set_lil_prison_escapeTime",
    {
        _dbCol = ["prison_escapeTime", true, false];
    }
] call lilc_login_fnc_addPackage;

[
    "set_lil_prison_cPment",
    {
        _dbCol = ["prison_currentPunishment", true, false];
    }
] call lilc_login_fnc_addPackage;


/*********
SET END / UDPATE START
*********/

[
    "update_lil_respawn_isNew",
    {
        ["NEW", (_this select 1)];
    }
] call lils_login_fnc_addPackage;

[
    "update_lil_login_thirst",
    {
        ["THIRST", (_this select 1)];
    }
] call lils_login_fnc_addPackage;

[
    "update_lil_login_hunger",
    {
        ["HUNGER", (_this select 1)];
    }
] call lils_login_fnc_addPackage;

[
    "update_lil_login_cash",
    {
        ["CASH", (_this select 1)];
    }
] call lils_login_fnc_addPackage;

[
    "update_lil_login_endurance",
    {
        ["ENDURANCE", (_this select 1)];
    }
] call lils_login_fnc_addPackage;

[
    "update_lil_inventory_gear",
    {
        ["GEAR", ([(_this select 1)] call lils_common_fnc_arrayEncode)];
    }
] call lils_login_fnc_addPackage;

[
    "update_lil_login_lastPosition",
    {
        ["LASTPOSITION", ([(_this select 1)] call lils_common_fnc_arrayEncode)];
    }
] call lils_login_fnc_addPackage;

[
    "update_lil_login_charisma",
    {
        ["CHARISMA", (_this select 1)];
    }
] call lils_login_fnc_addPackage;

[
    "update_lil_login_status",
    {
        ["STATUS", (_this select 1)];
    }
] call lils_login_fnc_addPackage;

[
    "update_lil_login_statusTimeout",
    {
        ["STATUSTIMEOUT", (_this select 1)];
    }
] call lils_login_fnc_addPackage;

[
    "update_lil_perms_perms",
    {
        ["PERMISSIONS", ([(_this select 1)] call lils_common_fnc_arrayEncode)];
    }
] call lils_login_fnc_addPackage;

[
    "update_lil_respawn_respawning",
    {
        ["RESPAWNING", (_this select 1)];
    }
] call lils_login_fnc_addPackage;

[
    "update_lil_respawn_currentTimeout",
    {
        ["DEATHTIMEOUT", (_this select 1)];
    }
] call lils_login_fnc_addPackage;

[
    "update_lil_prison_waitingTime",
    {
        ["prison_waitingTime", (_this select 1)];
    }
] call lils_login_fnc_addPackage;

[
    "update_lil_prison_escapeTime",
    {
        ["prison_escapeTime", (_this select 1)];
    }
] call lils_login_fnc_addPackage;

[
    "update_lil_prison_currentPMent",
    {
        ["prison_currentPunishment", str (_this select 1)];
    }
] call lils_login_fnc_addPackage;

addMissionEventHandler ["HandleDisconnect", lils_login_fnc_handleDisconnect];
