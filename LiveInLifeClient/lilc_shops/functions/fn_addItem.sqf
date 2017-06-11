
try {
    disableSerialization;
    private _ui = (findDisplay 1205);
    if (isNull _ui) throw false;

    private _uiListItems = (_ui displayCtrl 1208);
    private _uiListShoppingCartItems = (_ui displayCtrl 1209);
    private _uiTextSumOf = (_ui displayCtrl 1210);
    private _uiButtonAdd = (_ui displayCtrl 1212);
    private _uiButtonRemove = (_ui displayCtrl 1213);

    private _currentSelection = (lbCurSel _uiListItems);
    if (_currentSelection <= -1) then {
        ["Du musst ein Item zum einpacken auswählen!", "ERROR"] call lilc_ui_fnc_hint; 
        throw false;
    };
    
    _uiButtonAdd ctrlEnable false;
    _uiButtonRemove ctrlEnable false;

    private _ListItemsData = (call compile (_uiListItems lbData _currentSelection));
    private _ListItemsValue = (_uiListItems lbValue _currentSelection);

    private _itemConfig = ([(_ListItemsData select 0)] call lilc_common_fnc_getClassnameConfig);

    private _available = false;
    for "_i" from 0 to ((lbSize _uiListShoppingCartItems) - 1) do {
        private _data = (call compile (_uiListShoppingCartItems lbData _i));
        if ((_data select 0) == (_ListItemsData select 0) && (_data select 1) == (_ListItemsData select 1)) exitWith {
            private _value = (_uiListShoppingCartItems lbValue _i);
            
            _uiListShoppingCartItems lbSetText [_i, format["%1x %2", (_value + 1), getText(_itemConfig >> "displayName")]];
            _uiListShoppingCartItems lbSetValue [_i, (_value + 1)];

            _available = true;
        };
    };

    if !(_available) then {
        private _index = (_uiListShoppingCartItems lbAdd format["1x %1", getText(_itemConfig >> "displayName")]);
        _uiListShoppingCartItems lbSetPicture [_index, getText(_itemConfig >> "picture")];
        _uiListShoppingCartItems lbSetValue [_index, 1];
        _uiListShoppingCartItems lbSetData [_index, (str [(_ListItemsData select 0), (_ListItemsData select 1), _ListItemsValue])];
    };

    //sum up
    private _sum = 0;
    for "_i" from 0 to ((lbSize _uiListShoppingCartItems) - 1) do {
        private _data = (call compile (_uiListShoppingCartItems lbData _i));
        _sum = _sum + ((_data select 2) * (_uiListShoppingCartItems lbValue _i));
    };
    _uiTextSumOf ctrlSetStructuredText parseText format["<t align='left' font='PuristaMedium'>Summe: <t color='#6EE6A2'>%1$</t></t>", _sum];

    _uiButtonAdd ctrlEnable true;
    _uiButtonRemove ctrlEnable true;
    throw true;
} catch {
    _exception;
};
