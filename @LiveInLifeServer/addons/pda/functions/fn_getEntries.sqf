
params [
	["_unit", objNull, [objNull]],
	["_targetAccountID", 0, [0]],
	["_categoryName", "", [""]]
];

try
{
	if (isNull _unit) throw false;
	if !(isPlayer _unit) throw false;

	if (_targetAccountID <= 0) throw false;
	if (_categoryName == "") throw false;

	private _result = [];
	_result = ([([
		"FACTION_PDA_DATA",
		[
			["ID"],
			["TITLE"]
		],
		[
			["TARGETACCOUNTID", _targetAccountID],
			["TYPE", (str _categoryName)]
		]
	] call lils_database_fnc_generateFetchQuery)] call lils_database_fnc_fetchObjects);

	for "_i" from 0 to ((count _result) - 1) do
	{
		(_result select _i) set [1, ([((_result select _i) select 1)] call lils_common_fnc_stringDecode)];
		(_result select _i) set [2, ([((_result select _i) select 2)] call lils_common_fnc_stringDecode)];
	};

	[
		["categories_entries", _result],
		"lilc_pda_fnc_setSelectMenu",
		_unit
	] call lilc_common_fnc_send;

	throw true;
}
catch
{
	_exception;
};
