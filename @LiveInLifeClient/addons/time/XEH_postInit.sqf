
lilc_time_currentTime = missionStart;
if (lilc_time_currentTime isEqualTo [0, 0, 0, 0, 0, 0]) then
{
	[1970, 1, 1, 0, 0, 0];
};

[
	{
		call lilc_time_fnc_updateTime;


	},
	1
] call CBA_fnc_addPerFrameHandler;
