
params [
	["_unit", objNull, [objNull]],
	["_targetAccountID", 0, [0]],
	["_categoryName", "", [""]],
	["_title", "", [""]],
	["_description", "", [""]]
];

try
{
	if (isNull _unit) throw false;
	if !(isPlayer _unit) throw false;
	if (_targetAccountID <= 0) throw false;
	if (_categoryName == "") throw false;
	if (_title == "") throw false;
	if (_description == "") throw false;

	[([
		"FACTION_PDA_DATA",
		[
			["ID", "NULL", false],
			["TYPE", (str _categoryName)],
			["TITLE", (str ([_title] call lils_common_fnc_stringEncode))],
			["DESCRIPTION", (str ([_description] call lils_common_fnc_stringEncode))],
			["TIMESTAMPCREATED", "UNIX_TIMESTAMP(NOW())", false],
			["ACCOUNTID", (getPlayerUID _unit)],
			["TARGETACCOUNTID", _targetAccountID]
		]
	] call lils_database_fnc_generateInsertQuery)] call lils_database_fnc_query;

	throw true;
}
catch
{
	[
		["created", _exception],
		"lilc_pda_fnc_setSelectMenu",
		_unit
	] call lilc_common_fnc_send;

	_exception;
};
