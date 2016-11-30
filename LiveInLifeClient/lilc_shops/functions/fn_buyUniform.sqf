
try {
    private _uniform = ((call compile format["%1;", (lbData [1202, (lbCurSel 1202)])]) select 0);
    if (_uniform == "") throw false;
    if !(dialog) throw false;
    private _factionID = (player getVariable ["lilc_factionID", -1]);

    if (_factionID <= -1) then {
        if ((lbCurSel 1202) <= -1) throw false;
        private _cost = lbValue [1202, (lbCurSel 1202)];
        if !([_cost] call lilc_cash_fnc_have) throw false;
        lilc_player_cash = lilc_player_cash - _cost;
        hint "Uniform erfolgreich gekauft!";
    };

    ctrlEnable [1205, false];
    [player, lilc_shops_playerInventory] call lilc_inventory_fnc_setInventory;
    [player, _uniform] call lilc_inventory_fnc_add;
    lilc_shops_playerInventory = [player] call lilc_inventory_fnc_getInventory;
    [[player, lilc_shops_currentShopname], "lils_shops_fnc_buyUniform"] call lilc_common_fnc_sendToServer;
    private _handle = ["Item erfolgreich gekauft!", "Uniform gekauft", "Ok"] call BIS_fnc_guiMessage;
    ctrlEnable [1205, true];
} catch {
    _exception;
};

//TODO: send to server...
