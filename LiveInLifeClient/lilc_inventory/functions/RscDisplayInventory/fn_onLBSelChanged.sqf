
disableSerialization;
params [
    ["_uiCurrentList", controlNull, [controlNull]],
    ["_index", -1, [-1]]
];
if (_index <= -1) exitWith {
    ctrlSetFocus _uiCurrentList;
    call lilc_inventory_fnc_disableMenu;
};

private _ui = (findDisplay 602);
private _uiDropDownGroup = (_ui displayCtrl 1350);

try {
    if (_index <= -1) throw false;
    private _classname = (_uiCurrentList lbData _index);
    private _displayName = (_uiCurrentList lbText _index);
    _time = time;
    if (_classname == "") then {
        _classname = ([_displayName] call lilc_inventory_fnc_findOptionsItemByDisplayName);
    };
    if (_classname == "") throw false;

    private _itemConfig = ([_classname] call lilc_common_fnc_getClassnameConfig);
    if (isNull _itemConfig) throw false;
    private _options = getArray(_itemConfig >> "lilc_dropDownOptions");
    _uiDropDownGroup ctrlShow true;

    for "_i" from 0 to 8 do {
        private _button = (_ui displayCtrl (1351 + _i));
        _button ctrlShow false;
        _button ctrlSetPosition [0, 0];
        _button ctrlCommit 0;
    };
    
    private _dropDownHeight = 0;
    for "_i" from 0 to 8 do {
        private _button = (_ui displayCtrl (1351 + _i));
        if (_i < (count _options)) then {
            private _selectedOption = (_options select _i);
            private _compiledCondition = (call compile (_selectedOption select 1));
            if (_compiledCondition isEqualType false) then {
                if (_compiledCondition) then {
                    _button ctrlSetText ([(_selectedOption select 0)] call lilc_common_fnc_localize);
                    _button ctrlRemoveAllEventHandlers "ButtonClick";
                    _button ctrlAddEventHandler ["ButtonClick", (_selectedOption select 2)];
                    _button ctrlAddEventHandler ["ButtonClick", "call lilc_inventory_fnc_disableMenu; false;"];
                    _button ctrlShow true;
                    _button ctrlSetPosition [0, ((0.022 * safezoneH) * _i)];
                    _dropDownHeight = _dropDownHeight + ((ctrlPosition _button) select 3);
                };
            };
        } else {
            _button ctrlShow false;
            _button ctrlSetPosition [0, 0];
            _button ctrlCommit 0;
        };
    };
    
    private _currentDropDownMenuPosition = (ctrlPosition _uiDropDownGroup);
    _currentDropDownMenuPosition set [3, _dropDownHeight];
    _uiDropDownGroup ctrlSetPosition _currentDropDownMenuPosition;
    _uiDropDownGroup ctrlCommit 0;

    throw true;
} catch {
    if (_exception) then {
        _uiDropDownGroup ctrlSetPosition getMousePosition;
        ctrlSetFocus _uiDropDownGroup;
        _uiDropDownGroup ctrlCommit 0;
    } else {
        call lilc_inventory_fnc_disableMenu;
    };
};
