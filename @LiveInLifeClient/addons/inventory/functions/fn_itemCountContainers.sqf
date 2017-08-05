
params [
	["_unit", objNull, [objNull]],
	["_classname", "", [""]]
];

try
{
	throw ({ (_classname == _x) } count ([_unit, false] call lilc_inventory_fnc_getAllUnitItems));
}
catch
{
	_exception;
};
