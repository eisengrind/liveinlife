
/*
    Filename:
        fn_gaveMoney.sqf
    Author:
        Vincent Heins
    Description:
        The receive function for the give-money-thing.
    Params:
        (_this select 0) : _unit : <objNull> : unit who send money
		(_this select 1) : _amount : <integer> : amount of money
    Result:
        <bool> : whether the money were received or not
*/

params [
	["_unit", objNull, [objNull]],
	["_amount", 0, [0]]
];

try
{
	if (_amount <= 0) throw true;
	if !([_unit] call lilc_common_fnc_isAlive) throw false;
	if !([player] call lilc_common_fnc_isAlive) throw false;

	[player, _amount] call lilc_cash_fnc_add;

	
    [(format [
        "Du hast von %1 $%2 erhalten.",
        (
			if ([_unit] call lilc_login_fnc_unitIsKnown) then
			{
				format [
					"%1 %2",
					((_unit getVariable ["lilc_identity", []]) select 1),
					((_unit getVariable ["lilc_identity", []]) select 2)
				];
			}
			else
			{
				"""Unbekannt""";
			}
		),
        _amount
    ])] call lilc_ui_fnc_hint;

	throw true;
}
catch
{
	_exception;
};
