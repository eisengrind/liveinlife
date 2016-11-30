
if ((lnbCurSelRow 1203) <= -1) exitWith {};
if !(lilc_shopBuy_amount <= 0) then {
    lilc_shopBuy_amount = lilc_shopBuy_amount - 1;
    call lilc_shops_fnc_updateBuyMenu;
};
