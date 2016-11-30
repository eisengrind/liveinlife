
lils_economy_data = [];
{
    private ["_dealerName", "_items", "_currentShopConfig"];
    _currentShopConfig = _x;
    _dealerName = (configName _currentShopConfig);

    _items = [];
    {
        {
            _items pushBack (configName _x);
        } forEach ("true" configClasses _x);
    } forEach [(_currentShopConfig >> "weapons"), (_currentShopConfig >> "magazines"), (_currentShopConfig >> "goggles"), (_currentShopConfig >> "headgears"), (_currentShopConfig >> "items"), (_currentShopConfig >> "backpacks"), (_currentShopConfig >> "vests"), (_currentShopConfig >> "uniforms")];
    
    lils_economy_data pushBack [_dealerName, _items];
} forEach ("true" configClasses (missionConfigFile >> "CfgItemShops"));

{
    private ["_dealerName", "_items", "_currentShopConfig"];
    _currentShopConfig = _x;
    _dealerName = (configName _currentShopConfig);

    _items = [];
    {
        _items pushBack (configName _x);
    } forEach ("true" configClasses (_currentShopConfig >> "vehicles"));

    lils_economy_data pushBack [_dealerName, _items];
} forEach ("true" configClasses (missionConfigFile >> "CfgVehicleShops"));

//TODO: Insert Sell shops



_preEconomyArray = [];
{
    private ["_dealerName", "_currentEcoConfig"];
    _currentEcoConfig = _x;
    _dealerName = (_currentEcoConfig select 0);
    {
        private ["_exists", "_item"];
        _exists = -1;
        _item = _x;
        //Check if Item exists - otherwise add
        if ((count _preEconomyArray) >= 1) then {
            {
                if ((_x select 0) == _item) exitWith { _exists = _forEachIndex; };
            } forEach _preEconomyArray;
        };

        _itemDealerData = ([format ["SELECT ID, CLASSNAME, MAXPRICE, MINPRICE, DEALER, SELLPRICE, BUYPRICE, SELLS, BUYS FROM ECONOMY_DATA WHERE DEALER = '""%1""' AND CLASSNAME = '""%2""' LIMIT 1", _dealerName, _item]] call lils_database_fnc_fetchObjects);
         if !((count (_itemDealerData select 0)) <= 0) then {
            _itemDealerData = _itemDealerData select 0;
            if !(_exists <= -1) then {
                ((_preEconomyArray select _exists) select 1) pushBack [
                    (_itemDealerData select 4),
                    [(_itemDealerData select 2), (_itemDealerData select 3)],
                    [[(_itemDealerData select 8), 0, 0, 0], [(_itemDealerData select 6), 0, 0, 0]], //BUYARRAY
                    [[(_itemDealerData select 7), 0, 0, 0], [(_itemDealerData select 5), 0, 0, 0]] //SELLARRAY
                ];
            } else {
                _preEconomyArray pushBack [_item, [
                    [
                        (_itemDealerData select 4),
                        [(_itemDealerData select 2), (_itemDealerData select 3)],
                        [[(_itemDealerData select 8), 0, 0, 0], [(_itemDealerData select 6), 0, 0, 0]], //BUYARRAY
                        [[(_itemDealerData select 7), 0, 0, 0], [(_itemDealerData select 5), 0, 0, 0]] //SELLARRAY
                    ]
                ]];
            };
        };
    } forEach (_currentEcoConfig select 1);
} forEach lils_economy_data;

lils_economy_data = _preEconomyArray;
