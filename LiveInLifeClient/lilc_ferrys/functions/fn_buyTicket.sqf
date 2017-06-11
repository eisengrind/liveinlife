
private _harborName = param [0, "", [""]];

try {
    private _ferryConfig = ([_harborName] call lilc_ferrys_fnc_getFerryConfig);
    if (isNull _ferryConfig) throw false;

    private _handle = ([format["Willst du wirklich ein Ticket nach %1 kaufen?", getText(_ferryConfig >> "displayName")], "Faehrkarte kaufen", "Ja", "Nein"] call BIS_fnc_guiMessage);
    if (_handle) then {
        if ([getNumber(_ferryConfig >> "ticketPrice")] call lilc_cash_fnc_have) then {
            if (([player, "lilci_ferryTicket_F"] call lilc_inventory_fnc_add)) then {
                lilc_player_cash = lilc_player_cash - (getNumber(_ferryConfig >> "ticketPrice"));
                hint "Du hast erfolgreich ein Ticket gekauft.";
            };
        } else {
            hint "Du hast nicht genügend Bargeld dabei.";
        };
    };
} catch {
    _exception;
};
