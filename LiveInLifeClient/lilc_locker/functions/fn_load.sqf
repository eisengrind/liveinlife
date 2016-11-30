
try {
    private _lockerName = (lilc_locker_currentContainer getVariable ["lilc_lockerName", ""]);
    if (_lockerName == "") throw false;

    disableSerialization;
    private _ui = (findDisplay 1440);
    if (isNull _ui) throw false;

    private _uiComboLockers = (_ui displayCtrl 1441);
    private _index = lbCurSel _uiComboLockers;
    if (_index <= -1) throw false;

    private _data = parseNumber (_uiComboLockers lbData _index);
    if (_data <= 0) throw false;
    lilc_locker_currentID = _data;

    call lilc_locker_fnc_closeMenu;

    player removeEventHandler ["InventoryOpened", lilc_locker_onInventoryOpenedIndex];
    lilc_locker_onInventoryOpenedIndex = -1;
    player action ["Gear", lilc_locker_currentContainer];

    [[player, _data], "lils_locker_fnc_load"] call lilc_common_fnc_sendToServer;
} catch {
    _exception;
};
