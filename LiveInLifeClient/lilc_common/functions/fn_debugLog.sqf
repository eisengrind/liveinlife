
params [
	["_message", "", [""]],
	["_modName", "", [""]]
];

try
{
	if (isNil "lilc_debugMode") then
	{
		lilc_debugMode = false;
	};

	if !(lilc_debugMode) throw false;

	if !(isServer && isDedicated) then //client
	{
		[_message, _modName, "DEBUG"] call lilc_common_fnc_diag_log;
		[_message, _modName, "DEBUG"] call lilc_common_fnc_groupChat;
	}
	else //else stuff
	{
		[_message, _modName, "DEBUG"] call lilc_common_fnc_diag_log;
	};

	throw true;
}
catch
{
	_exception;
};
