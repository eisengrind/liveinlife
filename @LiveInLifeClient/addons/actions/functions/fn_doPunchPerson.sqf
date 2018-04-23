/* ----------------------------------------------------------------------------
Function: lilc_actions_fnc_doPunchPerson
Scope: public

Description:
    This function will punch in the direction of _target.

Parameters:
    _target - The unit to be punched <OBJECT>

Returns:
    - <NIL>

Examples:
    (begin example)
    (end)

Author:
    TheMysteriousVincent
---------------------------------------------------------------------------- */

params [
    ["_target", objNull, [objNull]]
];

if !([_target] call lilc_actions_fnc_canPunchPerson) exitWith {};

lilc_action_active = true;
private _stm = (getStamina player);
private _stamRem = ([(missionConfigFile >> "CfgMaster" >> "punching_stamina")] call BIS_fnc_getCfgData);
if !(_stamRem isEqualType 0) exitWith { lilc_action_active = false; };
if (_stamRem < 0) exitWith { lilc_action_active = false; };
if ((_stm - _stamRem) < 0) exitWith { lilc_action_active = false; };

private _chanceDefault = ([(missionConfigFile >> "CfgMaster" >> "punching_chance")] call BIS_fnc_getCfgData);
private _chanceHeadgear = ([(missionConfigFile >> "CfgMaster" >> "punching_chanceHeadgear")] call BIS_fnc_getCfgData);
if !(_chanceDefault isEqualType 0) exitWith { lilc_action_active = false; };
if !(_chanceHeadgear isEqualType 0) exitWith { lilc_action_active = false; };

private _headgear = ([(missionConfigFile >> "CfgMaster" >> "punching_headgear")] call BIS_fnc_getCfgData);
if !(_headgear isEqualType []) exitWith { lilc_action_active = false; };

player setStamina (_stm - _stamRem);

player playActionNow "ace_gestures_engage";
sleep 0.8;

_target = cursorTarget;
if (isNull _target || !(alive _target) || !(isPlayer _target) || (_target distance player) > 2) exitWith {
    lilc_action_active = false;
    player say3D ["lilc_actions_whoosh0.ogg", 10];
};
player say3D [format["lilc_actions_punch%1.ogg", round random 2], 30];

[[player], "lilc_actions_fnc_punched", _target] call lilc_common_fnc_send;
if ((random 1) < _chanceDefault || (((headgear _target) in _headgear) && (random 1) < _chanceHeadgear)) then {
    [_target, true, (random [3, 15, 40])] call ace_medical_fnc_setUnconscious;
};

lilc_action_active = false;
