
//add an offer of selling an item
if (ctrlvisible 2300) then {
    private _amount = (parseNumber ctrlText 1400);
    private _price = (parseNumber ctrlText 1401);

    if (_amount <= 0) exitWith {
        ["Du kannst keine Anzahl kleiner als 0 angeben.", "ERROR"] call lilc_ui_fnc_hint;
    };
    if (_price <= -1) exitWith {
        ["Du kannst keinen Preis kleiner als 0 angeben.", "ERROR"] call lilc_ui_fnc_hint;
    };

    private _cI = (lbCurSel 2100);
    if (_cI <= -1) exitWith {};

    private _container = ((lbData [2100, _cI]) call BIS_fnc_objectFromNetId);

    _cI = (lbCurSel 1500);
    if (_cI <= -1) exitWith {};

    private _classname = (lbData [1500, _cI]);
    private _v = (lbValue [1500, _cI]);

    if (_amount > _v || ([_classname, _container] call lilc_inventory_fnc_itemCount) > _v) exitWith {
        ["Du besitzt nicht genügend Gegenstände.", "ERROR"] call lilc_ui_fnc_hint;
    };

    [[player, lilc_exchange_currentExchange, _container, _classname, _amount, _price], "lils_exchange_fnc_addOffer"] call lilc_common_fnc_sendToServer;
} else {
    private _amount = (parseNumber ctrlText 1402);
    private _price = (parseNumber ctrlText 1403);

    if (_amount <= 0) exitWith {
        ["Du kannst keine Anzahl kleiner als 0 angeben.", "ERROR"] call lilc_ui_fnc_hint;
    };
    if (_price <= -1) exitWith {
        ["Du kannst keinen Preis kleiner als 0 angeben.", "ERROR"] call lilc_ui_fnc_hint;
    };

    if !([(_amount * _price)] call lilc_cash_fnc_have) exitWith {
        ["Du besitzt nicht genügend Bargeld.", "ERROR"] call lilc_ui_fnc_hint;
    };

    private _cI = (lbCurSel 1501);
    if (_cI <= -1) exitWith {};

    private _classname = (lbData [1501, _cI]);

    [[player, lilc_exchange_currentExchange, objNull, _classname, _amount, _price], "lils_exchange_fnc_addOffer"] call lilc_common_fnc_sendToServer;
};
