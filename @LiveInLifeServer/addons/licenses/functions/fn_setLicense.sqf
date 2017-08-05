
params [
	["_unit", objNull, [objNull]],
	["_target", objNull, [objNull]],
	["_licenseName", "", [""]],
	["_status", false, [false]]
];

try
{
	if !([_target] call lilc_common_fnc_isAlive) throw false;
	
	private _itemConfig = ([_licenseName] call lilc_virtualInventory_fnc_getVirtualItemConfig);
	if (isNull _itemConfig) throw false;

	private _itemTypes = getArray(_itemConfig >> "types");
	if !("license" in _itemTypes) throw false;

	private _accountID = (_target getVariable ["lilc_accountID", 0]);
	
	private _result = [];
	_result = ([([
		"licenses",
		[
			["id"],
			["active"]
		],
		[
			["account_id", _accountID],
			["license_name", (str _licenseName)]
		]
	] call lils_database_fnc_generateFetchQuery)] call lils_database_fnc_fetchObjects);

	if ((count _result) <= 0) then
	{
		[([
			"licenses",
			[
				["id", "null", false],
				["license_name", (str _licenseName)],
				["active", (parseNumber _status)],
				["timestamp_added", "UNIX_TIMESTAMP(NOW())", false],
				["timestamp_updated", "UNIX_TIMESTAMP(NOW())", false],
				["account_id", _accountID]
			]
		] call lils_database_fnc_generateInsertQuery)] call lils_database_fnc_query;

		throw true;
	}
	else
	{
		_result = (_result select 0);
		if ((count _result) != 2) throw false;
		private _id = (_result select 0);
		private _active = (_result select 1);

		if (_active != (parseNumber _status)) then
		{
			[([
				"licenses",
				[
					["active", (parseNumber _status)]
				],
				[
					["id", _id]
				]
			] call lils_database_fnc_generateUpdateQuery)] call lils_database_fnc_query;
		};
	};

	if (_status) then
	{
		[
			_target,
			_licenseName,
			"",
			-1
		] call lilc_virtualInventory_fnc_add;
	}
	else
	{
		[
			_target,
			_licenseName,
			"",
			-1
		] call lilc_virtualInventory_fnc_remove;
	};

	throw true;
}
catch
{
	if !(_exception) then
	{
		[[2], "lilc_licenses_fnc_results", _unit] call lilc_common_fnc_send;
	}
	else
	{
		[[0], "lilc_licenses_fnc_results", _unit] call lilc_common_fnc_send;
		[[1], "lilc_licenses_fnc_results", _target] call lilc_common_fnc_send;
	};
};
