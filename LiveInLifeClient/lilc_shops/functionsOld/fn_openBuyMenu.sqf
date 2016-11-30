
_shopName = param [0, "", [""]];
if (_shopName == "") exitWith {};
if (!isClass (missionConfigFile >> "CfgItemShops" >> _shopName)) exitWith {};

_allowedGroups = getArray (missionConfigFile >> "CfgItemShops" >> _shopName >> "groups");
if !((player_group select 0) in _allowedGroups) exitWith { hint "Du kannst diesen Shop nicht nutzen!"; };

_businessHours = [getArray(missionConfigFile >> "CfgItemShops" >> _shopName >> "businessHours" >> "start"), getArray(missionConfigFile >> "CfgItemShops" >> _shopName >> "businessHours" >> "end")];
if !((_businessHours call lilc_common_fnc_inBusinessHours)) exitWith { hint format["Unsere Geschäftszeiten sind von %1:%2 Uhr bis %3:%3 Uhr.", ((_businessHours select 0) select 0), ((_businessHours select 0) select 1), ((_businessHours select 1) select 0), ((_businessHours select 1) select 1)]; };

disableSerialization;
if (!dialog) then { createDialog "shop_items_menu"; };

lilc_shopBuy_amount = 0;
lilc_shopBuy_currentShop = _shopName;

_backgroundTexture = "";
if ((getText (missionConfigFile >> "CfgItemShops" >> _shopname >> "background")) != "") then { _backgroundTexture = getText(missionConfigFile >> "CfgItemShops" >> _shopname >> "background"); };

_ui = (findDisplay 1201);
_uiList = _ui displayCtrl 1203;
_uiBackground = _ui displayCtrl 1202;
_uiCheckbox1 = _ui displayCtrl 1208;
_uiTextCheckbox1 = _ui displayCtrl 1216;
_uiCheckbox2 = _ui displayCtrl 1209;
_uiTextCheckbox2 = _ui displayCtrl 1217;
_uiCheckbox3 = _ui displayCtrl 1210;
_uiTextCheckbox3 = _ui displayCtrl 1218;
_uiCheckbox4 = _ui displayCtrl 1211;
_uiTextCheckbox4 = _ui displayCtrl 1219;
_uiCheckbox5 = _ui displayCtrl 1212;
_uiTextCheckbox5 = _ui displayCtrl 1220;
_uiCheckbox6 = _ui displayCtrl 1213;
_uiTextCheckbox6 = _ui displayCtrl 1221;
_uiCheckbox7 = _ui displayCtrl 1214;
_uiTextCheckbox7 = _ui displayCtrl 1222;
_uiCheckbox8 = _ui displayCtrl 1215;
_uiTextCheckbox8 = _ui displayCtrl 1223;
_checkboxes = [[_uiCheckbox1, _uiTextCheckbox1], [_uiCheckbox2, _uiTextCheckbox2], [_uiCheckbox3, _uiTextCheckbox3], [_uiCheckbox4, _uiTextCheckbox4], [_uiCheckbox5, _uiTextCheckbox5], [_uiCheckbox6, _uiTextCheckbox6], [_uiCheckbox7, _uiTextCheckbox7], [_uiCheckbox8, _uiTextCheckbox8]];
{ (_x select 0) ctrlShow false; (_x select 1) ctrlShow false; } forEach _checkboxes;

if (_backgroundTexture == "") then {
    _uiBackground ctrlSetText "#(argb,8,8,3)color(0,0,0,0.75)";
} else {
    _uiBackground ctrlSetText _backgroundTexture;
};
_uiBackground ctrlCommit 0;

_uiList lnbAddColumn 0.25;
_uiList lnbAddColumn 0.75;

_types = [_shopName] call lilc_shops_fnc_getAvailableTypes;
{
    private ["_checkbox"];
    _checkbox = (_checkboxes select _forEachIndex);
    (_checkbox select 0) cbSetChecked true;
    (_checkbox select 1) ctrlSetText ([(_x select 0)] call lilc_shops_fnc_getTypeName);
    (_checkbox select 0) ctrlShow true;
    (_checkbox select 1) ctrlShow true;
    (_checkbox select 0) ctrlCommit 0;
} forEach _types;

call lilc_shops_fnc_updateBuyMenu;
