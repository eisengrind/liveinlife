params [
	["_positionName", "", [""]],
	["_defaultDisplayName", "", [""]]
];

try
{
	if (_positionName == "") throw _defaultDisplayName;

	private _logic = objNull;
	{
		if ((_x getVariable ["positionName", ""]) == _positionName) exitWith
		{
			_logic = _x;
		};
	} forEach entities "Logic";

	if (isNull _logic) throw _defaultDisplayName;

	throw ([(format["STR_PositionTitles_%1", _positionName])] call lilc_common_fnc_localize);
}
catch
{
	_exception;
};
