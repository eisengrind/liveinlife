
params [
	["_unit", objNull, [objNull]],
	["_typeName", "", [""]],
	["_data", nil]
];

try
{
	if !([_unit] call lilc_common_fnc_isAlive) throw false;
	if (_typeName == "") throw false;

	lils_exchange_queue pushBack [_unit, _typeName, _data];
}
catch
{
	_exception;
};
