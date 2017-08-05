
params [
	["_unit", objNull, [objNull]],
	["_entryID", 0, [0]]
];

try
{
	if !([_unit] call lilc_common_fnc_isAlive) throw false;
	if (_entryID <= 0) throw false;

	private _result = ([([
		"FACTION_PDA_DATA",
		[
			["TITLE"],
			["DESCRIPTION"]
		],
		[
			["ID", _entryID]
		]
	] call lils_database_fnc_generateFetchQuery)] call lils_database_fnc_fetchObjects);

	if ((count _result) != 1) throw false;
	_result = (_result select 0);
	if ((count _result) != 2) throw false;

	[["entries_entry", _result], "lilc_pda_fnc_setSelectMenu", _unit] call lilc_common_fnc_send;
	throw true;
}
catch
{
	_exception;
};
