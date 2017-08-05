
params [
    ["_object", objNull, [objNull]],
    ["_positionName", "", [""]],
    ["_disableDirection", false, [false]]
];

if (isNull _object) exitWith {};
if (_positionName == "") exitWith {};

private _position = ([_positionName] call lilc_common_fnc_getDynamicPosition);
if ((count _position) != 2) exitWith {};

if !(_disableDirection) then
{
    _object setDir (_position select 1);
};

_object setPosASL (_position select 0);
