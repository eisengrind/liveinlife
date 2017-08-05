
/*
    Filename:
        fn_addDatabase.sqf
    Author:
		Vincent Heins
    Description:
        Appends a custom database to extDB3
    Param(s):
        (_this select 0) : database name : <STRING>
		(_this select 0) : protocol name (since extDB3) : <STRING>
    Result(s):
        -
*/

params [
	["_databaseName", "", [""]],
	["_protocolName", "", [""]]
];

try
{
	private _result = (call compile ("extDB3" callExtension format["9:ADD_DATABASE:%1", _databaseName]));

	if ((_result select 0) isEqualTo 0) then
	{
		[(format["extDB3: Failed to connect to database %1!", _databaseName]), "extDB3", "ERROR"] call lilc_common_fnc_diag_log;
		throw false;
	};

	[(format["extDB3: Connected to database %1", _databaseName]), "extDB3"] call lilc_common_fnc_diag_log;

	_result = (call compile ("extDB3" callExtension format["9:ADD_DATABASE_PROTOCOL:%1:SQL:%2", _databaseName, _protocolName]));

	if ((_result select 0) isEqualTo 0) then
	{
		["extDB3: database protocol setup failed!", "extDB3", "ERROR"] call lilc_common_fnc_diag_log;
		throw false;
	};

	[(format["extDB3: Added database protocol SQL for database %1 with protocol name %2", _databaseName, _protocolName]), "extDB3"] call lilc_common_fnc_diag_log;

	throw true;
}
catch
{
	_exception
};
