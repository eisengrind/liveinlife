
//[<second / 60>, <minute / 60>, <hour / 24>, <day / ([<year>, <month>] call BIS_fnc_monthDays)>, <month / 12>, <year>]

private _currentTime = lilc_time_currentTime;

if (((_currentTime select 0) + 1) > 59) then
{
	if (((_currentTime select 1) + 1) > 59) then
	{
		if (((_currentTime select 2) + 1) > 23) then
		{
			if (((_currentTime select 3) + 1) > ([(_currentTime select 5), (_currentTime select 4)] call BIS_fnc_monthDays)) then
			{
				if (((_currentTime select 4) + 1) > 12) then
				{
					lilc_time_currentTime set [5, ((_currentTime select 5) + 1)];
					lilc_time_currentTime set [4, 1];
					lilc_time_currentTime set [3, 1];
					lilc_time_currentTime set [2, 0];
					lilc_time_currentTime set [1, 0];
					lilc_time_currentTime set [0, 0];
				}
				else
				{
					lilc_time_currentTime set [4, ((_currentTime select 4) + 1)];
					lilc_time_currentTime set [3, 1];
					lilc_time_currentTime set [2, 0];
					lilc_time_currentTime set [1, 0];
					lilc_time_currentTime set [0, 0];
				};
			}
			else
			{
				lilc_time_currentTime set [3, ((_currentTime select 3) + 1)];
				lilc_time_currentTime set [2, 0];
				lilc_time_currentTime set [1, 0];
				lilc_time_currentTime set [0, 0];
			};
		}
		else
		{
			lilc_time_currentTime set [2, ((_currentTime select 2) + 1)];
			lilc_time_currentTime set [1, 0];
			lilc_time_currentTime set [0, 0];
		};
	}
	else
	{
		lilc_time_currentTime set [1, ((_currentTime select 1) + 1)];
		lilc_time_currentTime set [0, 0];
	};
}
else
{
	lilc_time_currentTime set [0, ((_currentTime select 0) + 1)];
};
