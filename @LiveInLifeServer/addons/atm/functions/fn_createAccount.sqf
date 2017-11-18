
params [
	["_unit", objNull, [objNull]],
	["_bankName", "", [""]]
];

try
{
	if (isNull _unit) throw [];
	if (_bankName == "") throw [];
	if (isNull (missionConfigFile >> "CfgBanks" >> _bankName)) throw [];

	throw ([_unit, _bankName] call lils_bank_fnc_createAccount);
}
catch
{
	[_exception, "lilc_atm_fnc_createAccountCallback", _unit] call lilc_common_fnc_send;
};
