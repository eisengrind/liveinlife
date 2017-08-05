
if (lilc_inventory_movingActive) exitWith {};

ctrlEnable [1399, false];
lilc_inventory_movingActive = true;

try
{
    private _activeListIDC = (if (ctrlVisible 632) then
        {
            632;
        }
        else
        {
            640;
        }
    );
    private _curSel = (lbCurSel _activeListIDC);
    if (_curSel <= -1) throw false;

    private _container = (switch (true) do {
        case (ctrlVisible 632):
        {
            lilc_inventory_secondaryContainer;
        };

        case (ctrlVisible 640):
        {
            lilc_inventory_primaryContainer;
        };

        default
        {
            objNull;
        };
    });

    if (isNull _container) throw false;

    private _count = ([(ctrlText 1396)] call lilc_common_fnc_textToNumber);
    private _classname = (lbData [_activeListIDC, _curSel]);
    private _displayName = (lbText [_activeListIDC, _curSel]);

    if (_classname == "") then
    {
        _classname = ([_displayName] call lilc_inventory_fnc_findItemByDisplayName);
    };
    if (_classname == "") throw false;
    private _amount = ([_classname, _container] call lilc_inventory_fnc_itemCount); //lbValue [_activeListIDC, _curSel]);

    for "_i" from 0 to (_amount - 1) do
    {
        if (_i > (_count - 1)) throw false;
        //if (([_classname, _container] call lilc_inventory_fnc_itemCount) <= 0) exitWith {};
        if !(player canAdd _classname) throw false;
        if !([_container, _classname] call lilc_inventory_fnc_remove) then
        {
            ["Ein Gegenstand konnte nicht entfernt werden.", "ERROR"] call lilc_ui_fnc_hint;
            throw false;
        };
        if !([player, _classname] call lilc_inventory_fnc_add) then
        {
            ["Ein Gegenstand konnte nicht hinzugefügt werden.", "ERROR"] call lilc_ui_fnc_hint;
            [_container, _classname] call lilc_inventory_fnc_add;
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
