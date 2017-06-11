
lilc_prison_waitingTime = 0;
lilc_prison_escapeTime = 0;
lilc_prison_currentPunishment = "";

[
	"lilce_common_initPlayer_beforePreload",
	{
		private _factionID = (player getVariable ["lilc_factionID", -1]);
		if (_factionID < -1) then
		{
			if (lilc_prison_waitingTime > -3) then
			{
				[lilc_prison_currentPunishment, lilc_prison_waitingTime, lilc_prison_escapeTime] call lilc_prison_fnc_jailed;
			};
		};
	}
] call CBA_fnc_addEventHandler;
