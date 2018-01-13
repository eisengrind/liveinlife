
private _i = (lnbCurSelRow 1500);
if (_i <= -1) exitWith
{
    ["Du hast keinen Gegenstand ausgewählt.", "ERROR"] call lilc_ui_fnc_hint;
};

private _buyAmount = (parseNumber (ctrlText 1400));
if (_buyAmount <= 0) exitWith {};

private _amount = (lnbValue [1500, [_i, 1]]);
if (_buyAmount > _amount) exitWith
{
    [(format["Dieses Angebot hat nur eine Stückanzahl von %1.", _amount]), "ERROR"] call lilc_ui_fnc_hint;
};

private _price = (lnbValue [1500, [_i, 2]]);
if !([(_price * _buyAmount)] call lilc_cash_fnc_have) exitWith
{
    ["Du besitzt nicht genügend Bargeld.", "ERROR"] call lilc_ui_fnc_hint;
};

ctrlEnable [1603, false];
private _id = (lnbValue [1500, [_i, 0]]);
[[player, "buy", [lilc_exchange_currentExchange, _id, _buyAmount]], "lils_exchange_fnc_addToQueue"] call lilc_common_fnc_sendToServer;
