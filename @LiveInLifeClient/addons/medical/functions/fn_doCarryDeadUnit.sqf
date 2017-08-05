
params [
	["_target", objNull, [objNull]]
];

try
{
	if !([_target] call lilc_medical_fnc_canCarryDeadUnit) throw false;
	[player, _target] call ace_dragging_fnc_startCarry;
	if !(isNull lilc_medical_waitUntilCarryFinished_handle) then
	{
		terminate lilc_medical_waitUntilCarryFinished_handle;
	};
	lilc_medical_waitUntilCarryFinished_handle = (_target spawn {
		waitUntil { !(isNull (attachedTo _this)) || (isNull _this) };
		if (isNull _this) exitWith {};
		waitUntil { (isNull (attachedTo _this)) || (isNull _this) };
		if (isNull _this) exitWith {};
    	[_this, "lilcas_AinjPpneMstpSnonWrflDnon"] call lilc_common_fnc_switchMove;
	});

	throw true;
}
catch
{
	_exception;
};
