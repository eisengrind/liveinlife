/* ----------------------------------------------------------------------------
Function: lilc_actions_fnc_doFlipVehicle
Scope: public

Description:
    Flips a target _vehicle after a given timeout.

Parameters:
    _vehicle - The vehicle to be flipped <OBJECT>

Returns:
    true or false whether the vehicle was flipped. <BOOL>

Examples:
    (begin example)
    (end)

Author:
    TheMysteriousVincent
---------------------------------------------------------------------------- */

/*
    Author:
        Vincent Heins

    Description:
        Flips a target/given vehicle.

    Parameter(s):
        (_this select 0) : _vehicle : <objNull> : vehicle to flip

    Result:
        <bool> : whether the vehicle was flipped or not
    
    Example(s):
        (Example 1)
        private _vehicle = objNull;
        private _isVehicleFlipped = ([_vehicle] call lilc_actions_fnc_doFlipVehicle);
*/

params [
    ["_vehicle", objNull, [objNull]]
];

if (
    (isNull _vehicle) ||
    (isPlayer _vehicle) ||
    !([_vehicle] call lilc_actions_fnc_canFlipVehicle)
) exitWith { false; };

if ({ (alive _x) } count (crew _vehicle) > 0) exitWith { false; };

lilc_action_active = true;
_vehicle setVariable ["lilc_flipTimestamp", (time + 6)];
[("STR_lilc_actions_ScriptText_flippingVehicle" call BIS_fnc_localize), "WARNING"] call lilc_ui_fnc_hint;
sleep 5;

_vehicle allowDamage false;
private _vehiclePosition = ((getPosASL _vehicle) vectorAdd [0, 0, 0.4]);

_vehicle enableSimulation false;
_vehicle setVectorUp [0, 0, 1];
sleep .1;
_vehicle setPosASL _vehiclePosition;
_vehicle enableSimulation true;

[("STR_lilc_actions_ScriptText_flippedVehicle" call BIS_fnc_localize)] call lilc_ui_fnc_hint;
sleep 1;
_vehicle allowDamage true;
lilc_action_active = false;

true;
