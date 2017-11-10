
/*
	Author(s):
		Vincent Heins
	
	Description:
		Checks whether a player can rob a _target.

	Parameter(s):
		(_this select 0) : _target : <objNull> : the unit to check

	Result:
		<bool> : can the player rob a person?

	Example(s):
		(Example 1)
		private _canRobPerson = ([player] call lilc_actions_fnc_canRobCorpse);
*/

params [
    ["_target", objNull, [objNull]]
];

if (isNull _target) exitWith { false; };
if !(alive _target) exitWith { false; };
if !(isPlayer _target) exitWith { false; };
if (_target isEqualTo player) exitWith { false; };

(
    (_target getVariable ["ACE_isUnconscious", false]) ||
    (_target getVariable ["ACE_captives_isSurrendering", false]) ||
    (_target getVariable ["lilc_actions_isBeaten", false]) ||
    (_target getVariable ["ACE_captives_isHandcuffed", false]) ||
    (_target getVariable ["lilc_isDead", false])
);
