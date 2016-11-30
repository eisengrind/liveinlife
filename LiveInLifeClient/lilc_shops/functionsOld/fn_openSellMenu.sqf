
_shopName = param [0, "", [""]];
if (_shopName == "") exitWith {};
if !(isClass (missionConfigFile >> "CfgItemShops" >> _shopName)) exitWith {};

_businessHours = [getArray(missionConfigFile >> "CfgItemShops" >> _shopName >> "businessHours" >> "start"), getArray(missionConfigFile >> "CfgItemShops" >> _shopName >> "businessHours" >> "end")];
if !((_businessHours call lilc_common_fnc_inBusinessHours)) exitWith { hint format["Unsere Geschäftszeiten sind von %1:%2 Uhr bis %3:%3 Uhr.", ((_businessHours select 0) select 0), ((_businessHours select 0) select 1), ((_businessHours select 1) select 0), ((_businessHours select 1) select 1)]; };

if (!dialog) then { createDialog "shop_sell_menu"; };
if !((lilc_player_faction select 0) in (getArray (missionConfigFile >> "CfgItemShops" >> _shopName >> "groups"))) exitWith { hint "Du kannst mit diesem Verkäufer nicht sprechen."; };


//TODO: group check
disableSerialization;
_ui = (findDisplay 1250);
if (isNull _ui) exitWith {};

lilc_shopSell_amount = 0;
lilc_shopSell_currentShop = _shopName;

_uiList = (_ui displayCtrl 1251);
_uiList lnbAddColumn 0.25;
_uiList lnbAddColumn 0.80;
_uiList lnbAddColumn 0.90;
_uiListItems = (_ui displayCtrl 1257);

lbClear _uiListItems;
{
    _itemInfo = [(configName _x)] call lilc_inventory_fnc_getItemInfo;
    _uiListItems lbAdd (getText (_itemInfo >> "displayName"));
    _uiListItems lbSetPicture [((lbSize _uiListItems) - 1), (getText (_itemInfo >> "picture"))];
} forEach (("true" configClasses (missionConfigFile >> "CfgItemShops" >> lilc_shopSell_currentShop >> "weapons")) + ("true" configClasses (missionConfigFile >> "CfgItemShops" >> lilc_shopSell_currentShop >> "magazines")) + ("true" configClasses (missionConfigFile >> "CfgItemShops" >> lilc_shopSell_currentShop >> "goggles")) + ("true" configClasses (missionConfigFile >> "CfgItemShops" >> lilc_shopSell_currentShop >> "headgears")) + ("true" configClasses (missionConfigFile >> "CfgItemShops" >> lilc_shopSell_currentShop >> "items")) + ("true" configClasses (missionConfigFile >> "CfgItemShops" >> lilc_shopSell_currentShop >> "backpacks")) + ("true" configClasses (missionConfigFile >> "CfgItemShops" >> lilc_shopSell_currentShop >> "vests")) + ("true" configClasses (missionConfigFile >> "CfgItemShops" >> lilc_shopSell_currentShop >> "uniforms")));

call lilc_shops_fnc_updateSellMenu;
