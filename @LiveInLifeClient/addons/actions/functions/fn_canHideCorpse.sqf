
private _target = param [0, objNull, [objNull]];

try
{
	if ([_target] call lilc_common_fnc_isAlive) throw false;
	if (missionNamespace getVariable ["lilc_actions_disableHideCorpse", false]) throw false;

	throw true;
}
catch
{
	_exception;
};
