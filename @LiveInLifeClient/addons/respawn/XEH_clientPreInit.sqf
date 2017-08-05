
lilc_respawn_timeout = (10 * 60);
lilc_respawn_currentTimeout = 0;
lilc_respawn_isRespawning = false;
lilc_respawn_isRespawn = false;
lilc_player_isRespawning = false;

[
	"set_lil_respawn_respawning",
	{
		lilc_player_isRespawning = ([_this] call lilc_common_fnc_toBool);
	}
] call lilc_login_fnc_addPackage;
