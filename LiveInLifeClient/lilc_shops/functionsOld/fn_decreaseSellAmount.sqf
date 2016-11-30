
if ((lnbCurSelRow 1251) <= -1) exitWith {};
if !(lilc_shopSell_amount <= 0) then {
    lilc_shopSell_amount = lilc_shopSell_amount - 1;
    call lilc_shops_fnc_updateSellMenu;
};
