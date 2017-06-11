
params [
	["_target", objNull, [objNull]]
];

try
{
	if !([player, _target, []] call ace_common_fnc_canInteractWith) throw false;
	if !(_target getVariable ["ace_dragging_canDrag", false]) throw false;
	if (isNull _target) throw false;
	if !(alive _target) throw false;
	if !(_target getVariable ["lilc_isDead", false]) throw false;

	throw true;
}
catch
{
	_exception;
};
