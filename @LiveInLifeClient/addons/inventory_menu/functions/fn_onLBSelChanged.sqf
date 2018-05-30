
disableSerialization;
params [
    ["_uiCurrentList", controlNull, [controlNull]],
    ["_index", -1, [-1]]
];
if (_index <= -1) exitWith {
    ctrlSetFocus _uiCurrentList;
    call lilc_inventory_menu_fnc_disableMenu;
};

private _ui = (findDisplay 602);
private _uiDropDownGroup = (_ui displayCtrl 1350);

try {
    if (_index <= -1) throw false;

    private _classname = (_uiCurrentList lbData _index);
    if (_classname == "") then {
        _classname = [_uiCurrentList lbText _index] call lilc_inventory_menu_fnc_getClassnameByDisplayName;
    };
    if (_classname == "") throw false;

    private _dropDownHeight = 0;
    private _itemOptions = [_classname] call lilc_inventory_menu_fnc_getItemOptions;
    private _itemOptionsKeys = [_itemOptions] call CBA_fnc_hashKeys;
    for "_i" from 0 to 8 do {
        private _button = _ui displayCtrl (1351 + _i);
        if (_i <= ((count _itemOptionsKeys) - 1)) then {
            private _option = [_itemOptions, _itemOptionsKeys select _i] call CBA_fnc_hashGet;
            _button ctrlSetText ((_option select 0) call BIS_fnc_localize);
            _button ctrlRemoveAllEventHandlers "ButtonClick";
            _button ctrlAddEventHandler ["ButtonClick", _option select 2];
            _button ctrlAddEventHandler ["ButtonClick", "call lilc_inventory_menu_fnc_disableMenu; false;"];
            _button ctrlShow true;
            _button ctrlEnable (call (_option select 1));
            _button ctrlSetPosition [0, ((0.022 * safezoneH) * _i)];
            _dropDownHeight = _dropDownHeight + ((ctrlPosition _button) select 3);
        } else {
            _button ctrlShow false;
            _button ctrlSetPosition [0, 0];
        };
        _button ctrlCommit 0;
    };

    private _currentDropDownMenuPosition = (ctrlPosition _uiDropDownGroup);
    _currentDropDownMenuPosition set [3, _dropDownHeight];
    _uiDropDownGroup ctrlSetPosition _currentDropDownMenuPosition;
    _uiDropDownGroup ctrlCommit 0;

    _uiDropDownGroup ctrlShow true;

    throw true;
} catch {
    if (_exception) then {
        _uiDropDownGroup ctrlSetPosition getMousePosition;
        ctrlSetFocus _uiDropDownGroup;
        _uiDropDownGroup ctrlCommit 0;
    } else {
        call lilc_inventory_menu_fnc_disableMenu;
    };
};
