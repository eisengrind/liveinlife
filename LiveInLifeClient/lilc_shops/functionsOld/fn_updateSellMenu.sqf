
if (!dialog) exitWith {};

disableSerialization;
_ui = (findDisplay 1250);
if (isNull _ui) exitWith {};

_uiList = (_ui displayCtrl 1251);
_uiUp = (_ui displayCtrl 1252);
_uiDown = (_ui displayCtrl 1253);
_uiAmount = (_ui displayCtrl 1254);
_uiSell = (_ui displayCtrl 1255);
_uiClose = (_ui displayCtrl 1256);

lnbClear _uiList;

_weapons = ("true" configClasses (missionConfigFile >> "CfgItemShops" >> lilc_shopSell_currentShop >> "weapons")) apply { [_x, "weapons"]; };
_magazines = ("true" configClasses (missionConfigFile >> "CfgItemShops" >> lilc_shopSell_currentShop >> "magazines")) apply { [_x, "magazines"]; };
_goggles = ("true" configClasses (missionConfigFile >> "CfgItemShops" >> lilc_shopSell_currentShop >> "goggles")) apply { [_x, "goggles"]; };
_headgears = ("true" configClasses (missionConfigFile >> "CfgItemShops" >> lilc_shopSell_currentShop >> "headgears")) apply { [_x, "headgears"]; };
_items = ("true" configClasses (missionConfigFile >> "CfgItemShops" >> lilc_shopSell_currentShop >> "items")) apply { [_x, "items"]; };
_backpacks = ("true" configClasses (missionConfigFile >> "CfgItemShops" >> lilc_shopSell_currentShop >> "backpacks")) apply { [_x, "backpacks"]; };
_vests = ("true" configClasses (missionConfigFile >> "CfgItemShops" >> lilc_shopSell_currentShop >> "vests")) apply { [_x, "vests"]; };
_uniforms = ("true" configClasses (missionConfigFile >> "CfgItemShops" >> lilc_shopSell_currentShop >> "uniforms")) apply { [_x, "uniforms"]; };
_items = _items + _magazines + _weapons + _goggles + _headgears + _backpacks + _vests + _uniforms;

//TODO: Check sellable
_configsToLoad = [];
{
    private ["_config"];
    _config = _x select 0;
    if (((getNumber (_config >> "sellable")) == 1) && (configName _config) in ((items player) + (assignedItems player) + (weapons player) + (magazineCargo player) + (if ((backpack player) == "") then { []; } else { [(backpack player)]; }) + (if ((vest player) == "") then { []; } else { [(vest player)] }) + (if ((uniform player) == "") then { []; } else { [(uniform player)]; }))) then {
        _configsToLoad pushBack _x;
    };
} forEach _items;

{
    _itemClassname = (configName (_x select 0));
    _type = (_x select 1);
    _itemInfo = [_itemClassname] call lilc_inventory_fnc_getItemInfo;
    if (isNull _itemInfo) exitWith {};
    _price = ([lilc_shopSell_currentShop, _itemClassname] call lilc_economy_fnc_getSellPrice);
    
    _itemCount = 0;
    { if (_x == _itemClassname) then { _itemCount = _itemCount + 1; }; } forEach ((items player) + (assignedItems player) + (weapons player) + (magazineCargo player) + (if ((backpack player) == "") then { []; } else { [(backpack player)]; }) + (if ((vest player) == "") then { []; } else { [(vest player)] }) + (if ((uniform player) == "") then { []; } else { [(uniform player)]; }));
    
    _uiList lnbAddRow ["", getText(_itemInfo >> "displayName"), str _itemCount, format["$%1", _price]];
    _uiList lnbSetPicture [[(((lnbSize _uiList) select 0) - 1), 0], (getText (_itemInfo >> "picture"))];
    _uiList lnbSetData [[(((lnbSize _uiList) select 0) - 1), 1], _itemClassname];
    _uiList lnbSetData [[(((lnbSize _uiList) select 0) - 1), 2], _type];
} forEach _configsToLoad;

_uiAmount ctrlSetStructuredText parseText format["<t align='center' font='PuristaMedium'>Anzahl (%1)</t>", lilc_shopSell_amount];
_uiAmount ctrlCommit 0;
