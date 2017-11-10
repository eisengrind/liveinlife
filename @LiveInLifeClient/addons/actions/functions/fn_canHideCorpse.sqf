
/*
	Author(s):
		Vincent Heins
	
	Description:
		Checks whether a player can hide a corpse or not.

	Parameter(s):
		(_this select 0) : _target : <objNull> : the unit to check

	Result:
		<bool> : can the unit hide the corpse?

	Example(s):
		(Example 1)
		private _canHideCorpse = ([player] call lilc_actions_fnc_canHideCorpse);
*/

params [
	["_target", objNull, [objNull]]
];

if ([_target] call lilc_common_fnc_isAlive || (missionNamespace getVariable ["lilc_Actions_disableHideCorpse", false])) exitWith { false; };
true;
