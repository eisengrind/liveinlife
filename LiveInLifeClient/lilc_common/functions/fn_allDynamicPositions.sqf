
try
{
	_positions = [];
	{
		private _positionName = (_x getVariable ["positionName", ""]);
		if (_positionName != "") then
		{
			if !(_positionName in _positions) then
			{
				_positions pushBack _positionName;
			};
		};
	} forEach entities "Logic";

	throw _positions;
}
catch
{
	_exception;
};
