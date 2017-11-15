
params [
	["_status", false, [false]],
	["_price", 0, [0]]
];

if (_status) then
{
	if ([_price] call lilc_cash_fnc_remove) then
	{
		["Das Fahrzeug wurde gekauft."] call lilc_ui_fnc_hint;
	}
	else
	{
		["Du hast nicht genügend Geld."] call lilc_ui_fnc_hint;
	};
}
else
{
	[
		"Dein Fahrzeug konnte nicht gekauft werden.",
		"ERROR"
	] call lilc_ui_fnc_hint;
};
