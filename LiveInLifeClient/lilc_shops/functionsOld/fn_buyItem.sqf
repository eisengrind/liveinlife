
if ((lnbCurSelRow 1203) <= -1) exitWith { hint "Du hast keine Auswahl getroffen"; };
if (lilc_shopBuy_amount <= 0) exitWith {};
if (lilc_player_cash < (_items * _price)) exitWith { hint "Du hast nicht genügend Geld!"; };

_currentSelection = lnbCurSelRow 1203;
_type = lnbData [1203, [_currentSelection, 2]];
_classname = lnbData [1203, [_currentSelection, 1]];
_price = lnbValue [1203, [_currentSelection, 2]];

_addedItems = 0;
for [{_i = 1}, {_i < (lilc_shopBuy_amount + 1)}, {_i = _i + 1}] do {
    _status = ([player, _classname] call lilc_inventory_fnc_add);
    if (_status) then {
        _addedItems = _addedItems + 1;
    };
};

if (_addedItems <= 0) exitWith { hint "Du hast nicht genügend Platz."; };
if (lilc_player_cash < (_addedItems * _price)) exitWith { hint "Du hast nicht genügend Geld!"; };
lilc_player_cash = lilc_player_cash - (_addedItems * _price);
if (_addedItems < lilc_shopBuy_amount) then { systemChat "Du hattest für einen Teil der Items keinen Platz."; };

_itemInfo = ([_classname] call lilc_inventory_fnc_getItemInfo);
hint format["Du hast erfolgreich %1 %2 für $%3 gekauft", _addedItems, (getText(_itemInfo >> "displayName")), (_addedItems * _price)];
[_classname, lilc_shopSell_currentShop, _addedItems] call lilc_economy_fnc_setBuyPrice;
