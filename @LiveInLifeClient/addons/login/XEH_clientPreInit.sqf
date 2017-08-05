
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
		lilc_player_cash = _this;
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
	"set_lil_login_status",
	{
		lilc_player_status = _this;
	}
] call lilc_login_fnc_addPackage;

[
	"set_lil_respawn_deathTimeout",
	{
		lilc_player_deathTimeout = _this;
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
	"update_lil_bank_accounts",
	"update_lil_login_status",
	"update_lil_login_statusTimeout",
	"update_lil_perms_perms",
	"update_lil_respawn_statusTimeout",
	"update_lil_respawn_currentTimeout",
	"update_lil_prison_waitingTime",
	"update_lil_prison_escapeTime",
	"update_lil_prison_currentPMent"
];

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
		lilc_player_cash;
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
		([player] call lilc_common_fnc_getPosition);
	}
] call lilc_login_fnc_addPackage;

[
	"update_lil_login_charisma",
	{
		lilc_player_charisma;
	}
] call lilc_login_fnc_addPackage;

[
	"update_lil_bank_accounts",
	{
		lilc_bank_accounts;
	}
] call lilc_login_fnc_addPackage;

[
	"update_lil_login_status",
	{
		lilc_player_status;
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

[
	"update_lil_prison_waitingTime",
	{
		lilc_prison_waitingTime;
	}
] call lilc_login_fnc_addPackage;

[
	"update_lil_prison_escapeTime",
	{
		lilc_prison_escapeTime;
	}
] call lilc_login_fnc_addPackage;

[
	"update_lil_prison_currentPMent",
	{
		lilc_prison_currentPunishment;
	}
] call lilc_login_fnc_addPackage;
