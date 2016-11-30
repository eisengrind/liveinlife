
private _items = param [0, [], [[]]];

try {
    if ((count _items) <= 0) throw false;
    
    disableSerialization;
    private _ui = (findDisplay 1205);
    if (isNull _ui) throw false;

    private _uiListItems = (_ui displayCtrl 1206);
    private _uiComboCategories = (_ui displayCtrl 1207);

    lbClear _uiListItems;
    lbClear _uiComboCategories;

    _categories = [];
    {
        private _category = ([(_x select 0)] call lilc_shops_fnc_getCategory);
        if !(_category in _categories) then { _categories pushBack _category; };
    } forEach _items;

    {
        private _index = _uiComboCategories lbAdd ([(_x)] call lilc_shops_fnc_getCategoryName);
        _uiComboCategories lbSetData [_index, _x];
    } forEach _categories;

    private _curSel = lbCurSel _uiComboCategories;
    if (_curSel <= -1) throw false;

    private _category = _uiComboCategories lbData _curSel;
    if (isNil "_category") throw false;
    
    {
        private _item = (_x select 0);
        private _itemConfig = ([_item] call lilc_common_fnc_getClassnameConfig);
        private _amount = (_x select 1);

        if (_amount != 0 && ([_item, _category] call lilc_shops_fnc_inCategory)) then {
            private _index = _uiListItems lbAdd (format["%1%2", (if (_amount <= -1) then { ""; } else { format["%1x ", _amount]; }), (getText(_itemConfig >> "displayName"))]);
            _uiListItems lbSetPicture [_index, (getText(_itemConfig >> "picture"))];
            _uiListItems lbSetData [_index, _item];
            _uiListItems lbSetValue [_index, _amount];
        };
    } forEach _items;
} catch {
    _exception;
};
