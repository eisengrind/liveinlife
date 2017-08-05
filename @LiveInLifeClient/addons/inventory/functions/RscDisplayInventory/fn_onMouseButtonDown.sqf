
disableSerialization;
params [
	["_display", displayNull, [displayNull]],
	["_keyCode", 0, [0]]
];

try
{
	if (isNull _display) throw false;
	if (_keyCode == 0) throw false;

	call lilc_inventory_fnc_disableMenu;

	throw false;
}
catch
{
	_exception;
};
