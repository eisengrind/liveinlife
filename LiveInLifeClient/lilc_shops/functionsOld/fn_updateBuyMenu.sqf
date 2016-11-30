
_types = [lilc_shopBuy_currentShop] call lilc_shops_fnc_getAvailableTypes;
if ((count _types) <= 0) exitWith { false; };

disableSerialization;
_ui = (findDisplay 1201);
_uiList = _ui displayCtrl 1203;
_uiAmount = _ui displayCtrl 1204;
_uiCheckbox1 = _ui displayCtrl 1208;
_uiCheckbox2 = _ui displayCtrl 1209;
_uiCheckbox3 = _ui displayCtrl 1210;
_uiCheckbox4 = _ui displayCtrl 1211;
_uiCheckbox5 = _ui displayCtrl 1212;
_uiCheckbox6 = _ui displayCtrl 1213;
_uiCheckbox7 = _ui displayCtrl 1214;
_uiCheckbox8 = _ui displayCtrl 1215;
_checkboxes = [_uiCheckbox1, _uiCheckbox2, _uiCheckbox3, _uiCheckbox4, _uiCheckbox5, _uiCheckbox6, _uiCheckbox7, _uiCheckbox8];

lnbClear _uiList;

{
    if (cbChecked (_checkboxes select _forEachIndex)) then {
        private ["_config", "_type"];
        _type = (_x select 0);
        _config = (_x select 1);
        _entrys = [];
        {
            if ((getNumber (_x >> "buyable")) == 1) then {
                if (((lilc_player_faction) select 0) in (getArray (_x >> "groups"))) then {
                    private ["_info"];
                    _info = [(configName _x)] call lilc_inventory_fnc_getItemInfo;
                    _entrys pushBack [_type, (configName _x), getText(_info >> "displayName"), getText(_info >> "picture")];
                };
            };
        } forEach ("true" configClasses _config);
        _entrys sort true;
        
        {
            _uiList lnbAddRow ["", (_x select 2), "$10"];
            _uiList lnbSetPicture [[(((lnbSize _uiList) select 0) - 1), 0], (_x select 3)];
            _uiList lnbSetData [[(((lnbSize _uiList) select 0) - 1), 1], (_x select 1)];
            _uiList lnbSetData [[(((lnbSize _uiList) select 0) - 1), 2], (_x select 0)];
            _uiList lnbSetValue [[(((lnbSize _uiList) select 0) - 1), 2], ([lilc_shopBuy_currentShop, (_x select 1)] call lilc_economy_fnc_getBuyPrice)];
        } forEach _entrys;
    };
} forEach _types;

_currentLnbSelection = lnbCurSelRow _uiList;
_currentPrice = (_uiList lnbValue [_currentLnbSelection, 2]);
_uiAmount ctrlSetStructuredText parseText format["<t align='center' font='PuristaMedium'>Anzahl (%1) $%2</t>", lilc_shopBuy_amount, (lilc_shopBuy_amount * _currentPrice)];

true;
