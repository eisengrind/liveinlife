
params [
	["_position", objNull, [[], objNull]]
];

if (_position isEqualType objNull) then
{
	_position = (getPosASL _position);
};
if ((count _position) != 3) exitWith { 0; };

private _h = ((_position select 2) + 4);

((lilc_meteorology_dTemp - (_h * 0.00976)) max 0);
