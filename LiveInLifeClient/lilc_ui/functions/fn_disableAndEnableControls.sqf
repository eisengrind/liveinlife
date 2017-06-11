
params [
	["_neededIDCs", [], [[], 0]],
	["_allIDCs", [], [[], 0]]
];

try
{
	if (_neededIDCs isEqualType 0) then
	{
		_neededIDCs = [_neededIDCs];
	};

	if (_allIDCs isEqualType 0) then
	{
		_allIDCs = [_allIDCs];
	};

	if ((count _neededIDCs) <= 0) throw false;
	if ((count _allIDCs) <= 0) throw false;

	{
		if (_x in _neededIDCs) then
		{
			ctrlShow [_x, true];
		}
		else
		{
			ctrlShow [_x, false];
		};
	} forEach _allIDCs;

	throw true;
}
catch
{
	_exception;
};
