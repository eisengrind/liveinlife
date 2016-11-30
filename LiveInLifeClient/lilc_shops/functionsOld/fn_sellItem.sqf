
if (shop_sell_amount <= 0) exitWith {};
if ((lnbCurSelRow 1251) <= -1) exitWith { hint "Du hast nichts ausgewählt."; };

disableSerialization;
_row = (lnbCurSelRow 1251);

_classname = lnbData [1251, [_row, 1]];
_type = lnbData [1251, [_row, 2]];
_price = ([lilc_shopSell_currentShop, _classname] call lilc_economy_fnc_getSellPrice);

_count = ([_classname] call lilc_inventory_fnc_itemInInventory);

if (_count <= 0) exitWith {};
if (lilc_shopSell_amount > _count) then { lilc_shopSell_amount = _count; };

_result = 0;
for [{_i = 1}, {_i < (lilc_shopSell_amount + 1)}, {_i = _i + 1}] do {
    if (([player, _classname, _type] call lilc_inventory_fnc_remove)) then { _result = _result + 1; };
};
if (_result <= 0) exitWith { hint "Du hast nichts verkauft."; };

_price = _price * _result;
_itemInfo = ([_classname] call lilc_inventory_fnc_getItemInfo);
hint format["Du hast %1 %2/en verkauft und hast $%3 erhalten.", _result, (getText (_itemInfo >> "displayName")), _price];
lilc_player_cash = lilc_player_cash + _price;
[_classname, lilc_shopSell_currentShop, _result] call lilc_economy_fnc_setSellPrice;

lilc_shopSell_amount = 0;
call lilc_shops_fnc_updateSellMenu;
