
params [
	["_cash", lilc_paycheck_amount, [0]],
	["_timeout", lilc_paycheck_timeout, [0]],
	["_bankAccount", lilc_paycheck_bankName, [""]],
	["_message", true, [false]],
	["_messageFormat", lilc_paycheck_message, [""]]
];

if (isNil "_cash" || isNil "_timeout" || isNil "_bankAccount" || isNil "_message" || isNil "_messageFormat") exitWith { -1; };
if (_timeout <= -1) exitWith { -1; };
if (_messageFormat == "" && _message) exitWith {};

if (isNull (missionConfigFile >> "CfgBanks" >> _bankAccount) && _bankAccount != "") exitWith {};

private _bA = ([_bankAccount] call lilc_bank_fnc_getAccountByBankName);

if ((count _bA) != 5 && _bankAccount != "") exitWith
{
	[
		(format[
			"Du besitzt kein Bankkonto bei %1.",
			getText(missionConfigFile >> "CfgBanks" >> _bankAccount >> "displayName")
		]),
		"ERROR"
	] call lilc_ui_fnc_hint;
};

private _bID = 0;
if ((count _bA) == 5) then
{
	_bID = (_bA select 4);
};

([
	{
		(_this select 0) params [
			["_cash", 0, [0]],
			["_message", true, [false]],
			["_messageFormat", "", [""]],
			["_bID", 0, [0]]
		];

		if (_bID <= 0) then
		{
			[_cash] call lilc_cash_fnc_add;
		}
		else
		{
			[_bID, _cash] call lilc_bank_fnc_appendByID;
		};

		if (_message) then
		{
			systemChat format[_messageFormat, _cash];
		};
	},
	_timeout,
	[
		_cash,
		_message,
		_messageFormat,
		_bID
	]
] call CBA_fnc_addPerFrameHandler);
