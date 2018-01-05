
//[<year>, <month / 12>, <day / ([<year>, <month>] call BIS_fnc_monthDays)>, <hour / 24>, <minute / 60>, <second / 60>]

private _currentTime = lilc_time_currentTime;

if (((_currentTime select 5) + 1) > 59) then
{
	if (((_currentTime select 4) + 1) > 59) then
	{
		if (((_currentTime select 3) + 1) > 23) then
		{
			if (((_currentTime select 2) + 1) > ([(_currentTime select 0), (_currentTime select 1)] call BIS_fnc_monthDays)) then
			{
				if (((_currentTime select 1) + 1) > 12) then
				{
					lilc_time_currentTime set [0, ((_currentTime select 0) + 1)];
					lilc_time_currentTime set [1, 1];
					lilc_time_currentTime set [2, 1];
					lilc_time_currentTime set [3, 0];
					lilc_time_currentTime set [4, 0];
					lilc_time_currentTime set [5, 0];
				}
				else
				{
					lilc_time_currentTime set [1, ((_currentTime select 1) + 1)];
					lilc_time_currentTime set [2, 1];
					lilc_time_currentTime set [3, 0];
					lilc_time_currentTime set [4, 0];
					lilc_time_currentTime set [5, 0];
				};
			}
			else
			{
				lilc_time_currentTime set [2, ((_currentTime select 2) + 1)];
				lilc_time_currentTime set [3, 0];
				lilc_time_currentTime set [4, 0];
				lilc_time_currentTime set [5, 0];
			};
		}
		else
		{
			lilc_time_currentTime set [3, ((_currentTime select 3) + 1)];
			lilc_time_currentTime set [4, 0];
			lilc_time_currentTime set [5, 0];
		};
	}
	else
	{
		lilc_time_currentTime set [4, ((_currentTime select 4) + 1)];
		lilc_time_currentTime set [5, 0];
	};
}
else
{
	lilc_time_currentTime set [5, ((_currentTime select 5) + 1)];
};
