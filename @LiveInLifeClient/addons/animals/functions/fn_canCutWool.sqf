/* ----------------------------------------------------------------------------
Function: lilc_animals_fnc_canCutWool
Scope: private

Description:
    Checks whether player is able to cut the wool of _sheep.

Parameters:
    _sheep - The sheep to be sheared <OBJECT>

Returns:
    true or false whether the wool of _sheep can be cutted. <BOOL>

Examples:
    (begin example)
    (end)

Author:
    TheMysteriousVincent
---------------------------------------------------------------------------- */

private _sheep = param [0, objNull, [objNull]];

params [
    ["_sheep", objNull, [objNull]]
];

((_sheep getVariable ["lilc_animals_sheepCutted", _time]) <= _time)
