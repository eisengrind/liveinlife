
private _i = (lnbCurSelRow 1501);
if (_i <= -1) exitWith
{
    ["Du hast keinen Gegenstand ausgewählt.", "ERROR"] call lilc_ui_fnc_hint;
};

private _buyAmount = (parseNumber (ctrlText 1401));
if (_buyAmount <= 0) exitWith {};

private _amount = (lnbValue [1501, [_i, 1]]);
if (_buyAmount > _amount) exitWith
{
    [(format["Dieses Angebot hat nur eine Stückanzahl von %1.", _amount]), "ERROR"] call lilc_ui_fnc_hint;
};

private _classname = (lbData [2100, (lbCurSel 2100)]);
if (([player, _classname] call lilc_inventory_fnc_itemCountContainers) < _amount) exitWith
{
    ["Du besitzt nicht genügend Gegenstände.", "ERROR"] call lilc_ui_fnc_hint;
};

ctrlEnable [1604, false];
private _id = (lnbValue [1501, [_i, 0]]);
[[player, "sell", [lilc_exchange_currentExchange, _id, _buyAmount]], "lils_exchange_fnc_addToQueue"] call lilc_common_fnc_sendToServer;
