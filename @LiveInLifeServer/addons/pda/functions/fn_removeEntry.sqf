
params [
	["_unit", objNull, [objNull]],
	["_entryID", 0, [0]]
];

try
{
	if (isNull _unit) throw false;
	if !(isPlayer _unit) throw false;
	if (_entryID <= 0) throw false;

	[(format["DELETE FROM FACTION_PDA_DATA WHERE ID = '%1';", _entryID])] call lils_database_fnc_query;

	
	throw true;
}
catch
{
	[
		["categories_removed", _exception],
		"lilc_pda_fnc_setSelectMenu",
		_unit
	] call lilc_common_fnc_send;
	_exception;
};
