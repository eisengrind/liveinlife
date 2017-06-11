
params [
	["_positionName", "", [""]],
	["_wantedType", "ASL", [""]], //either it can be ASL, ATL, ASLW
	["_defaultPosition", [], [[]]]
];

try
{
	if (_positionName == "") throw _defaultPosition;

	//get the placed module
	private _logic = objNull;
	{
		if ((_x getVariable ["positionName", ""]) == _positionName) exitWith
		{
			_logic = _x;
		};
	} forEach entities "Logic";

	if (isNull _logic) throw _defaultPosition;

	private _position = [];
	switch _wantedType do
	{
		case "ASL":
		{
			_position = (getPosASL _logic);
		};

		case "ATL":
		{
			_position = (getPosATL _logic);
		};

		case "ASLW":
		{
			_position = (getPosASLW _logic);
		};
	};

	throw [_position, (direction _logic)];
}
catch
{
	_exception;
};
