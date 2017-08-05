
//Permission to open PDA-menu: pda.open

try
{
	if (dialog) throw false;

	private _factionID = (player getVariable ["lilc_factionID", -1]);
	if (_factionID <= -1) throw false;

	private _factionConfig = ([_factionID] call lilc_factions_fnc_getFactionConfig);
	if ((getNumber(_factionConfig >> "havePDA")) < 1) throw false;

	if !([player] call lilc_common_fnc_isAlive) throw false;
	if !(["pda.open"] call lilc_permissions_fnc_have) throw false;

	if !(createDialog "lilcm_pda") throw false;
	if (isNull (findDisplay 1642)) throw false;

	["search"] call lilc_pda_fnc_selectMenu;

	throw true;
}
catch
{
	_exception;
};
