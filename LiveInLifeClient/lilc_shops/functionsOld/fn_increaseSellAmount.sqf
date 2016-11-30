
if ((lnbCurSelRow 1251) <= -1) exitWith {};

_classname = lnbData [1251, [(lnbCurSelRow 1251), 1]];
if (([_classname] call lilc_inventory_fnc_itemInInventory) == lilc_shopSell_amount) exitWith {};
lilc_shopSell_amount = lilc_shopSell_amount + 1;
call lilc_shops_fnc_updateSellMenu;
