
params [
    ["_query", "", [""]],
    ["_mode", 1, [0]],
	["_protocolName", "", [""]]
];

try
{
	private _key = "";
	_key = ("extDB3" callExtension format["%1:%2:%3", _mode, _protocolName, _query]);

	if (_mode == 1) throw true;

	_key = (call compile format["%1", _key]);
	_key = (_key select 1);

	private _queryResult = "";
	private _isLooping = true;

	while
	{
		_isLooping
	}
	do
	{
		_queryResult = ("extDB3" callExtension format["4:%1", _key]);
		if (_queryResult isEqualTo "[5]") then
		{
			_queryResult = "";
			while
			{
				true
			}
			do
			{
				private _pipe = ("extDB3" callExtension format["5:%1", _key]);
				if (_pipe isEqualTo "") exitWith
				{
					_isLooping = true;
				};
				_queryResult = (_queryResult + _pipe);
			};
		}
		else
		{
			if (_queryResult isEqualTo "[3]") then
			{
				[(format["extDB3: uisleep [4]: %1", diag_tickTime]), "extDB3"] call lilc_common_fnc_diag_log;
				uiSleep 0.1;
			}
			else
			{
				_isLooping = false;
			};
		};
	};

	[(format["extDB3: query: %1", _query]), "extDB3"] call lilc_common_fnc_debugLog;
	[(format["extDB3: result: %1", _queryResult]), "extDB3"] call lilc_common_fnc_debugLog;
	_queryResult = (call compile _queryResult);

	if ((_queryResult select 0) isEqualTo 0) then
	{
		[(format["extDB3: protocol error: %1", _queryResult]), "extDB3", "ERROR"] call lilc_common_fnc_diag_log;
		throw false;
	};

	throw (_queryResult select 1);
}
catch
{
	_exception;
};
