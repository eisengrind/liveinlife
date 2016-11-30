
private["_queryStmt","_queryResult","_key","_mode","_return","_loop", "_extDB2_ID"];
params [
    ["_queryStmt", "", [""]],
    ["_mode", 1, [0]],
    ["_multiarr", false, [false]],
	["_extDB2_ID", (uiNamespace getVariable ["extDB2_ID_1", -1]), [-1]]
];

if (_extDB2_ID == -1) exitWith {};

_key = "extDB2" callExtension format["%1:%2:%3",_mode, _extDB2_ID, _queryStmt];

if(_mode == 1) exitWith {true};

_key = call compile format["%1",_key];
_key = _key select 1;

_queryResult = "";
_loop = true;
while{_loop} do
{
	_queryResult = "extDB2" callExtension format["4:%1", _key];
	if (_queryResult isEqualTo "[5]") then {
		_queryResult = "";
		while{true} do {
			_pipe = "extDB2" callExtension format["5:%1", _key];
			if(_pipe == "") exitWith {_loop = false};
			_queryResult = _queryResult + _pipe;
		};
	}
	else
	{
		if (_queryResult isEqualTo "[3]") then
		{
			uisleep 0.1;
		} else {
			_loop = false;
		};
	};
};


_queryResult = call compile _queryResult;

if ((_queryResult select 0) == 0) exitWith { [(format ["extDB2: Protocol Error: %1", _queryResult]), "lils_database"] call lilc_common_fnc_diag_log; };
_return = (_queryResult select 1);

if(!_multiarr) then {
	_return = _return select 0;
};

_return;
