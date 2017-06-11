
disableSerialization;
try {
    private _factionID = (player getVariable ["lilc_factionID", -1]);

    private _ui = (findDisplay 1205);
    if (isNull _ui) throw false;

    private _uiComboCategories = (_ui displayCtrl 1207);
    private _uiListItems = (_ui displayCtrl 1208);

    //lilc_factionsInterface_items -> [classname, color]
    //wantedArray = [classname, color, buyprice]

    private _items = [];
    if (lilc_shops_currentShopname == "" && _factionID > -1) then {
        {
            if ([(_x select 0)] call lilc_shops_fnc_isOtherItem) then {
                if !((_x + [0]) in _items) then {
                    _items pushBack (_x + [0]);
                };
            };
        } forEach lilc_factionsInterface_items;
    } else {
        {
            if ([(_x select 0)] call lilc_shops_fnc_isOtherItem) then {
                if !([(_x select 0), (_x select 3), (_x select 2)] in _items) then {
                    _items pushBack [(_x select 0), (_x select 3), (_x select 2)];
                };
            };
        } forEach ([lilc_shops_currentShopname] call lilc_economy_fnc_getShopItems);
    };

    if ((lbSize _uiComboCategories) <= 0) then {
        //generate Categories
        private _availableCategories = [];
        {
            private _category = ([(_x select 0)] call lilc_shops_fnc_getCategory);
            if !(_category in _availableCategories) then {
                _availableCategories pushBack _category;
            };
        } forEach _items;

        //add categories
        lbClear _uiComboCategories;
        {
            private _index = (_uiComboCategories lbAdd ([_x] call lilc_shops_fnc_getCategoryName));
            _uiComboCategories lbSetData [_index, _x];
        } forEach _availableCategories;
        lbSort [_uiComboCategories, "ASC"];
        if ((lbSize _uiComboCategories) <= 0) throw false;
        _uiComboCategories lbSetCurSel 0;
    };

    private _currentCategory = _uiComboCategories lbData (lbCurSel _uiComboCategories);
    lbClear _uiListItems;
    {
        if ([(_x select 0), _currentCategory] call lilc_shops_fnc_inCategory) then {
            private _itemConfig = ([(_x select 0)] call lilc_common_fnc_getClassnameConfig);
            private _index = (_uiListItems lbAdd getText(_itemConfig >> "displayName"));
            _uiListItems lbSetPicture [_index, getText(_itemConfig >> "picture")];
            _uiListItems lbSetData [_index, (str [(_x select 0), (_x select 1)])];
            _uiListItems lbSetValue [_index, (_x select 2)];
        };
    } forEach _items;
    lbSort [_uiComboCategories, "ASC"];
} catch {
    _exception;
};
