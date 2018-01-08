
disableSerialization;
params [
	"_ctrl",
	"_index"
];

private _c = (_ctrl lbData _index);
if (_c == "") exitWith {};

lnbClear 1500;
lnbClear 1501;

lnbAddRow [1500, ["lade..."]];
lnbAddRow [1501, ["lade..."]];

[
	[player, lilc_exchange_currentExchange, _c],
	"lils_exchange_fnc_getItemOffers"
] call lilc_common_fnc_sendToServer;
