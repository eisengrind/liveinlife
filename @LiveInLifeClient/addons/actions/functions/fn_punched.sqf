/* ----------------------------------------------------------------------------
Function: lilc_actions_fnc_punched
Scope: private

Description:
    Will be called on the punched person. This will add for example a slight cam shake.

Parameters:
    _punher(optional) - The punching person. <OBJECT>

Returns:
    - <NIL>

Examples:
    (begin example)
    (end)

Author:
    TheMysteriousVincent
---------------------------------------------------------------------------- */

params [
    ["_puncher", objNull, [objNull]]
];

if (isNull _puncher) exitWith {};
player say3D [format["lilc_actions_moan%1.ogg", round random 2], 20];
addCamShake [3, 0.5, 7];
