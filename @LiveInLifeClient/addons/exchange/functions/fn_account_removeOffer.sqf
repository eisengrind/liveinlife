
private _cI = (lnbCurSelRow 1503);
if (_cI <= -1) exitWith {
    ["Du hast kein Angebot ausgwählt.", "ERROR"] call lilc_ui_fnc_hint;
};

ctrlEnable [1607, false];
private _id = (lnbValue [1503, [_cI, 0]]);
[[player, "remove", [lilc_exchange_currentExchange, _id]], "lils_exchange_fnc_addToQueue"] call lilc_common_fnc_sendToServer;
