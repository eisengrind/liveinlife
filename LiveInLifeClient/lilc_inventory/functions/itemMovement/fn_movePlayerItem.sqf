disableSerialization;
_ui = (findDisplay 602);
if (isNull _ui) exitWith {};

private _uiGroundContainer = (_ui displayCtrl 632);
private _uiUniformContainer = (_ui displayCtrl 633);
private _uiVestContainer = (_ui displayCtrl 638);
private _uiBackpackContainer = (_ui displayCtrl 619);
private _uiButtonMoveContainerItem = (_ui displayCtrl 1355);

try {
    _uiGroundContainer ctrlEnable false;
    _uiButtonMovePlayerItem ctrlEnable false;
    _uiUniformContainer ctrlEnable false;
    _uiVestContainer ctrlEnable false;
    _uiBackpackContainer ctrlEnable false;

    private _item = call lilc_inventory_fnc_getPlayerInventorySelectedItem;
    if ((count _item) <= 0) throw false;

    for [{private _i = 0}, {_i < (_item select 1)}, {_i = _i + 1}] do {
        if !([player, (_item select 0)] call lilc_inventory_fnc_canAdd) exitWith {};
        [lilc_inventory_currentContainer, (_item select 0)] call lilc_inventory_fnc_add;
        [player, (_item select 0)] call lilc_inventory_fnc_remove;
    };
} catch {
    _uiGroundContainer ctrlEnable true;
    _uiButtonMoveContainerItem ctrlEnable true;
    _uiUniformContainer ctrlEnable true;
    _uiVestContainer ctrlEnable true;
    _uiBackpackContainer ctrlEnable true;
    _exception;
};
