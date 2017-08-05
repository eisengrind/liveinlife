
{
    private ["_itemClassname"];
    _itemDealers = (_x select 1);
    _itemClassname = (_x select 0);
    _itemIndex = _forEachIndex;

    {
        private ["_shopClassname"];
        _shopClassname = (_x select 0);
        _shopIndex = _forEachIndex;
        _limits = (_x select 1);
        _buys = ((_x select 2) select 0);
        _buyPrices = ((_x select 2) select 1);
        _sells = ((_x select 3) select 0);
        _sellPrices = ((_x select 3) select 1);

        _newBuyPrice = (_buyPrices select 0);
        _newSellPrice = (_sellPrices select 0);

        if !((_buys select 0) <= 0) then {
            _newBuyPrice = _newBuyPrice + ((round (random (_buys select 0))) + ((_limits select 0) * 16));
        } else {
            _newBuyPrice = _newBuyPrice - (random 0.2);
        };

        if !((_sells select 0) <= 0) then {
            _newSellPrice = _newSellPrice + ((round (random (_sells select 0))) + ((_limits select 0) * 16));
        } else {
            _newSellPrice = _newSellPrice - (random 0.2);
        };

        if (_newBuyPrice <= (_limits select 1)) then { _newBuyPrice = (_limits select 1); };
        if (_newBuyPrice >= (_limits select 0)) then { _newBuyPrice = (_limits select 0); };
        if (_newSellPrice <= (_limits select 1)) then { _newSellPrice = (_limits select 1); };
        if (_newSellPrice >= (_limits select 0)) then { _newSellPrice = (_limits select 0); };

        {
            private ["_otherShopname", "_otherShopIndex"];
            _otherShopName = (_x select 0);
            _otherShopIndex = _forEachIndex;

            _newBuyPriceOtherShop = (((_x select 2) select 1) select 0);
            _newSellPriceOtherShop = (((_x select 3) select 1) select 0);

            if (_otherShopName != _shopClassname) then {
                if ((round (random 10)) < 6) then {
                    if !((round (random 2)) < 1) then {
                        _newBuyPriceOtherShop = _newBuyPriceOtherShop + ((random 0.2) + ((_limits select 0) * 32));
                    } else {
                        _newBuyPriceOtherShop = _newBuyPriceOtherShop - ((random 0.2) + ((_limits select 0) * 32));
                    };

                    if !((round (random 2)) < 1) then {
                        _newSellPriceOtherShop = _newSellPriceOtherShop + ((random 0.2) + ((_limits select 0) * 32));
                    } else {
                        _newSellPriceOtherShop = _newSellPriceOtherShop - ((random 0.2) + ((_limits select 0) * 32));
                    };

                    _newBuyPriceOtherShop = ((round (_newBuyPriceOtherShop * 100)) / 100);
                    _newSellPriceOtherShop = ((round (_newSellPriceOtherShop * 100)) / 100);

                    (((((lils_economy_data select _itemIndex) select 1) select _forEachIndex) select 2) select 1) set [0, _newBuyPriceOtherShop];
                    (((((lils_economy_data select _itemIndex) select 1) select _forEachIndex) select 3) select 1) set [0, _newSellPriceOtherShop];
                };
            };
        } forEach ((lils_economy_data select _itemIndex) select 1);

        _newBuyPrice = ((round (_newBuyPrice * 100)) / 100);
        _newSellPrice = ((round (_newSellPrice * 100)) / 100);

        _newBuyPrices = [_newBuyPrice, (_buyPrices select 0), (_buyPrices select 1), (_buyPrices select 2)];
        _newSellPrices = [_newSellPrice, (_sellPrices select 0), (_sellPrices select 1), (_sellPrices select 2)];
        _newBuys = [0, (_buys select 0), (_buys select 1), (_buys select 2)];
        _newSells = [0, (_buys select 0), (_buys select 1), (_buys select 2)];

        ((((lils_economy_data select _itemIndex) select 1) select _shopIndex) select 2) set [0, _newBuys];
        ((((lils_economy_data select _itemIndex) select 1) select _shopIndex) select 3) set [0, _newSells];
        ((((lils_economy_data select _itemIndex) select 1) select _shopIndex) select 2) set [1, _newBuyPrices];
        ((((lils_economy_data select _itemIndex) select 1) select _shopIndex) select 3) set [1, _newSellPrices];
    } forEach _itemDealers;
} forEach lils_economy_data;
