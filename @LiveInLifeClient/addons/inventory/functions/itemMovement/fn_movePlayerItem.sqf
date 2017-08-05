
if (lilc_inventory_movingActive) exitWith {};

ctrlEnable [1399, false];
lilc_inventory_movingActive = true;

try
{
    private _aLIDC = -1;
    switch (true) do
    {
        case ((lbCurSel 633) > -1):
        {
            _aLIDC = 633;
        };

        case ((lbCurSel 638) > -1):
        {
            _aLIDC = 638;
        };

        case ((lbCurSel 619) > -1):
        {
            _aLIDC = 619;
        };
    };
    if (_aLIDC <= -1) throw false;

    private _activeListIDC = -1;
    private _container = (switch (true) do {
        case (ctrlVisible 632):
        {
            _activeListIDC = 632;
            lilc_inventory_secondaryContainer;
        };

        case (ctrlVisible 640):
        {
            _activeListIDC = 640;
            lilc_inventory_primaryContainer;
        };

        default
        {
            _activeListIDC = -1;
            objNull;
        };
    });

    if (isNull _container) throw false;
    private _curSel = (lbCurSel _aLIDC);
    if (_curSel <= -1) throw false;

    private _count = ([(ctrlText 1398)] call lilc_common_fnc_textToNumber);
    private _classname = (lbData [_aLIDC, _curSel]);
    private _displayName = (lbText [_aLIDC, _curSel]);

    if (_classname == "") then
    {
        _classname = ([_displayName] call lilc_inventory_fnc_findItemByDisplayName);
    };
    if (_classname == "") throw false;
    private _amount = ([_classname, player] call lilc_inventory_fnc_itemCount);

    for "_i" from 0 to (_amount - 1) do
    {
        if (_i > (_count - 1)) throw false;
        if !(_container canAdd _classname) throw false;
        if !([player, _classname] call lilc_inventory_fnc_remove) then
        {
            ["Ein Gegenstand konnte nicht entfernt werden.", "ERROR"] call lilc_ui_fnc_hint;
            throw false;
        };
        if !([_container, _classname] call lilc_inventory_fnc_addVehicle) then
        {
            ["Ein Gegenstand konnte nicht hinzugefügt werden.", "ERROR"] call lilc_ui_fnc_hint;
            [player, _classname] call lilc_inventory_fnc_add;
            throw false;
        };
    };
    ["Alle Gegenstände hinzugefügt."] call lilc_ui_fnc_hint;
}
catch
{
    _exception;
};

ctrlEnable [1399, true];
lilc_inventory_movingActive = false;
