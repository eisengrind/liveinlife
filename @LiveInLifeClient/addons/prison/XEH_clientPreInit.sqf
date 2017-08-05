
lilc_prison_waitingTime = 0;
lilc_prison_escapeTime = 0;
lilc_prison_currentPunishment = "";

[
	"lilce_common_preFinished",
	{
		private _factionID = (player getVariable ["lilc_factionID", -1]);
		if (_factionID < -1) then
		{
			if (lilc_prison_waitingTime > -3) then
			{
				[
					lilc_prison_currentPunishment,
					lilc_prison_waitingTime,
					lilc_prison_escapeTime
				] call lilc_prison_fnc_punished;
			};
		};
	}
] call CBA_fnc_addEventHandler;

[
	"set_lil_prison_waitingTime",
	{
		lilc_prison_waitingTime = _this;
	}
] call lilc_login_fnc_addPackage;

[
	"set_lil_prison_escapeTime",
	{
		lilc_prison_escapeTime = _this;
	}
] call lilc_login_fnc_addPackage;

[
	"set_lil_prison_cPment",
	{
		lilc_prison_currentPunishment = _this;
	}
] call lilc_login_fnc_addPackage;
