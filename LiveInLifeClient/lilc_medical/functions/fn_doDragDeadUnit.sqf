
params [
	["_target", objNull, [objNull]]
];

try
{
	if !([_target] call lilc_medical_fnc_canDragDeadUnit) throw false;
	[player, _target] call ace_dragging_fnc_startDrag;

	throw true;
}
catch
{
	_exception;
};
