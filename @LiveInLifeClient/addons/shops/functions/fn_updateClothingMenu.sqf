
try {
    disableSerialization;    
    private _ui = (findDisplay 1201);
    if (isNull _ui) throw false;
    
    private _uiListItems = (_ui displayCtrl 1202);
    private _uiComboCategories = (_ui displayCtrl 1203);
    private _uiTextBalance = (_ui displayCtrl 1204);

    lbClear _uiListItems;

    _uiListItems lbSetCurSel -1;

    private _factionID = (player getVariable ["lilc_factionID", -1]);

    private _availableItems = [];
    if (_factionID > -1) then {
        {
            if ([(_x select 0)] call lilc_shops_fnc_isUniformItem) then {
                if !((_x + [-1]) in _availableItems) then {
                    _availableItems pushBack (_x + [-1]);
                };
            };
        } forEach lilc_factionsInterface_items;
    } else {
        {
            if ([(_x select 0)] call lilc_shops_fnc_isUniformItem) then {
                if !([(_x select 0), (_x select 3), (_x select 2)] in _availableItems) then {
                    _availableItems pushBack [(_x select 0), (_x select 3), (_x select 2)];
                };
            };
        } forEach ([lilc_shops_currentShopname] call lilc_economy_fnc_getShopItems);
    };

    if ((lbSize _uiComboCategories) <= 0) then {
        private _availableCategories = [];
        {
            private _category = ([(_x select 0)] call lilc_shops_fnc_getCategory);
            if !(_category in _availableCategories) then {
                _availableCategories pushBack _category;
            };
        } forEach _availableItems;

        lbClear _uiComboCategories;
        {
            private _index = (_uiComboCategories lbAdd ([_x] call lilc_shops_fnc_getCategoryName));
            _uiComboCategories lbSetData [_index, _x];
        } forEach _availableCategories;

        lbSort [_uiComboCategories, "ASC"];
        if ((lbSize _uiComboCategories) <= 0) throw false;

        _uiComboCategories lbSetCurSel 0;
    };

    private _currentCategory = (_uiComboCategories lbData (lbCurSel _uiComboCategories));
    lbClear _uiListItems;
    
    private _removeItemData = (switch (_currentCategory) do {
        case "Glasses": { ["no_glasses", "<Remove Glasses>", -1]; };
        case "Headgear": { ["no_headgear", "<Remove Headgear>", -1]; };
        case "Vest": { ["no_vest", "<Remove Vest>", -1]; };
        case "Uniform": { ["no_uniform", "<Remove Uniform>", -1]; };
        case "Backpack": { ["no_backpack", "<Remove Backpack>", -1]; };
        default { []; };
    });

    if ((count _removeItemData) == 3) then {
        private _index = (_uiListItems lbAdd format["%1", (_removeItemData select 1)]);
        _uiListItems lbSetData [_index, (str [(_removeItemData select 0), ""])];
        _uiListItems lbSetValue [_index, (_removeItemData select 2)];
    };

    {
        if ([(_x select 0), _currentCategory] call lilc_shops_fnc_inCategory) then {
            private _itemConfig = ([(_x select 0)] call lilc_common_fnc_getClassnameConfig);
            private _index = (_uiListItems lbAdd getText(_itemConfig >> "displayName"));
            _uiListItems lbSetPicture [_index, getText(_itemConfig >> "picture")];
            _uiListItems lbSetData [_index, (str [(_x select 0), (_x select 1)])];
            _uiListItems lbSetValue [_index, (_x select 2)];
        };
    } forEach _availableItems;
    lbSort [_uiComboCategories, "ASC"];

    _uiTextBalance ctrlSetStructuredText parseText "<t align='left' font='PuristaMedium'>Summe: -</t>";
    throw true;
} catch {
    _exception;
};
