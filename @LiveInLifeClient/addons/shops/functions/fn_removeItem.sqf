
try {
    disableSerialization;
    private _ui = (findDisplay 1205);
    if (isNull _ui) throw false;

    private _uiListShoppingCartItems = (_ui displayCtrl 1209);
    private _uiTextSumOf = (_ui displayCtrl 1210);
    private _uiButtonAdd = (_ui displayCtrl 1212);
    private _uiButtonRemove = (_ui displayCtrl 1213);

    private _currentSelection = (lbCurSel _uiListShoppingCartItems);
    if (_currentSelection <= -1) then {
        ["Du musst ein Item zum auspacken auswählen!", "ERROR"] call lilc_ui_fnc_hint;
        throw false;
    };
    _uiButtonAdd ctrlEnable false;
    _uiButtonRemove ctrlEnable false;

    private _value = (_uiListShoppingCartItems lbValue _currentSelection);
    private _data = (call compile (_uiListShoppingCartItems lbData _currentSelection));

    private _itemConfig = ([(_data select 0)] call lilc_common_fnc_getClassnameConfig);

    if ((_value - 1) > 0) then {
        _uiListShoppingCartItems lbSetText [_currentSelection, format["%1x %2", (_value - 1), getText(_itemConfig >> "displayName")]];
        _uiListShoppingCartItems lbSetValue [_currentSelection, (_value - 1)];
    } else {
        _uiListShoppingCartItems lbDelete _currentSelection;
    };

    //sum up
    private _sum = 0;
    for "_i" from 0 to ((lbSize _uiListShoppingCartItems) - 1) do {
        private _data = (call compile (_uiListShoppingCartItems lbData _i));
        _sum = _sum + ((_data select 2) * (_uiListShoppingCartItems lbValue _i));
    };
    _uiTextSumOf ctrlSetStructuredText parseText format["<t align='left' font='PuristaMedium'>Summe: %1$</t>", _sum];

    _uiButtonAdd ctrlEnable true;
    _uiButtonRemove ctrlEnable true;
    throw true;
} catch {
    _exception;
};
